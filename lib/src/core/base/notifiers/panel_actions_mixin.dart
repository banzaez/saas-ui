import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Базовый миксин для панелей деталей / редактирования.
///
/// Предоставляет общие операции [open], [close] для Notifier'ов,
/// управляющих выбранным элементом боковой панели.
mixin PanelActions<T> {
  T? get state;
  set state(T? value);
  Ref get ref;

  void open(T item) => state = item;

  void close() => state = null;
}
