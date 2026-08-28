import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart' show routerProvider;
import 'package:saas_ui/src/features/home/certificate_item/presentation/certificate_navigation.dart';
import 'package:saas_ui/src/features/home/certificates/application/certificates_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_number_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_status_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class CertificatesTable extends ConsumerWidget {
  const CertificatesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(certificatesProvider.select((s) => s.value));
    final controller = ref.read(certificatesProvider.notifier);

    return AppTable<Certificate>(
      sourceController: controller,
      onTap: (item) => goToCertificateItem(
        ref.read(routerProvider),
        certificateId: item.id!,
      ),
      onLoadMore: controller.fetchNextPage,
      columns: _buildColumns(controller),
    );
  }

  List<AppTableColumn<Certificate>> _buildColumns(Certificates controller) => [
    AppTableColumn(
      title: 'ID',
      size: const AppTableColumnSize.id(),
      cellBuilder: (item) => RowIdCell(id: item.id.toString()),
    ),
    AppTableColumn(
      title: 'Продукт',
      cellBuilder: (item) => RowStringCell(
        value: item.productName,
        subvalue: item.productId.toString(),
      ),
    ),
    AppTableColumn(
      size: const AppTableColumnSize.fixed(150),
      title: 'Статус',
      cellBuilder: (item) =>
          RowStatusCell(value: item.status, color: item.status.color),
    ),
    AppTableColumn(
      size: const AppTableColumnSize.fixed(100),
      title: 'Текущий\nостаток',
      cellBuilder: (item) => RowNumericCell(value: item.tokensRemaining),
    ),
    AppTableColumn(
      size: const AppTableColumnSize.flex(2),
      title: 'Примечание',
      cellBuilder: (item) => RowStringCell(value: item.description),
    ),
    AppTableDefaultActionsColumn.create(
      cellBuilder: (item) =>
          RowActionsCell(onDelete: () => controller.deleteItem(item.id!)),
    ),
  ];
}
