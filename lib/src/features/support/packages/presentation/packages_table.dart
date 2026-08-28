import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_panel_notifier.dart';
import 'package:saas_ui/src/features/support/packages/presentation/widgets/badge_settings.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_bool_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_widget_cell.dart';

class PackagesTable extends ConsumerWidget {
  const PackagesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(packagesProvider);
    final listNotifier = ref.read(packagesProvider.notifier);
    final panelNotifier = ref.read(packagesPanelProvider.notifier);
    final activeOnly = listNotifier.settings.filter.activeOnly;

    return AppTable<ProductOffer>(
      onTap: panelNotifier.open,
      sourceController: listNotifier,
      buildRowStyle: (item) {
        if (!item.isActive) {
          return BoxDecoration(color: Colors.red.withValues(alpha: 10 / 255));
        }
        return null;
      },
      columns: [
        AppTableColumn(
          title: 'ID',
          size: const AppTableColumnSize.id(),
          cellBuilder: (item) => RowIdCell(id: item.id.toString()),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.flex(1),
          title: 'Наименование',
          cellBuilder: (item) => RowStringCell(value: item.name, maxLines: 3),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.flex(2),
          title: 'Описание',
          cellBuilder: (item) =>
              RowStringCell(value: item.description, maxLines: 3),
        ),
        AppTableColumn(
          title: 'Настройки пакета',
          size: const AppTableColumnSize.fixed(415),
          cellBuilder: (item) =>
              RowWidgetCell(child: BadgeSettings(item: item)),
        ),
        AppTableColumn(
          title: 'Для компании | ID',
          isVisible: false,
          cellBuilder: (item) => RowStringCell(
            value: item.companyName,
            subvalue: (item.companyId ?? '').toString(),
          ),
        ),
        AppTableColumn(
          title: 'Активен',
          icon: Icons.check_circle,
          size: const AppTableColumnSize.fixed(70),
          isVisible: !activeOnly,
          cellBuilder: (item) => RowBoolCell(value: item.isActive),
        ),
        AppTableDefaultActionsColumn.create(
          cellBuilder: (item) =>
              RowActionsCell(onDelete: () => listNotifier.deleteItem(item.id!)),
        ),
      ],
    );
  }
}
