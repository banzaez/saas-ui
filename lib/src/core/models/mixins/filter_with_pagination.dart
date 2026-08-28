/// Миксин для настроек с поддержкой постраничной загрузки (пагинации).
///
/// Хранит текущее смещение ([offset]) и количество элементов на странице ([limit]).
/// Используется в [ReadOnlyController] для определения режима добавления данных:
/// первая страница — список заменяется, следующие страницы — добавляются в конец.
///
/// Пример добавления пагинации к классу настроек:
/// ```dart
/// class LegalEntitySettings
///     extends BaseListSettings<...>
///     with FilterWithPagination {
///   LegalEntitySettings({
///     // ... other parameters
///     int? limit,
///     int? offset,
///   }) {
///     if (limit != null) this.limit = limit;
///     if (offset != null) this.offset = offset;
///   }
/// }
/// ```
mixin FilterWithPagination {
  /// Текущее смещение в списке (индекс первого элемента текущей страницы).
  int offset = 0;

  /// Количество элементов на одной странице.
  int limit = 100;

  /// Устанавливает параметры для загрузки всех элементов (снимает пагинацию).
  void loadAll() {
    offset = 0;
    limit = 10000; // Достаточно большое число для загрузки "всех" элементов
  }

  /// Номер текущей страницы (начинается с 1).
  int get page => (offset / limit).floor() + 1;

  /// Переходит к следующей странице (увеличивает [offset] на [limit]).
  void nextPage() => offset += limit;

  /// Сбрасывает пагинацию к первой странице (устанавливает [offset] в 0).
  void resetPage() => offset = 0;
}
