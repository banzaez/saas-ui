import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../base_list_settings.dart';
import '../settings/group_settings.dart';
import '../settings/sort_settings.dart';
import 'displayed_table_items.dart';

/// Контракт источника данных для таблицы [AppTable].
///
/// Определяет минимальный набор членов, который [AppTable] ожидает от
/// контроллера. Все типизирован только по [T] — типу модели строки.
abstract class AppTableSource<T> {
  List<T> get items;
  bool get isLoading;
  BaseListSettings<T, dynamic> get settings;
  void setSortingBy(SortField<T>? value);
  void setSortingReverse(bool value);
  void setGroupingBy(GroupField<T>? value);

  /// Колбэк, вызываемый при изменении данных источника.
  /// Реализуется через [AppTableSourceMixin].
  VoidCallback? get onTableSourceChanged;
  set onTableSourceChanged(VoidCallback? value);
}

/// Источник данных для таблицы [AppTable].
///
/// Сочетает контракт и дефолтную реализацию boilerplate-методов
/// (items, isLoading, setSortingBy, setSortingReverse, setGroupingBy).
///
/// [T] — тип модели, [S] — тип настроек (должен совпадать с
/// типом в [AsyncReadOnlyNotifierMixin]).
///
/// ```dart
/// @riverpod
/// class Products extends _$Products
///     with
///         AsyncReadOnlyNotifierMixin<Product, int, ProductSettings>,
///         AsyncCrudNotifierMixin<Product, int, ProductSettings>,
///         AppTableSource<Product, ProductSettings> {
///   @override
///   ProductSettings _settings = ProductSettings();
///   @override ProductSettings get settings => _settings;
///   @override set settings(ProductSettings v) => _settings = v;
///
///   @override
///   ProductsRepository get repository => ref.read(productsRepositoryProvider);
///
///   @override
///   FutureOr<List<Product>> build() => reloadItems();
///
///   @override
///   Product createNewInstance() => Product();
/// }
/// ```
mixin AppTableSourceMixin<T, S extends BaseListSettings<T, S>>
    implements AppTableSource<T> {
  /// Текущее состояние (предоставляется AsyncReadOnlyNotifierMixin).
  AsyncValue<List<T>> get state;

  /// Уведомление об изменении данных таблицы (из AsyncReadOnlyNotifierMixin).
  void notifyTableSourceChanged();

  /// Настройки списка (предоставляется AsyncReadOnlyNotifierMixin или классом).
  @override
  S get settings;

  /// Сеттер для обновления настроек (иммутабельная замена через copyWith).
  set settings(S value);

  /// Колбэк, вызываемый при изменении данных источника.
  /// [AppTable] регистрирует его для реактивной синхронизации.
  @override
  VoidCallback? onTableSourceChanged;

  /// Список элементов для отображения в таблице (с фильтрацией и сортировкой).
  @override
  List<T> get items {
    final raw = switch (state) {
      AsyncData(:final value) => value,
      _ => <T>[],
    };
    return displayedTableItems<T>(raw, settings);
  }

  /// Признак выполнения загрузки.
  @override
  bool get isLoading => state.isLoading || state.isRefreshing;

  /// Устанавливает текущее поле сортировки.
  @override
  void setSortingBy(SortField<T>? value) {
    if (value == null) return;
    final newSort = settings.sort.copyWith(sortingBy: value);
    settings = settings.copyWithSort(newSort);
    notifyTableSourceChanged();
  }

  /// Переключает направление сортировки.
  @override
  void setSortingReverse(bool value) {
    final newSort = settings.sort.copyWith(sortReverse: value);
    settings = settings.copyWithSort(newSort);
    notifyTableSourceChanged();
  }

  /// Устанавливает текущее поле группировки.
  /// Работает только если [BaseListSettings.group] определён в настройках.
  @override
  void setGroupingBy(GroupField<T>? value) {
    if (value == null) return;
    final currentGroup = settings.group;
    if (currentGroup == null) return;
    final newGroup = currentGroup.copyWith(groupBy: value);
    settings = settings.copyWithGroup(newGroup);
    notifyTableSourceChanged();
  }
}
