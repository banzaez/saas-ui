import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/models/table_state.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_header_cell.dart';

class TableHeader<T> extends ConsumerWidget {
  const TableHeader({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Получаем стили темы один раз для всего заголовка
    final theme = Theme.of(context);
    final dividerColor = TableStyle.getDividerColor(context);
    final hoverColor = TableStyle.getHoverColor(context);

    final state = ref.watch(appTableProvider<T>(tag));
    final visibleColumns = state.visibleColumns();

    return Container(
      height: AppTable.defaultHeaderHeight,
      padding: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border(bottom: BorderSide(color: dividerColor)),
      ),
      child: Row(
        children: [
          for (int i = 0; i < visibleColumns.length; i++) ...[
            _HeaderCellWrapper<T>(
              column: visibleColumns[i],
              hoverColor: hoverColor,
            ),
            if (i < visibleColumns.length - 1) const _VerticalDivider(),
          ],
        ],
      ),
    );
  }
}

class _HeaderCellWrapper<T> extends StatelessWidget {
  const _HeaderCellWrapper({required this.column, required this.hoverColor});

  final AppTableColumn<T> column;
  final Color hoverColor;

  @override
  Widget build(BuildContext context) {
    final content = Material(
      type: MaterialType.transparency,
      child: InkWell(
        hoverColor: hoverColor,
        highlightColor: hoverColor,
        splashColor: hoverColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TableHeaderCell<T>(column: column),
        ),
      ),
    );

    return column.size.wrap(content);
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: AppTable.defaultHeaderHeight,
      color: TableStyle.getVerticalDividerColor(context),
    );
  }
}
