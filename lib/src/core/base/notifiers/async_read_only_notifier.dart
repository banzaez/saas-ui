import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/base_model.dart';
import '../../models/base_list_settings.dart';
import '../../models/mixins/filter_with_pagination.dart';
import '../../models/controller/app_table_source_mixin.dart';
import '../crud_repository.dart';

/// Базовый миксин для Notifier'ов с поддержкой только чтения списка.
///
/// Не использует прямую привязку к AsyncNotifier через 'on', чтобы избежать
/// конфликтов с генерируемыми базовыми классами в Riverpod 3.x.
mixin AsyncReadOnlyNotifierMixin<
  T extends BaseModel,
  ID,
  S extends BaseListSettings<T, S>
> {
  /// Текущее состояние.
  AsyncValue<List<T>> get state;
  set state(AsyncValue<List<T>> value);

  /// Ссылка на провайдеры.
  Ref get ref;

  /// Репозиторий для получения данных.
  ReadOnlyRepository<T, ID, S> get repository;

  /// Текущие настройки.
  S get settings;

  Timer? _debounceTimer;

  /// Отменяет debounce-таймер. Вызывайте в [Ref.onDispose].
  void cancelDebounce() => _debounceTimer?.cancel();

  /// Инициализация или полная перезагрузка данных.
  @mustCallSuper
  Future<List<T>> reloadItems() async {
    final s = settings;
    if (s is FilterWithPagination) {
      (s as FilterWithPagination).resetPage();
    }
    return fetchItemsInternal();
  }

  /// Загрузка следующей страницы.
  ///
  /// При ошибке запроса список не сбрасывается: остаётся [AsyncData] с уже
  /// загруженными элементами, смещение пагинации откатывается (как будто
  /// [FilterWithPagination.nextPage] не вызывали). Ошибку можно обработать в UI
  /// по факту неизменившегося списка / отдельному слушателю.
  Future<void> fetchNextPage() async {
    final s = settings;
    if (s is! FilterWithPagination) return;

    if (state.isLoading || state.isRefreshing) return;

    final pagination = s as FilterWithPagination;
    pagination.nextPage();

    final previousData = state.value ?? [];

    try {
      final response = await repository.listAll(settings);

      if (!ref.mounted) return;

      if (response.isSuccess) {
        state = AsyncData([...previousData, ...response.result ?? []]);
      } else {
        pagination.offset -= pagination.limit;
        state = AsyncData(List<T>.from(previousData));
      }
    } catch (_) {
      if (!ref.mounted) return;
      pagination.offset -= pagination.limit;
      state = AsyncData(List<T>.from(previousData));
    }
  }

  /// Перезагружает список с показом [AsyncLoading].
  Future<void> reloadWithState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => reloadItems());
  }

  /// Применяет мутацию фильтра и перезагружает список.
  ///
  /// Вызывает [mutateFilter] для изменения параметров фильтра,
  /// затем сбрасывает состояние в [AsyncLoading] и перезагружает данные.
  Future<void> applyFilter(void Function() mutateFilter) async {
    mutateFilter();
    await reloadWithState();
  }

  /// Откладывает выполнение [callback] на [delay], отменяя предыдущий таймер.
  void _debounce(
    VoidCallback callback, {
    Duration delay = const Duration(milliseconds: 500),
  }) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, () {
      if (ref.mounted) {
        callback();
      }
    });
  }

  /// Применяет мутацию фильтра с отложенной перезагрузкой.
  ///
  /// Фильтр изменяется немедленно, а перезагрузка данных откладывается
  /// на [delay] и сбрасывается при повторном вызове.
  void debounceFilter(
    void Function() mutateFilter, {
    Duration delay = const Duration(milliseconds: 500),
  }) {
    mutateFilter();
    _debounce(() => reloadWithState(), delay: delay);
  }

  /// Установка поискового запроса.
  Future<void> setSearchQuery(String query) =>
      applyFilter(() => settings.filter.search = query);

  /// Внутренний метод для выполнения запроса.
  @protected
  Future<List<T>> fetchItemsInternal() async {
    cancelDebounce();
    final response = await repository.listAll(settings);
    if (response.isSuccess) {
      return response.result ?? [];
    } else {
      throw Exception(response.errorString);
    }
  }

  /// Принудительное обновление UI таблицы без обращения к серверу.
  ///
  /// Пересоздаёт список в [AsyncData], чтобы триггерить перестроение
  /// зависимых виджетов после локальных изменений (сортировка, группировка).
  void notifyTableSourceChanged() {
    switch (state) {
      case AsyncData(:final value):
        state = AsyncData(List<T>.from(value));
      default:
        break;
    }
    if (this is AppTableSourceMixin<T, dynamic>) {
      (this as AppTableSourceMixin<T, dynamic>).onTableSourceChanged?.call();
    }
  }
}
