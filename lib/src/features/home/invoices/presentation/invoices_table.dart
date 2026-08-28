import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/services/pdf_service_provider.dart';
import 'package:saas_ui/src/core/services/pdf_viewer_launcher.dart';
import 'package:saas_ui/src/features/home/invoices/application/invoices_notifier.dart';
import 'package:saas_ui/src/features/home/invoices/application/invoices_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_date_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_link_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_number_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class InvoicesTable extends ConsumerWidget {
  const InvoicesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(invoicesProvider.select((s) => s.value));
    final listNotifier = ref.read(invoicesProvider.notifier);
    final panelNotifier = ref.read(invoicesPanelProvider.notifier);

    return AppTable<Invoice>(
      sourceController: listNotifier,
      onTap: panelNotifier.open,
      onLoadMore: listNotifier.fetchNextPage,
      columns: [
        AppTableColumn(
          title: 'ID',
          size: const AppTableColumnSize.fixed(50),
          cellBuilder: (item) => RowNumericCell(value: item.id),
        ),
        AppTableColumn(
          title: 'Номер',
          size: const AppTableColumnSize.flex(1),
          cellBuilder: (item) => RowStringCell(value: item.invoiceNumber),
        ),
        AppTableColumn(
          title: 'Дата',
          size: const AppTableColumnSize.fixed(130),
          cellBuilder: (item) => RowDateCell(value: item.createdAt),
        ),
        AppTableColumn(
          title: 'Юрлицо | Компания',
          size: const AppTableColumnSize.flex(2),
          cellBuilder: (item) => RowStringCell(
            value: item.buyer?.fullName ?? '',
            subvalue: item.company?.displayName ?? '',
          ),
        ),
        AppTableColumn(
          title: 'Сумма',
          size: const AppTableColumnSize.fixed(120),
          cellBuilder: (item) => RowNumericCell(
            value: item.amount,
            decimals: 2,
            subtitle: item.currency,
          ),
        ),
        AppTableColumn(
          title: 'Способ оплаты',
          size: const AppTableColumnSize.flex(1),
          cellBuilder: (item) =>
              RowStatusCell(value: item.method, color: item.method.color),
        ),
        AppTableColumn(
          title: 'Статус',
          size: const AppTableColumnSize.flex(1),
          cellBuilder: (item) =>
              RowStatusCell(value: item.status, color: item.status.color),
        ),
        AppTableColumn(
          title: 'Счет',
          icon: Icons.print,
          size: const AppTableColumnSize.fixed(100),
          cellBuilder: (item) => RowLinkCell(
            onPressed: () => ref
                .read(pdfServiceProvider)
                .showDialogPdf(item.id!, 'invoice_${item.invoiceNumber}.pdf'),
            title: 'Счет',
          ),
        ),
        AppTableColumn(
          title: 'Действия',
          icon: Icons.more_horiz,
          size: const AppTableColumnSize.fixed(50),
          isPinned: true,
          cellBuilder: (item) =>
              RowActionsCell(onDelete: () => listNotifier.deleteItem(item.id!)),
        ),
      ],
    );
  }
}
