/// Базовый класс настроек фильтрации для списка моделей типа [T].
///
/// Наследуйтесь от него в конкретном классе настроек:
/// ```dart
/// class ProductFilterSettings extends FilterSettings<Product> {
///   @override
///   List<Product> filterItems(List<Product> items) {
///     final query = search?.toLowerCase().trim() ?? '';
///     if (query.isEmpty) return items;
///     return items.where((e) => e.name.toLowerCase().contains(query)).toList();
///   }
/// }
/// ```
///
/// Поле [search] автоматически заполняется из [ReadOnlyController.setSearchQuery].
abstract class FilterSettings<T> {
  /// Текущий поисковый запрос пользователя.
  /// `null` или пустая строка означает отсутствие поиска.
  String? search;

  FilterSettings({this.search});

  /// Применяет клиентскую фильтрацию к списку [items].
  ///
  /// По умолчанию возвращает список без изменений (подходит для серверной фильтрации).
  /// Переопределите в конкретном классе для клиентской фильтрации по полям модели [T].
  List<T> filterItems(List<T> items) => items;
}

/// Утилиты для устранения дублирования в [FilterSettings.filterItems].
///
/// Типичный паттерн — фильтрация по полям, затем текстовый поиск по строковым
/// представлениям. Класс-хелпер позволяет выразить это в одну строку.
///
/// Пример использования:
/// ```dart
/// @override
/// List<Company> filterItems(List<Company> items) {
///   return FilterHelpers.apply(
///     items,
///     search: search,
///     fieldFilters: [
///       if (status != null) (item) => item.status == status,
///     ],
///     searchExtractors: [
///       (item) => item.displayName,
///       (item) => item.id.toString(),
///     ],
///   );
/// }
/// ```
class FilterHelpers {
  FilterHelpers._();

  /// Применяет цепочку фильтрации к списку [items]:
  /// 1. Последовательно применяет предикаты из [fieldFilters]
  /// 2. Выполняет текстовый поиск по значениям, извлекаемым из [searchExtractors]
  ///
  /// [search] — поисковый запрос (может быть `null`)
  /// [fieldFilters] — предикаты для фильтрации по конкретным полям
  /// [searchExtractors] — функции, извлекающие строковые значения для поиска
  static List<T> apply<T>(
    List<T> items, {
    required String? search,
    List<bool Function(T)> fieldFilters = const [],
    List<String Function(T)> searchExtractors = const [],
  }) {
    var list = items;

    for (final predicate in fieldFilters) {
      list = list.where(predicate).toList();
    }

    final query = search?.toLowerCase().trim() ?? '';
    if (query.isNotEmpty && searchExtractors.isNotEmpty) {
      list = list.where((item) {
        return searchExtractors.any(
          (extract) => extract(item).toLowerCase().contains(query),
        );
      }).toList();
    }

    return list;
  }
}
