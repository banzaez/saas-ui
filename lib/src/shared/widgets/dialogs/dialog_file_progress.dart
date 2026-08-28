import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/services/file_service.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/styles/app_dialog.dart';
import 'package:saas_ui/src/core/util/file_util.dart';

/// Диалог прогресса загрузки файла (`FileOperationProgress` из [FileService]).
class UploadProgressDialog extends StatelessWidget {
  const UploadProgressDialog({
    super.key,
    required this.filename,
    required this.operation,
  });

  final String filename;
  final FileOperationProgress operation;

  @override
  Widget build(BuildContext context) {
    return _FileProgressDialogBody(
      filename: filename,
      operation: operation,
      title: 'Загрузка файла',
      icon: Icons.file_upload_outlined,
    );
  }
}

/// Диалог прогресса скачивания файла.
class DownloadProgressDialog extends StatelessWidget {
  const DownloadProgressDialog({
    super.key,
    required this.filename,
    required this.operation,
  });

  final String filename;
  final FileOperationProgress operation;

  @override
  Widget build(BuildContext context) {
    return _FileProgressDialogBody(
      filename: filename,
      operation: operation,
      title: 'Скачивание файла',
      icon: Icons.file_download_outlined,
    );
  }
}

class _FileProgressDialogBody extends StatelessWidget {
  const _FileProgressDialogBody({
    required this.filename,
    required this.operation,
    required this.title,
    required this.icon,
  });

  final String filename;
  final FileOperationProgress operation;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppDialog.defaultDialog(
      maxWidth: 400,
      child: ListenableBuilder(
        listenable: operation,
        builder: (context, _) {
          final totalBytes = operation.totalBytes;
          final bytesDone = operation.bytesProcessed;
          final progress = operation.progress;
          final remainingTime = operation.remainingTime;

          final String sizeText;
          if (totalBytes != null && totalBytes > 0) {
            sizeText =
                '${FileUtil.formatBytes(bytesDone)} из ${FileUtil.formatBytes(totalBytes)}';
          } else {
            sizeText = FileUtil.formatBytes(bytesDone);
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Icon(icon, size: 40, color: AppColors.primary),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                filename,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                tween: Tween<double>(begin: 0, end: progress),
                builder: (context, value, _) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: LinearProgressIndicator(
                      value: (totalBytes != null && totalBytes > 0)
                          ? value
                          : null,
                      minHeight: 10,
                      backgroundColor: AppColors.primary.withValues(
                        alpha: 0.08,
                      ),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sizeText,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGrey,
                          ),
                        ),
                        if (remainingTime.isNotEmpty)
                          Text(
                            'Осталось: $remainingTime',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textGrey.withValues(alpha: 0.6),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (totalBytes != null && totalBytes > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${(progress * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => operation.cancel(),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.textGrey.withValues(alpha: 0.05),
                  ),
                  child: Text(
                    'Отменить операцию',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
