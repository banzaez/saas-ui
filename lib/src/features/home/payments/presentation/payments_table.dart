import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/services/navigation_service.dart';
import 'package:saas_ui/src/core/services/pdf_service_provider.dart';
import 'package:saas_ui/src/core/services/pdf_viewer_launcher.dart';
import 'package:saas_ui/src/features/home/payments/application/payments_notifier.dart';
import 'package:saas_ui/src/features/home/payments/application/payments_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_date_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_link_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_number_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class PaymentsTable extends ConsumerWidget {
  const PaymentsTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(paymentsProvider.select((s) => s.value));
    final listNotifier = ref.read(paymentsProvider.notifier);
    final panelNotifier = ref.read(paymentsPanelProvider.notifier);

    return AppTable<Payment>(
      sourceController: listNotifier,
      onTap: panelNotifier.open,
      onLoadMore: listNotifier.fetchNextPage,
      columns: _buildColumns(ref, listNotifier),
    );
  }

  List<AppTableColumn<Payment>> _buildColumns(
    WidgetRef ref,
    Payments listNotifier,
  ) => [
    AppTableColumn(
      title: 'ID',
      size: const AppTableColumnSize.id(),
      cellBuilder: (item) => RowIdCell(id: item.id.toString()),
    ),
    AppTableColumn(
      title: 'Дата',
      size: const AppTableColumnSize.date(),
      cellBuilder: (item) => RowDateCell(value: item.createdAt),
    ),
    AppTableColumn(
      title: 'Юрлицо',
      cellBuilder: (item) => RowStringCell(
        value: '${item.legalEntityName} (${item.legalEntityId})',
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
      title: 'Оплачено',
      cellBuilder: (item) => RowNumericCell(
        value: item.amountPaid,
        decimals: 2,
        subtitle: item.currency,
      ),
    ),
    AppTableColumn(
      title: 'Дата оплаты',
      size: const AppTableColumnSize.date(),
      cellBuilder: (item) => RowDateCell(value: item.paidAt),
    ),
    AppTableColumn(
      title: 'Статус',
      cellBuilder: (item) =>
          RowStatusCell(value: item.status, color: item.status.color),
    ),
    AppTableColumn(
      title: 'Способ оплаты',
      cellBuilder: (item) =>
          RowStatusCell(value: item.method, color: item.method.color),
    ),
    AppTableColumn(
      title: 'Оплата',
      icon: Icons.payment,
      size: const AppTableColumnSize.fixed(100),
      isPinned: true,
      cellBuilder: (item) {
        if (item.invoiceId != null) {
          return RowLinkCell(
            onPressed: () => ref
                .read(pdfServiceProvider)
                .showDialogPdf(
                  item.invoiceId!,
                  'payment_${item.invoiceId}.pdf',
                ),
            title: 'Счет',
          );
        }
        if (item.status == PaymentStatus.created && item.paymentLink != null) {
          return RowLinkCell(
            onPressed: () => ref
                .read(navigationServiceProvider)
                .launchExternalUrl(item.paymentLink!),
            title: 'Оплатить',
          );
        }
        return const RowStringCell(value: '');
      },
    ),
  ];
}
