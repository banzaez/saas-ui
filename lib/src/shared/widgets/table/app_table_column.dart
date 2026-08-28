import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

part 'app_table_column.freezed.dart';

@freezed
sealed class AppTableColumn<T> with _$AppTableColumn<T> {
  const factory AppTableColumn({
    String? id,
    required AppTableCell Function(T item) cellBuilder,
    String? title,
    IconData? icon,
    @Default(AppTableColumnSize.flex(1)) AppTableColumnSize size,
    @Default(true) bool isVisible,
    @Default(false) bool isPinned,
    @Default([]) List<UserRole> visibleFor,
    @Default([]) List<UserRole> invisibleFor,
  }) = _AppTableColumn<T>;

  const AppTableColumn._();

  /// Стабильный идентификатор колонки.
  /// Приоритет: [id] → [title] → codePoint [icon].
  String get columnId => id ?? title ?? icon!.codePoint.toString();
}

/// Дефолтная колонка "Действия"
extension AppTableDefaultActionsColumn<T> on AppTableColumn<T> {
  static AppTableColumn<T> create<T>({
    required AppTableCell Function(T item) cellBuilder,
  }) {
    return AppTableColumn<T>(
      id: 'actions',
      title: 'Действия',
      icon: Icons.more_horiz,
      size: const AppTableColumnSize.actions(),
      isPinned: true,
      cellBuilder: cellBuilder,
    );
  }
}
