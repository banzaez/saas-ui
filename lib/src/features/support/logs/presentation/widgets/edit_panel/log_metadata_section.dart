import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_panel_components.dart';

class LogMetadataSection extends StatelessWidget {
  final Log item;
  const LogMetadataSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return LogSection(
      title: 'Метаданные',
      icon: Icons.analytics_outlined,
      children: [
        LogInfoGrid(
          children: [
            LogInfoItem(label: 'ID лога', value: "${item.id}"),
            LogInfoItem(
              label: 'Результат',
              value: '',
              valueWidget: Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  LogStatusBadge(status: item.responseStatusCode),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: item.errorType.color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item.errorType.text(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: item.errorType.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            LogInfoItem(
              label: 'Создан',
              value: item.createdAt.toLocal().formatDDMMYYYYHHmmss,
            ),
            LogInfoItem(
              label: 'Длительность',
              value: '',
              valueWidget: LogDurationBadge(duration: item.duration),
            ),
          ],
        ),
      ],
    );
  }
}
