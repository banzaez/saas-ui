/// Описывает одно поле сортировки списка.
///
/// [T] — тип модели, по полям которой производится сортировка.
class SortField<T> {
  /// Уникальный идентификатор поля (используется для сравнения через `==`).
  final String id;

  /// Человекочитаемое название поля для отображения в UI.
  final String name;

  /// Функция сравнения двух элементов.
  /// Возвращает отрицательное, ноль или положительное число
  /// (аналогично `Comparable.compareTo`).
  final int Function(T a, T b) compareTo;

  const SortField({
    required this.id,
    required this.name,
    required this.compareTo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SortField<T> &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// Базовый класс настроек сортировки для списка моделей типа [T].
///
/// Иммутабельный: изменения проводятся через [copyWith].
/// Наследуйтесь от него в конкретном классе настроек:
/// ```dart
/// class ProductSortSettings extends SortSettings<Product> {
///   @override
///   final List<SortField<Product>> availableSortFields = [...];
///
///   ProductSortSettings({super.sortingBy, super.sortingReverse});
///
///   @override
///   ProductSortSettings createCopy({
///     SortField<Product>? sortingBy,
///     bool? sortReverse,
///   }) => ProductSortSettings(
///     sortingBy: sortingBy ?? this.sortingBy,
///     sortingReverse: sortReverse ?? this.sortingReverse,
///   );
/// }
/// ```
abstract class SortSettings<T> {
  /// Текущее выбранное поле сортировки. `null` — без сортировки.
  final SortField<T>? sortingBy;

  /// Признак обратной сортировки (по убыванию).
  final bool sortingReverse;

  const SortSettings({this.sortingBy, this.sortingReverse = false});

  /// Список всех доступных полей сортировки.
  /// Отображается в [TableSortingWidget] в тулбаре таблицы.
  /// По умолчанию пуст (сортировка выполняется на сервере).
  List<SortField<T>> get availableSortFields => const [];

  /// ID поля сортировки по умолчанию.
  String? get initialSortFieldId => null;

  /// Активное поле сортировки с учётом [initialSortFieldId].
  ///
  /// Если [sortingBy] не задан явно — возвращает поле с id == [initialSortFieldId].
  /// Используется таблицей вместо [sortingBy] для корректной начальной сортировки.
  SortField<T>? get effectiveSortingBy {
    if (sortingBy != null) return sortingBy;
    final id = initialSortFieldId;
    if (id == null) return null;
    try {
      return availableSortFields.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Фабричный метод для создания копии с изменёнными параметрами.
  /// Реализуется в каждом подклассе.
  SortSettings<T> createCopy({SortField<T>? sortingBy, bool? sortReverse});

  /// Возвращает копию настроек с заменёнными полями.
  SortSettings<T> copyWith({SortField<T>? sortingBy, bool? sortReverse}) {
    return createCopy(
      sortingBy: sortingBy ?? this.sortingBy,
      sortReverse: sortReverse ?? sortingReverse,
    );
  }
}
