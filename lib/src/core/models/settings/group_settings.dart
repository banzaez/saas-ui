/// Описывает одно поле группировки списка.
///
/// [T] — тип модели, по полям которой производится группировка.
class GroupField<T> {
  /// Уникальный идентификатор поля (используется для сравнения через `==`).
  final String id;

  /// Человекочитаемое название группировки для отображения в UI.
  final String name;

  /// Функция, возвращающая ключ группы для элемента.
  /// Если возвращает `null` — элемент не входит ни в какую группу.
  final String? Function(T item)? groupBy;

  const GroupField({required this.id, required this.name, this.groupBy});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupField<T> &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/// Базовый класс настроек группировки для списка моделей типа [T].
///
/// Иммутабельный: изменения проводятся через [copyWith].
/// Наследуйтесь от него в конкретном классе настроек:
/// ```dart
/// class ProductGroupSettings extends GroupSettings<Product> {
///   @override
///   final List<GroupField<Product>> availableGroupFields = [...];
///
///   ProductGroupSettings({GroupField<Product>? groupBy})
///       : super(groupBy: groupBy);
///
///   @override
///   ProductGroupSettings createCopy({GroupField<Product>? groupBy}) =>
///       ProductGroupSettings(groupBy: groupBy);
/// }
/// ```
abstract class GroupSettings<T> {
  /// Список всех доступных вариантов группировки.
  /// Отображается в [TableGroupingWidget] в тулбаре таблицы.
  List<GroupField<T>> get availableGroupFields;

  /// ID поля группировки по умолчанию.
  /// Если не переопределено — используется первый элемент [availableGroupFields].
  String? get initialGroupFieldId => null;

  /// Текущая выбранная группировка (явно задана пользователем).
  final GroupField<T>? groupBy;

  GroupSettings({this.groupBy});

  /// Активная группировка с учётом [initialGroupFieldId].
  ///
  /// Если [groupBy] не задан явно — возвращает поле с id == [initialGroupFieldId].
  /// Используется таблицей вместо [groupBy] для корректной начальной группировки.
  GroupField<T>? get effectiveGroupBy {
    if (groupBy != null) return groupBy;
    final id = initialGroupFieldId;
    if (id == null) return null;
    try {
      return availableGroupFields.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Фабричный метод для создания копии с изменёнными параметрами.
  /// Реализуется в каждом подклассе.
  GroupSettings<T> createCopy({GroupField<T>? groupBy});

  /// Возвращает копию настроек с заменёнными полями.
  GroupSettings<T> copyWith({GroupField<T>? groupBy}) {
    return createCopy(groupBy: groupBy ?? this.groupBy);
  }
}
