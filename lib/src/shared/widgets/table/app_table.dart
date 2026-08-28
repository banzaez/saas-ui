import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';

import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/app_progress_indicator.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/models/table_row_item.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_group_header.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_header.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_side_panel.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_pagination.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_row.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_sorting.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_grouping.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_empty_state.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';

/// Виджет таблицы с поддержкой пагинации, кастомных ячеек и группировки строк.
class AppTable<T> extends ConsumerStatefulWidget {
  const AppTable({
    super.key,
    this.onLoadMore,
    this.onTap,
    this.sourceController,
    this.items,
    required this.columns,
    this.buttons,
    this.buildRowStyle,
  });

  static const double defaultHeaderHeight = 48.0;
  static const double defaultGroupHeaderHeight = 48.0;
  static const double defaultRowHeight = 72.0;

  final AppTableSource<T>? sourceController;
  final List<T>? items;
  final VoidCallback? onLoadMore;
  final ValueChanged<T>? onTap;
  final List<AppTableColumn<T>> columns;
  final List<Widget>? buttons;
  final BoxDecoration? Function(T item)? buildRowStyle;

  @override
  ConsumerState<AppTable<T>> createState() => _AppTableState<T>();
}

class _AppTableState<T> extends ConsumerState<AppTable<T>> {
  late final String _tag;
  late final ScrollController _scrollController;
  late final AppTableNotifier<T> _notifier;

  List<T> get _items => widget.sourceController?.items ?? widget.items ?? <T>[];
  bool get _isLoading => widget.sourceController?.isLoading ?? false;
  BaseListSettings<T, dynamic>? get _settings =>
      widget.sourceController?.settings;
  // Используем effectiveGroupBy, чтобы учитывать initialGroupFieldId по умолчанию
  String? Function(T)? get _groupBy =>
      _settings?.group?.effectiveGroupBy?.groupBy;

  AppTableSource<T>? _registeredSource;

  /// Debounce таймер для защиты от множественных вызовов onScrollReachedEnd.
  Timer? _scrollDebounceTimer;

  @override
  void initState() {
    super.initState();
    _tag = _buildStableTag();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _notifier = ref.read(appTableProvider<T>(_tag).notifier);
    _scheduleSyncData();
    _registerSourceCallback();
  }

  /// Строит стабильный тег на основе ключа виджета или колонок.
  /// Это предотвращает пересоздание провайдера при rebuild.
  String _buildStableTag() {
    // Используем ключ виджета как основу для тега
    if (widget.key != null) {
      return 'table_${widget.key.toString()}';
    }

    // Если есть sourceController, используем его hashCode
    if (widget.sourceController != null) {
      return 'table_${widget.sourceController.hashCode}';
    }

    // Фолбэк: используем идентификаторы колонок
    final columnIds = widget.columns.map((c) => c.columnId).join('_');
    return 'table_$columnIds';
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.pixels <
        _scrollController.position.maxScrollExtent - 200) {
      return;
    }

    // Debounce: отменяем предыдущий таймер и устанавливаем новый
    _scrollDebounceTimer?.cancel();
    _scrollDebounceTimer = Timer(const Duration(milliseconds: 150), () {
      if (mounted) {
        _notifier.onScrollReachedEnd();
      }
    });
  }

  /// Нельзя вызывать [updateData] синхронно из [build]/[didUpdateWidget] — Riverpod запрещает
  /// менять провайдеры во время построения дерева.
  void _scheduleSyncData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _syncData();
    });
  }

  void _syncData() {
    _notifier.updateData(
      newItems: _items,
      newColumns: widget.columns,
      newGroupBy: _groupBy,
      newSortBy: _settings?.sort.effectiveSortingBy,
      newSortReverse: _settings?.sort.sortingReverse,
      newIsLoading: _isLoading,
      newOnLoadMore: widget.onLoadMore,
    );
  }

  void _registerSourceCallback() {
    final source = widget.sourceController;
    if (source != null) {
      source.onTableSourceChanged = _onSourceChanged;
      _registeredSource = source;
    }
  }

  void _unregisterSourceCallback() {
    _registeredSource?.onTableSourceChanged = null;
    _registeredSource = null;
  }

  void _onSourceChanged() {
    if (!mounted) return;
    _scheduleSyncData();
  }

  @override
  void didUpdateWidget(covariant AppTable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.sourceController != widget.sourceController) {
      _unregisterSourceCallback();
      _registerSourceCallback();
    }

    // Проверка изменений через listEquals для надёжности
    final bool itemsChanged =
        !listEquals(
          widget.sourceController?.items,
          oldWidget.sourceController?.items,
        ) ||
        !listEquals(widget.items, oldWidget.items);
    final bool columnsChanged = !listEquals(widget.columns, oldWidget.columns);
    final bool otherChanged =
        oldWidget.onLoadMore != widget.onLoadMore ||
        _isLoading != (oldWidget.sourceController?.isLoading ?? false);

    if (itemsChanged || columnsChanged || otherChanged) {
      _scheduleSyncData();
    }
  }

  @override
  void dispose() {
    _unregisterSourceCallback();
    _scrollDebounceTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Контролы сортировки/группировки показываем только если есть sourceController
    final hasController = widget.sourceController != null;
    final sorts = hasController
        ? (_settings?.sort.availableSortFields ?? <SortField<T>>[])
        : <SortField<T>>[];
    final groups = hasController
        ? (_settings?.group?.availableGroupFields ?? <GroupField<T>>[])
        : <GroupField<T>>[];
    final bool hasToolbar = sorts.isNotEmpty || groups.isNotEmpty;

    return AppContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (hasToolbar) ...[
            _buildToolbar(context, sorts: sorts, groups: groups),
            Divider(color: TableStyle.getDividerColor(context), height: 1),
          ],
          Expanded(child: _buildScrollableTable(context)),
          Divider(color: TableStyle.getDividerColor(context), height: 1),
          _buildPaginationFooter(context),
        ],
      ),
    );
  }

  Widget _buildToolbar(
    BuildContext context, {
    required List<SortField<T>> sorts,
    required List<GroupField<T>> groups,
  }) {
    final ctrl = widget.sourceController!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        spacing: 12.0,
        children: [
          if (sorts.isNotEmpty)
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: TableSortingWidget<T>(
                  initialValue: _settings?.sort.effectiveSortingBy,
                  items: sorts,
                  onChanged: ctrl.setSortingBy,
                  isReverse: _settings?.sort.sortingReverse ?? false,
                  onReverseChanged: ctrl.setSortingReverse,
                ),
              ),
            ),
          if (groups.isNotEmpty)
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: TableGroupingWidget<T>(
                  // effectiveGroupBy учитывает initialGroupFieldId как дефолт
                  initialValue: _settings?.group?.effectiveGroupBy,
                  items: groups,
                  onChanged: ctrl.setGroupingBy,
                ),
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildScrollableTable(BuildContext context) => _ScrollableTable<T>(
    tag: _tag,
    scrollController: _scrollController,
    onTap: widget.onTap,
    buildRowStyle: widget.buildRowStyle,
  );

  Widget _buildPaginationFooter(BuildContext context) {
    final itemsCount = ref.watch(
      appTableProvider<T>(_tag).select((s) => s.visibleItemsCount),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          TablePagination(itemsCount: itemsCount),
          const Spacer(),
          ...?widget.buttons,
        ],
      ),
    );
  }
}

class _ScrollableTable<T> extends ConsumerWidget {
  const _ScrollableTable({
    required this.tag,
    required this.scrollController,
    this.onTap,
    this.buildRowStyle,
  });

  final String tag;
  final ScrollController scrollController;
  final ValueChanged<T>? onTap;
  final BoxDecoration? Function(T item)? buildRowStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasTogglableColumns = ref.watch(
      appTableProvider<T>(
        tag,
      ).select((s) => s.availableColumns.any((c) => !c.isPinned)),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TableHeader<T>(tag: tag),
              Expanded(
                child: _ListOrEmptyState<T>(
                  tag: tag,
                  scrollController: scrollController,
                  onTap: onTap,
                  buildRowStyle: buildRowStyle,
                ),
              ),
            ],
          ),
        ),
        if (hasTogglableColumns) TableSidePanel<T>(tag: tag),
      ],
    );
  }
}

class _ListOrEmptyState<T> extends ConsumerWidget {
  const _ListOrEmptyState({
    required this.tag,
    required this.scrollController,
    this.onTap,
    this.buildRowStyle,
  });

  final String tag;
  final ScrollController scrollController;
  final ValueChanged<T>? onTap;
  final BoxDecoration? Function(T item)? buildRowStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (:groupedItems, :isLoading) = ref.watch(
      appTableProvider<T>(
        tag,
      ).select((s) => (groupedItems: s.groupedItems, isLoading: s.isLoading)),
    );

    if (groupedItems.isEmpty) {
      if (isLoading) {
        return const Center(child: AppProgressIndicator());
      }
      return const TableEmptyState();
    }

    return ListView.builder(
      controller: scrollController,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      addSemanticIndexes: false,
      itemCount: groupedItems.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == groupedItems.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Center(child: AppProgressIndicator()),
          );
        }

        final rowItem = groupedItems[index];

        return rowItem.when(
          data: (item, dataIndex) => TableRowWidget<T>(
            key: ValueKey('row_${dataIndex}_$tag'),
            tag: tag,
            item: item,
            dataIndex: dataIndex,
            onTap: onTap,
            buildRowStyle: buildRowStyle,
          ),
          groupHeader: (groupTitle) => TableGroupHeader<T>(
            key: ValueKey('group_${groupTitle}_$tag'),
            tag: tag,
            groupTitle: groupTitle,
          ),
        );
      },
    );
  }
}
