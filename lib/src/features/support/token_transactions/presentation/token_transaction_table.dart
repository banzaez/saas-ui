import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';
import 'package:saas_ui/src/features/support/token_transactions/application/token_transaction_notifier.dart';
import 'package:saas_ui/src/features/support/token_transactions/application/token_transaction_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_date_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_number_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class TokenTransactionTable extends ConsumerWidget {
  const TokenTransactionTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tokenTransactionsProvider);
    final listNotifier = ref.read(tokenTransactionsProvider.notifier);
    final panelNotifier = ref.read(tokenTransactionPanelProvider.notifier);

    return AppTable<TokenTransaction>(
      sourceController: listNotifier,
      onTap: panelNotifier.open,
      onLoadMore: listNotifier.fetchNextPage,
      columns: [
        AppTableColumn(
          title: 'ID',
          size: const AppTableColumnSize.fixed(75),
          cellBuilder: (item) => RowIdCell(id: item.id.toString()),
        ),
        AppTableColumn(
          title: 'Дата',
          size: const AppTableColumnSize.date(),
          cellBuilder: (item) => RowDateCell(value: item.createdAt.toLocal()),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.fixed(120),
          title: 'Пакет\nсертификата',
          cellBuilder: (item) => RowNumericCell(value: item.certificateItemId),
        ),
        AppTableColumn(
          title: 'Тип',
          size: const AppTableColumnSize.fixed(120),
          cellBuilder: (item) => RowStatusCell(
            value: item.transactionType,
            color: item.transactionType.color,
          ),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.fixed(120),
          title: 'Изменение',
          cellBuilder: (item) => RowNumericCell(value: item.tokensChange),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.flex(3),
          title: 'Причина',
          cellBuilder: (item) => RowStringCell(value: item.reason, maxLines: 3),
        ),
      ],
    );
  }
}
