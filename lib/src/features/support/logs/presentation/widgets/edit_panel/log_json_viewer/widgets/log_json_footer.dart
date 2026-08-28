import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import '../models/log_json_models.dart';
import '../controllers/log_json_controller.dart';

import '../styles/log_json_styles.dart';

class LogJsonFooter extends StatelessWidget {
  final LogJsonController controller;

  const LogJsonFooter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        if (controller.extractedFiles.isEmpty) {
          return const SizedBox.shrink();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: LogJsonStyles.getFooterDecoration(isDark),
          child: Row(
            children: [
              Icon(
                Icons.attach_file,
                size: 16,
                color: AppColors.primary.withValues(alpha: 0.8),
              ),
              const SizedBox(width: 8),
              Text(
                'Файлы: ${controller.extractedFiles.length}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : AppColors.textColor,
                ),
              ),
              const Spacer(),
              PopupMenuButton<ExtractedFile>(
                tooltip: 'Скачать файл',
                onSelected: controller.downloadFile,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Скачать',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                itemBuilder: (context) {
                  return controller.extractedFiles.map((file) {
                    return PopupMenuItem<ExtractedFile>(
                      value: file,
                      child: Row(
                        children: [
                          Icon(
                            _getFileIcon(file.type ?? ''),
                            size: 16,
                            color: isDark ? Colors.white60 : Colors.black54,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  file.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (file.size != null)
                                  Text(
                                    '${file.size!.toStringAsFixed(2)} MB',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: isDark
                                          ? Colors.white38
                                          : Colors.black38,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.download_rounded,
                            size: 16,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getFileIcon(String type) {
    switch (type.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf_outlined;
      case 'xls':
      case 'xlsx':
        return Icons.table_view_outlined;
      case 'doc':
      case 'docx':
        return Icons.description_outlined;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image_outlined;
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.archive_outlined;
      default:
        return Icons.insert_drive_file_outlined;
    }
  }
}
