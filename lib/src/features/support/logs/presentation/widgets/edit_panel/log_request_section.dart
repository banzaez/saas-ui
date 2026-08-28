import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_panel_components.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_json_viewer/log_json_viewer.dart';

class LogRequestSection extends StatelessWidget {
  final Log item;
  const LogRequestSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return LogSection(
      title: 'Запрос',
      icon: Icons.upload_file_outlined,
      children: [
        Row(
          spacing: 12,
          children: [
            LogMethodBadge(method: item.requestMethod),
            Expanded(child: LogPathBadge(path: item.requestPath)),
            if (item.requestBody.isEmpty) const LogBadge(text: 'Тело пустое'),
          ],
        ),
        if (item.requestBody.isNotEmpty) ...[
          const SizedBox(height: 16),
          LogJsonViewer(title: 'Тело запроса', jsonString: item.requestBody),
        ],
      ],
    );
  }
}
