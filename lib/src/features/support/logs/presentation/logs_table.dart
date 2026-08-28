import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/logs/application/logs_notifier.dart';
import 'package:saas_ui/src/features/support/logs/application/logs_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_date_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_number_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class LogsTable extends ConsumerWidget {
  const LogsTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNotifier = ref.read(logsProvider.notifier);
    ref.watch(logsProvider);

    return AppTable<Log>(
      sourceController: listNotifier,
      onTap: (item) => ref.read(logsPanelProvider.notifier).open(item),
      onLoadMore: listNotifier.fetchNextPage,
      columns: [
        AppTableColumn(
          title: 'ID',
          size: const AppTableColumnSize.fixed(95),
          cellBuilder: (item) => RowIdCell(id: item.id.toString()),
        ),
        AppTableColumn(
          title: 'Дата',
          size: const AppTableColumnSize.date(),
          cellBuilder: (item) => RowDateCell(value: item.createdAt.toLocal()),
        ),
        AppTableColumn(
          title: 'Продукт',
          cellBuilder: (item) => RowStringCell(
            value: item.productId?.toString() ?? '-',
            subvalue: item.productName,
          ),
        ),
        AppTableColumn(
          title: 'Сертификат',
          cellBuilder: (item) => RowStringCell(
            value: item.certificateId?.toString() ?? '-',
            subvalue: item.certificateName,
          ),
        ),
        AppTableColumn(
          title: 'IP-адрес',
          cellBuilder: (item) => RowStringCell(value: item.ipAddress),
        ),
        AppTableColumn(
          title: 'Метод | Путь',
          cellBuilder: (item) => RowStringCell(
            value: item.requestMethod,
            subvalue: item.requestPath,
          ),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.fixed(75),
          title: 'Токены',
          cellBuilder: (item) =>
              RowNumericCell(value: item.tokensReportedByService),
        ),
        AppTableColumn(
          title: 'Результат',
          cellBuilder: (item) =>
              RowStatusCell(value: item.errorType, color: item.errorType.color),
        ),
        AppTableColumn(
          title: 'Текст ошибки',
          cellBuilder: (item) => RowStringCell(value: item.errorMessage),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.fixed(120),
          title: 'Запрос | Ответ',
          cellBuilder: (item) => RowStringCell(
            value: _formatSize(item.externalServiceRequestSize),
            subvalue: _formatSize(item.externalServiceResponseSize),
            textAlign: TextAlign.right,
            valueStyle: GoogleFonts.robotoMono(
              fontSize: 14,
              color: _getColor(item.externalServiceRequestSize),
            ),
            subvalueStyle: GoogleFonts.robotoMono(
              fontSize: 14,
              color: _getColor(item.externalServiceResponseSize),
            ),
          ),
        ),
      ],
    );
  }

  Color? _getColor(int size) {
    if (size <= 0) return null;
    if (size > 1024 * 512) return Colors.red;
    if (size > 1024 * 256) return Colors.orange;
    if (size > 1024 * 128) return Colors.yellow;
    if (size > 1024 * 64) return Colors.blue;
    if (size > 1024 * 8) return AppColors.greyDarker;
    return AppColors.greyDark;
  }

  String _formatSize(int size) {
    if (size <= 0) return '0 B';
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    int i = 0;
    double d = size.toDouble();
    while (d >= 1024 && i < units.length - 1) {
      d /= 1024;
      i++;
    }
    return '${d.format(i == 0 ? 0 : 1)} ${units[i]}';
  }
}
