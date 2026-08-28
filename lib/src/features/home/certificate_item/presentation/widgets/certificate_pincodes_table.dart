import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';
import 'package:saas_ui/src/features/home/certificate_item/application/certificate_detail_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_expansion_tile.dart';
import 'package:saas_ui/src/shared/widgets/copy_button.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_date_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_widget_cell.dart';

class CertificatePincodesTable extends ConsumerWidget {
  const CertificatePincodesTable({super.key, required this.certificateId});

  final int certificateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(certificateDetailProvider(certificateId));

    return async.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();
        final pincodes = data.certificate.pincodes;

        return AppExpansionTile(
          title: Text('Пин-коды (${pincodes.length})'),
          onExpansionChanged: (_) {},
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: pincodes.length > 10 ? 700 : 400,
              ),
              child: AppTable<PinCode>(
                items: pincodes,
                columns: [
                  AppTableColumn(
                    title: 'Пин-код',
                    size: const AppTableColumnSize.flex(2),
                    cellBuilder: (item) => RowWidgetCell(
                      child: Row(
                        spacing: 8,
                        children: [
                          CopyButton(text: item.code),
                          Flexible(
                            child: SelectableText(item.code, maxLines: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppTableColumn(
                    title: 'Статус',
                    size: const AppTableColumnSize.flex(1),
                    cellBuilder: (item) => RowStatusCell(
                      value: item.status,
                      color: item.status.color,
                    ),
                  ),
                  AppTableColumn(
                    title: 'Активация',
                    size: const AppTableColumnSize.fixed(130),
                    cellBuilder: (item) => RowDateCell(value: item.activatedAt),
                  ),
                  AppTableColumn(
                    title: 'Действительно до',
                    size: const AppTableColumnSize.fixed(130),
                    cellBuilder: (item) => RowDateCell(value: item.expiresAt),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
