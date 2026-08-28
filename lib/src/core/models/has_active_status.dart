/// Интерфейс для моделей, которые имеют признак активности.
///
/// Используется в [ReadOnlyController] для автоматической сортировки:
/// активные элементы всегда отображаются раньше неактивных.
///
/// Пример:
/// ```dart
/// class Product extends BaseModel implements HasActiveStatus {
///   @override bool isActive;
/// }
/// ```
abstract interface class HasActiveStatus {
  /// Признак активности элемента.
  bool get isActive;
}
