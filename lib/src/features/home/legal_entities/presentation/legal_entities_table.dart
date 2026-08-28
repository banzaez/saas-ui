import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_notifier.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class LegalEntitiesTable extends ConsumerWidget {
  const LegalEntitiesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(legalEntitiesProvider.select((s) => s.value));
    final listNotifier = ref.read(legalEntitiesProvider.notifier);
    final panelNotifier = ref.read(legalEntitiesPanelProvider.notifier);

    return AppTable<LegalEntity>(
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
            stringToInitials: item.fullName,
            value: item.fullName,
          ),
        ),
        AppTableColumn(
          title: 'ИНН / КПП',
          cellBuilder: (item) =>
              RowStringCell(value: item.inn, subvalue: item.kpp),
        ),
        AppTableColumn(
          title: 'Email | Телефон',
          cellBuilder: (item) =>
              RowStringCell(value: item.email, subvalue: item.phone),
        ),
        AppTableColumn(
          title: 'Адрес',
          cellBuilder: (item) =>
              RowStringCell(value: item.address, maxLines: 3),
        ),
        AppTableColumn(
          title: 'Банк | БИК',
          cellBuilder: (item) =>
              RowStringCell(value: item.bank, subvalue: item.bik),
        ),
        AppTableColumn(
          title: 'Счет | Корр',
          cellBuilder: (item) => RowStringCell(
            value: item.bankAccount,
            subvalue: item.korrAccount,
          ),
        ),
        AppTableDefaultActionsColumn.create(
          cellBuilder: (item) =>
              RowActionsCell(onDelete: () => listNotifier.deleteItem(item.id!)),
        ),
      ],
    );
  }
}
