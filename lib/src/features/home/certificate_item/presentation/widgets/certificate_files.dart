import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/services/file_service.dart';
import 'package:saas_ui/src/core/util/file_util.dart';
import 'package:saas_ui/src/features/home/certificate_item/application/certificate_detail_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_link_cell.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/shared/widgets/dialogs/dialog_file_progress.dart';

class CertificateFiles extends ConsumerWidget {
  const CertificateFiles({super.key, required this.certificateId});

  final int certificateId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(certificateDetailProvider(certificateId));

    return async.when(
      data: (data) {
        if (data == null || data.files.isEmpty) {
          return const SizedBox.shrink();
        }
        final files = data.files;
        return AppContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              const Text(
                'Полезные файлы',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              for (final file in files) _buildFileItem(context, ref, file),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  Widget _buildFileItem(BuildContext context, WidgetRef ref, AppFile file) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: InkWell(
          onTap: () => _downloadFile(ref, file),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 12,
              children: [
                FileUtil.buildFileBadge(file.filename),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.filename,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        FileUtil.getFileCategory(file.filename),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
                RowLinkCell(
                  onPressed: () => _downloadFile(ref, file),
                  title: 'Скачать',
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> _downloadFile(WidgetRef ref, AppFile item) async {
    await ref
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
}
