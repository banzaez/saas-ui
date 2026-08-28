import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/core/util/file_util.dart';
import 'package:saas_ui/src/features/support/files/application/files_notifier.dart';
import 'package:saas_ui/src/features/support/files/application/files_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_divider.dart';
import 'package:saas_ui/src/shared/widgets/app_drop_file_panel.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/row_string_cell.dart';
import 'package:dio/dio.dart' as dio;

class FilesEditPanel extends ConsumerWidget {
  const FilesEditPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(filesPanelProvider);
    if (item == null) return const SizedBox.shrink();

    return AppEditPanel(
      key: ValueKey(item.id ?? 'new'),
      onClose: () => ref.read(filesPanelProvider.notifier).close(),
      title: 'Редактирование файла',
      maxWidth: 600,
      children: [
        _buildFileInfo(item),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: AppDivider(),
        ),
        _buildUpdateZone(context, ref, item),
      ],
    );
  }

  Widget _buildFileInfo(AppFile item) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 16,
    children: [
      RowStringCell(
        value: item.filename,
        subvalue: 'Имя файла',
        leading: FileUtil.buildFileBadge(item.filename),
        valueStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      Row(
        spacing: 24,
        children: [
          Expanded(
            child: RowStringCell(value: item.id.toString(), subvalue: 'ID'),
          ),
          Expanded(
            child: RowStringCell(value: item.uuid, subvalue: 'UUID'),
          ),
        ],
      ),
      Row(
        spacing: 24,
        children: [
          Expanded(
            child: RowStringCell(
              value: item.companyName ?? '-',
              subvalue: 'Компания',
            ),
          ),
          Expanded(
            child: RowStringCell(
              value: item.productName ?? '-',
              subvalue: 'Продукт',
            ),
          ),
        ],
      ),
      RowStringCell(value: item.mimetype ?? '-', subvalue: 'MIME-тип'),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            'Ссылка',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
          InkWell(
            onTap: () => _copyUrl(item.url),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.link,
                    size: 16,
                    color: AppColors.primary.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.url,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ).copyWith(fontFamily: 'monospace'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.copy,
                    size: 14,
                    color: AppColors.primary.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );

  Future<void> _copyUrl(String url) => ClipboardHelper.copy(url);

  Widget _buildUpdateZone(
    BuildContext context,
    WidgetRef ref,
    AppFile item,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 12,
    children: [
      Text(
        'Обновить файл',
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      AppDropFilePanel(
        onFileDrop: (DropItem dropItem) async {
          if (dropItem is DropItemDirectory) {
            AppSnackbar.showError(
              title: 'Ошибка',
              message:
                  'Загрузка директорий не поддерживается. Пожалуйста, выберите файл.',
            );
            return;
          }
          try {
            dio.MultipartFile file;
            if (kIsWeb) {
              final bytes = await dropItem.readAsBytes();
              file = dio.MultipartFile.fromBytes(
                bytes,
                filename: dropItem.name,
              );
            } else {
              file = dio.MultipartFile.fromFileSync(dropItem.path);
            }
            final result = await ref
                .read(filesProvider.notifier)
                .uploadFile(file, item.productId, uuid: item.uuid);
            if (result != null && context.mounted) {
              ref.read(filesPanelProvider.notifier).close();
              AppSnackbar.showSuccess(
                title: 'Успешно',
                message: 'Файл "${item.filename}" обновлен',
              );
            }
          } catch (e) {
            AppLogger.error('Не удалось обновить файл: ${e.toString()}');
            AppSnackbar.showError(
              title: 'Ошибка',
              message: 'Не удалось обновить файл: ${e.toString()}',
            );
          }
        },
      ),
    ],
  );
}
