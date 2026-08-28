import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_table_column_size.freezed.dart';

@freezed
sealed class AppTableColumnSize with _$AppTableColumnSize {
  /// Фиксированная ширина в пикселях
  const factory AppTableColumnSize.fixed(double width) = _Fixed;

  /// Пропорциональная ширина (flex)
  const factory AppTableColumnSize.flex([@Default(1) int value]) = _Flex;

  /// Ширина по содержимому
  const factory AppTableColumnSize.content() = _Content;

  /// Пресеты для часто используемых колонок
  const factory AppTableColumnSize.id() = _Id;
  const factory AppTableColumnSize.date() = _Date;
  const factory AppTableColumnSize.actions() = _Actions;
}

extension AppTableColumnSizeExtension on AppTableColumnSize {
  int? get flex => maybeWhen(flex: (f) => f, orElse: () => null);

  Widget wrap(Widget child) => when(
    fixed: (w) => SizedBox(width: w, child: child),
    flex: (f) => Expanded(flex: f, child: child),
    content: () => child,
    id: () => SizedBox(width: 60, child: child),
    date: () => SizedBox(width: 130, child: child),
    actions: () => SizedBox(width: 50, child: child),
  );
}
