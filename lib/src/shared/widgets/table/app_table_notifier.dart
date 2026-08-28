import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/services/user_service.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/models/table_row_item.dart';
import 'package:saas_ui/src/shared/widgets/table/models/table_state.dart';

part 'app_table_notifier.g.dart';

@riverpod
class AppTableNotifier<T> extends _$AppTableNotifier<T> {
  // Кеш для сравнения элементов (транзитивный, не является состоянием).
  List<T>? _lastItems;

  // Группировка хранится как функция — не может быть частью Freezed state.
  String? Function(T)? _groupBy;

  // Колбэк подгрузки — передаётся из виджета.
  VoidCallback? _onLoadMore;

  // Флаг для отслеживания загрузки следующей страницы.
  bool _isLoadingMore = false;

  // Таймер для защиты от зависания isLoading
  Timer? _loadingTimeoutTimer;

  // Кеш для сравнения роли пользователя (избегает лишних rebuild).
  UserRole? _cachedRole;

  @override
  TableState<T> build(String tag) {
    _cachedRole = ref.read(userServiceProvider).value?.role;
    ref.listen(userServiceProvider, (_, next) {
      final newRole = next.value?.role;
      if (newRole == _cachedRole) return;
      _cachedRole = newRole;
      // Trigger rebuild for visibleColumns computed property
      state = state.copyWith();
    });

    ref.onDispose(() {
      _onLoadMore = null;
      _loadingTimeoutTimer?.cancel();
      _loadingTimeoutTimer = null;
    });

    return TableState<T>();
  }

  void onScrollReachedEnd() {
    if (_isLoadingMore || state.isLoading || _onLoadMore == null) return;

    _isLoadingMore = true;
    state = state.copyWith(isLoading: true);

    // Таймаут для защиты от зависания isLoading (15 секунд)
    _loadingTimeoutTimer?.cancel();
    _loadingTimeoutTimer = Timer(const Duration(seconds: 15), () {
      if (!ref.mounted || !_isLoadingMore) return;
      _resetLoading();
    });

    // Вызываем onLoadMore и гарантируем сброс isLoading по завершении
    try {
      _onLoadMore?.call();
    } catch (_) {
      // При ошибке немедленно сбрасываем isLoading
      _resetLoading();
    }
  }

  void _resetLoading() {
    _loadingTimeoutTimer?.cancel();
    _loadingTimeoutTimer = null;
    _isLoadingMore = false;
    if (ref.mounted) {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Обновляет данные в контроллере.
  ///
  /// Предполагается, что вызывающая сторона уже проверила изменения.
  /// Метод только применяет новые данные и пересчитывает зависимые поля.
  void updateData({
    required List<T> newItems,
    required List<AppTableColumn<T>> newColumns,
    String? Function(T)? newGroupBy,
    SortField<T>? newSortBy,
    bool? newSortReverse,
    bool? newIsLoading,
    VoidCallback? newOnLoadMore,
  }) {
    _onLoadMore = newOnLoadMore;

    final updateContext = _UpdateContext(
      isLoadingChanged: _isLoadStateChanged(newIsLoading),
      groupByChanged: _groupBy != newGroupBy,
      sortByChanged: state.sortBy != newSortBy,
      sortReverseChanged:
          newSortReverse != null && state.sortReverse != newSortReverse,
      itemsChanged: newItems != _lastItems,
      columnsChanged: !listEquals(newColumns, state.availableColumns),
    );

    final shouldResetLoading = _isLoadingMore && updateContext.itemsChanged;
    if (shouldResetLoading) {
      _resetLoading();
    }

    if (updateContext.itemsChanged) {
      _lastItems = newItems;
    }

    var newState = state;

    newState = _applyLoadingState(newState, updateContext, newIsLoading);
    newState = _applyGroupingState(newState, newGroupBy, updateContext);
    newState = _applySortingState(
      newState,
      newSortBy,
      newSortReverse,
      updateContext,
    );
    newState = _applyColumnsState(newState, newColumns, updateContext);
    newState = _applyItemsState(newState, newItems, updateContext);

    state = newState;
  }

  /// Контекст изменений для обновления состояния
  bool _isLoadStateChanged(bool? newIsLoading) {
    return !_isLoadingMore &&
        newIsLoading != null &&
        state.isLoading != newIsLoading;
  }

  /// Применяет изменения состояния загрузки
  TableState<T> _applyLoadingState(
    TableState<T> state,
    _UpdateContext context,
    bool? newIsLoading,
  ) {
    if (context.isLoadingChanged && newIsLoading != null) {
      return state.copyWith(isLoading: newIsLoading);
    } else if (context.shouldResetLoading) {
      return state.copyWith(isLoading: false);
    }
    return state;
  }

  /// Применяет изменения группировки
  TableState<T> _applyGroupingState(
    TableState<T> state,
    String? Function(T)? newGroupBy,
    _UpdateContext context,
  ) {
    if (context.groupByChanged) {
      _groupBy = newGroupBy;
      return state.copyWith(collapsedGroups: {});
    }
    return state;
  }

  /// Применяет изменения сортировки
  TableState<T> _applySortingState(
    TableState<T> state,
    SortField<T>? newSortBy,
    bool? newSortReverse,
    _UpdateContext context,
  ) {
    var newState = state;
    if (context.sortByChanged) {
      newState = newState.copyWith(sortBy: newSortBy);
    }
    if (context.sortReverseChanged && newSortReverse != null) {
      newState = newState.copyWith(sortReverse: newSortReverse);
    }
    return newState;
  }

  /// Применяет изменения колонок
  TableState<T> _applyColumnsState(
    TableState<T> state,
    List<AppTableColumn<T>> newColumns,
    _UpdateContext context,
  ) {
    if (!context.columnsChanged) return state;

    final existingIds = state.availableColumns.map((c) => c.columnId).toSet();
    final newHiddenIds = Set<String>.from(state.hiddenColumnIds);

    final addedHiddenIds = newColumns
        .where((col) => !col.isVisible && !existingIds.contains(col.columnId))
        .map((col) => col.columnId);

    if (addedHiddenIds.isNotEmpty) {
      newHiddenIds.addAll(addedHiddenIds);
    }

    return state.copyWith(
      availableColumns: newColumns,
      hiddenColumnIds: newHiddenIds,
    );
  }

  /// Применяет изменения элементов и пересчитывает группировку
  TableState<T> _applyItemsState(
    TableState<T> state,
    List<T> newItems,
    _UpdateContext context,
  ) {
    if (!(context.itemsChanged ||
        context.groupByChanged ||
        context.sortChanged)) {
      return state;
    }

    final newState = state.copyWith(items: newItems);
    return _sortAndGroupItems(newState);
  }

  void toggleGroup(String groupTitle) {
    final newCollapsed = Map<String, bool>.from(state.collapsedGroups);
    newCollapsed[groupTitle] = !(newCollapsed[groupTitle] ?? false);

    final newState = state.copyWith(collapsedGroups: newCollapsed);
    state = _sortAndGroupItems(newState);
  }

  TableState<T> _sortAndGroupItems(TableState<T> currentState) {
    final items = List<T>.from(currentState.items);
    final groupByFn = _groupBy;

    // Сортировка: сначала по группе (стабильность), затем по полю сортировки
    if (currentState.sortBy != null && groupByFn != null) {
      final sortField = currentState.sortBy!;
      final reverse = currentState.sortReverse;
      items.sort((a, b) {
        final groupA = groupByFn(a) ?? '';
        final groupB = groupByFn(b) ?? '';
        int result = groupA.compareTo(groupB);
        if (result != 0) return result;
        result = sortField.compareTo(a, b);
        if (reverse) result = -result;
        return result;
      });
    } else if (currentState.sortBy != null) {
      final sortField = currentState.sortBy!;
      final reverse = currentState.sortReverse;
      items.sort((a, b) {
        int result = sortField.compareTo(a, b);
        if (reverse) result = -result;
        return result;
      });
    } else if (groupByFn != null) {
      items.sort((a, b) {
        final groupA = groupByFn(a) ?? '';
        final groupB = groupByFn(b) ?? '';
        return groupA.compareTo(groupB);
      });
    }

    // Группировка за один проход
    final grouped = <TableRowItem<T>>[];

    if (_groupBy == null) {
      // Без группировки — просто создаём элементы данных
      for (var i = 0; i < items.length; i++) {
        grouped.add(TableRowItem<T>.data(item: items[i], dataIndex: i));
      }
      return currentState.copyWith(
        groupedItems: grouped,
        visibleItemsCount: items.length,
      );
    }

    // С группировкой — один проход с созданием заголовков и элементов
    String? currentGroup;
    int dataCount = 0;

    for (final item in items) {
      final groupKey = _groupBy!(item) ?? 'No group';

      if (groupKey != currentGroup) {
        currentGroup = groupKey;
        grouped.add(TableRowItem<T>.groupHeader(groupTitle: groupKey));
      }

      if (currentState.collapsedGroups[groupKey] != true) {
        grouped.add(TableRowItem<T>.data(item: item, dataIndex: dataCount));
        dataCount++;
      }
    }

    return currentState.copyWith(
      groupedItems: grouped,
      visibleItemsCount: dataCount,
    );
  }

  void toggleColumnVisibility(String columnId) {
    final column = state.availableColumns.firstWhere(
      (c) => c.columnId == columnId,
      orElse: () => throw Exception('Column not found'),
    );
    if (column.isPinned) return;

    final newHidden = Set<String>.from(state.hiddenColumnIds);
    if (newHidden.contains(columnId)) {
      newHidden.remove(columnId);
    } else {
      newHidden.add(columnId);
    }

    // Trigger rebuild for visibleColumns computed property
    state = state.copyWith(hiddenColumnIds: newHidden);
  }

  void updateColumn(int index, AppTableColumn<T> newColumn) {
    if (index >= 0 && index < state.availableColumns.length) {
      final newColumns = List<AppTableColumn<T>>.from(state.availableColumns);
      newColumns[index] = newColumn;
      // Trigger rebuild for visibleColumns computed property
      state = state.copyWith(availableColumns: newColumns);
    }
  }

  void moveColumn(int oldIndex, int newIndex) {
    if (oldIndex >= 0 &&
        oldIndex < state.availableColumns.length &&
        newIndex >= 0 &&
        newIndex < state.availableColumns.length) {
      final newColumns = List<AppTableColumn<T>>.from(state.availableColumns);
      final col = newColumns.removeAt(oldIndex);
      newColumns.insert(newIndex, col);
      // Trigger rebuild for visibleColumns computed property
      state = state.copyWith(availableColumns: newColumns);
    }
  }
}

/// Контекст для отслеживания изменений в updateData
class _UpdateContext {
  final bool isLoadingChanged;
  final bool groupByChanged;
  final bool sortByChanged;
  final bool sortReverseChanged;
  final bool itemsChanged;
  final bool columnsChanged;

  _UpdateContext({
    required this.isLoadingChanged,
    required this.groupByChanged,
    required this.sortByChanged,
    required this.sortReverseChanged,
    required this.itemsChanged,
    required this.columnsChanged,
  });

  bool get sortChanged => sortByChanged || sortReverseChanged;
  bool get shouldResetLoading => itemsChanged;
}
