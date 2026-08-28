import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_notifier.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class CompaniesTable extends ConsumerWidget {
  const CompaniesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(companiesProvider);
    final listNotifier = ref.read(companiesProvider.notifier);
    final panelNotifier = ref.read(companiesPanelProvider.notifier);

    return AppTable<Company>(
      onTap: panelNotifier.open,
      onLoadMore: listNotifier.fetchNextPage,
      sourceController: listNotifier,
      columns: [
        AppTableColumn(
          title: 'ID',
          size: const AppTableColumnSize.id(),
          cellBuilder: (item) => RowIdCell(id: item.id.toString()),
        ),
        AppTableColumn(
          title: 'Наименование',
          size: const AppTableColumnSize.flex(2),
          cellBuilder: (item) => RowStringCell(
            stringToInitials: item.displayName,
            value: item.displayName,
          ),
        ),
        AppTableColumn(
          title: 'Статус',
          size: const AppTableColumnSize.fixed(150),
          cellBuilder: (item) =>
              RowStatusCell(value: item.status, color: item.status.color),
        ),
        AppTableColumn(
          title: 'sdelka.biz ID',
          size: const AppTableColumnSize.fixed(150),
          cellBuilder: (item) =>
              RowStringCell(value: item.sdelkabizId?.toString() ?? ''),
        ),
        AppTableDefaultActionsColumn.create(
          cellBuilder: (item) =>
              RowActionsCell(onDelete: () => listNotifier.deleteItem(item.id!)),
        ),
      ],
    );
  }
}
