import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/features/support/products/application/products_notifier.dart';
import 'package:saas_ui/src/features/support/products/application/products_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_bool_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class ProductsTable extends ConsumerWidget {
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productsProvider);
    final listNotifier = ref.read(productsProvider.notifier);
    final panelNotifier = ref.read(productsPanelProvider.notifier);
    final activeOnly = listNotifier.settings.filter.activeOnly;

    return AppTable<Product>(
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
          cellBuilder: (item) =>
              RowStringCell(stringToInitials: item.name, value: item.name),
        ),
        AppTableColumn(
          title: 'Продавец',
          cellBuilder: (item) => RowStringCell(value: item.sellerName),
        ),
        AppTableColumn(
          title: 'Описание',
          size: const AppTableColumnSize.flex(2),
          cellBuilder: (item) =>
              RowStringCell(value: item.description, maxLines: 3),
        ),
        AppTableColumn(
          title: 'Прокси',
          icon: Icons.vpn_lock,
          size: const AppTableColumnSize.fixed(70),
          cellBuilder: (item) => RowBoolCell(value: item.useProxy),
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
