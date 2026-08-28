import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/services/file_service.dart';
import 'package:saas_ui/src/core/util/file_util.dart';
import 'package:saas_ui/src/features/support/files/application/files_notifier.dart';
import 'package:saas_ui/src/features/support/files/application/files_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column_size.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/shared/widgets/dialogs/dialog_file_progress.dart';

import 'package:saas_ui/src/shared/widgets/table/cells/row_actions_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_id_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_link_cell.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';

class FilesTable extends ConsumerWidget {
  const FilesTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNotifier = ref.read(filesProvider.notifier);
    ref.watch(filesProvider);

    return AppTable<AppFile>(
      sourceController: listNotifier,
      onTap: (item) => ref.read(filesPanelProvider.notifier).open(item),
      columns: [
        AppTableColumn(
          title: 'ID',
          size: const AppTableColumnSize.id(),
          cellBuilder: (item) => RowIdCell(id: item.id.toString()),
        ),
        AppTableColumn(
          size: const AppTableColumnSize.flex(2),
          title: 'Имя файла',
          cellBuilder: (item) => RowStringCell(
            value: item.filename,
            subvalue: FileUtil.getFileCategory(item.filename),
            leading: FileUtil.buildFileBadge(item.filename),
          ),
        ),
        AppTableColumn(
          title: 'Продукт',
          cellBuilder: (item) => RowStringCell(value: item.productName ?? '-'),
        ),
        AppTableColumn(
          title: 'Компания',
          cellBuilder: (item) => RowStringCell(value: item.companyName ?? '-'),
        ),
        AppTableColumn(
          title: 'UUID',
          cellBuilder: (item) => RowIdCell(id: item.uuid, withCopy: true),
        ),
        AppTableColumn(
          title: 'Ссылка',
          icon: Icons.link,
          size: const AppTableColumnSize.fixed(100),
          cellBuilder: (item) => RowLinkCell(
            onPressed: () => _copyFileLink(item),
            title: 'Ссылка',
          ),
        ),
        AppTableColumn(
          title: 'Скачать',
          icon: Icons.download,
          size: const AppTableColumnSize.fixed(100),
          cellBuilder: (item) => RowLinkCell(
            onPressed: () => _downloadFile(ref, item),
            title: 'Скачать',
          ),
        ),
        AppTableDefaultActionsColumn.create(
          cellBuilder: (item) =>
              RowActionsCell(onDelete: () => listNotifier.deleteFile(item.id!)),
        ),
      ],
    );
  }

  Future<void> _copyFileLink(AppFile item) => ClipboardHelper.copy(item.url);

  Future<void> _downloadFile(WidgetRef ref, AppFile item) => ref
      .read(fileServiceProvider)
      .downloadFile(
        item,
        onTaskStart: (op) {
          final context = AppRouters.rootNavigatorKey.currentContext;
          if (context != null) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => DownloadProgressDialog(
                filename: item.filename,
                operation: op,
              ),
            );
          }
        },
        onTaskComplete: () => AppRouters.rootNavigatorKey.currentState?.pop(),
      );
}
