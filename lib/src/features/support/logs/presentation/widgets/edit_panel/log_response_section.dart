import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_panel_components.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_json_viewer/log_json_viewer.dart';

class LogResponseSection extends StatelessWidget {
  final Log item;
  const LogResponseSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return LogSection(
      title: 'Ответ',
      icon: Icons.download_done_outlined,
      children: [
        SizedBox(
          height: 32,
          child: Row(
            spacing: 12,
            children: [
              LogStatusBadge(status: item.responseStatusCode),
              LogBadge(
                text: LogStatusBadge.getHttpStatusText(item.responseStatusCode),
                color: LogStatusBadge.getHttpStatusColor(
                  item.responseStatusCode,
                ),
              ),
              if (item.responseBody.isEmpty)
                const LogBadge(text: 'BODY IS EMPTY'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (item.errorMessage.isNotEmpty)
          AppContainer(
            padding: const EdgeInsets.all(12),
            backgroundColor: AppColors.error.withValues(alpha: 0.05),
            borderColor: AppColors.error.withValues(alpha: 0.2),
            borderRadius: 8,
            margin: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ТЕКСТ ОШИБКИ',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.error,
                  ),
                ),
                const SizedBox(height: 4),
                SelectableText(
                  item.errorMessage,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        if (item.responseBody.isNotEmpty) ...[
          const SizedBox(height: 12),
          LogJsonViewer(title: 'Тело ответа', jsonString: item.responseBody),
        ],
      ],
    );
  }
}
