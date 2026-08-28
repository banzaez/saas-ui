import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';
import 'package:saas_ui/src/shared/widgets/table/models/table_state.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';

class TableRowWidget<T> extends ConsumerWidget {
  const TableRowWidget({
    super.key,
    required this.tag,
    required this.item,
    required this.dataIndex,
    this.onTap,
    this.buildRowStyle,
  });

  final String tag;
  final T item;

  /// Порядковый номер среди строк данных (без учёта заголовков групп).
  /// Используется для зебра-полосатой окраски, чтобы не сбиваться на границах групп.
  final int dataIndex;
  final ValueChanged<T>? onTap;
  final BoxDecoration? Function(T item)? buildRowStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zebraColor = TableStyle.getZebraColor(context);
    final hoverColor = TableStyle.getHoverColor(context);
    final rowStyle = buildRowStyle?.call(item);

    final state = ref.watch(appTableProvider<T>(tag));
    final visibleColumns = state.visibleColumns();

    return Material(
      color:
          rowStyle?.color ??
          (dataIndex % 2 == 0 ? Colors.transparent : zebraColor),
      child: InkWell(
        hoverColor: hoverColor,
        highlightColor: hoverColor,
        splashColor: hoverColor,
        onTap: () => onTap?.call(item),
        child: Container(
          height: AppTable.defaultRowHeight,
          padding: const EdgeInsets.only(right: 16.0),
          decoration: (rowStyle ?? const BoxDecoration()).copyWith(
            border: Border(
              bottom: BorderSide(color: TableStyle.getDividerColor(context)),
            ),
          ),
          child: Row(
            children: [
              for (int i = 0; i < visibleColumns.length; i++) ...[
                _buildSizedCell(visibleColumns[i], item),
                if (i < visibleColumns.length - 1) const _VerticalDivider(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizedCell(AppTableColumn<T> col, T item) {
    final cellWidget = Material(
      type: MaterialType.transparency,
      child: col.cellBuilder(item),
    );

    return col.size.wrap(cellWidget);
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: AppTable.defaultRowHeight,
      color: TableStyle.getVerticalDividerColor(context),
    );
  }
}
