import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';

/// Базовый класс настроек для списков данных.
///
/// Объединяет три независимых объекта настроек:
/// - [filter] — фильтрация и поиск ([FilterSettings])
/// - [sort] — сортировка ([SortSettings])
/// - [group] — группировка ([GroupSettings]), опционально
///
/// Типовой параметр:
/// - [T] — тип модели (например, `Product`)
///
/// Пример конкретной реализации:
/// ```dart
/// class ProductSettings extends BaseListSettings<Product> {
///   @override final ProductFilterSettings filter = ProductFilterSettings();
///   @override final ProductSortSettings sort = ProductSortSettings();
/// }
/// ```
abstract class BaseListSettings<T, S extends BaseListSettings<T, S>> {
  /// Настройки фильтрации: поисковый запрос, статусы, связанные ID и т.д.
  FilterSettings<T> get filter;

  /// Настройки сортировки: текущее поле, направление, доступные поля.
  SortSettings<T> get sort;

  /// Настройки группировки (необязательно).
  /// Переопределите в подклассе для поддержки группировки в таблице.
  GroupSettings<T>? get group => null;

  /// Фабричный метод для создания копии с изменённым sort/group.
  /// Реализуется в каждом подклассе и возвращает конкретный тип [S].
  S createCopy({SortSettings<T>? sort, GroupSettings<T>? group});

  /// Возвращает копию настроек с обновлённой сортировкой.
  S copyWithSort(SortSettings<T> newSort) {
    return createCopy(sort: newSort);
  }

  /// Возвращает копию настроек с обновлённой группировкой.
  S copyWithGroup(GroupSettings<T> newGroup) {
    return createCopy(group: newGroup);
  }
}
