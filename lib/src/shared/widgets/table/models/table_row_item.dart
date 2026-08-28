import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_row_item.freezed.dart';

@freezed
sealed class TableRowItem<T> with _$TableRowItem<T> {
  const factory TableRowItem.data({required T item, required int dataIndex}) =
      TableRowData<T>;

  const factory TableRowItem.groupHeader({required String groupTitle}) =
      TableGroupHeaderItem<T>;
}
