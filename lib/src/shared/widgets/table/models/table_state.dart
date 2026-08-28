import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/models/table_row_item.dart';

part 'table_state.freezed.dart';

@freezed
sealed class TableState<T> with _$TableState<T> {
  const factory TableState({
    @Default([]) List<T> items,
    @Default([]) List<AppTableColumn<T>> availableColumns,
    @Default({}) Set<String> hiddenColumnIds,
    @Default({}) Map<String, bool> collapsedGroups,
    @Default([]) List<TableRowItem<T>> groupedItems,
    @Default(0) int visibleItemsCount,
    @Default(false) bool isLoading,
    SortField<T>? sortBy,
    @Default(false) bool sortReverse,
  }) = _TableState<T>;
}

extension TableStateComputed<T> on TableState<T> {
  List<AppTableColumn<T>> visibleColumns([UserRole? userRole]) {
    return availableColumns.where((c) {
      if (c.isPinned) return true;
      if (hiddenColumnIds.contains(c.columnId)) return false;

      if (userRole != null) {
        if (c.visibleFor.isNotEmpty && !c.visibleFor.contains(userRole)) {
          return false;
        }
        if (c.invisibleFor.isNotEmpty && c.invisibleFor.contains(userRole)) {
          return false;
        }
      }
      return true;
    }).toList();
  }
}
