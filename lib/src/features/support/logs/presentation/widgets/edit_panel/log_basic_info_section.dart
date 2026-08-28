import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_panel_components.dart';

class LogBasicInfoSection extends StatelessWidget {
  final Log item;
  const LogBasicInfoSection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return LogSection(
      title: 'Основные данные',
      icon: Icons.info_outline,
      children: [
        LogInfoGrid(
          children: [
            LogInfoItem(
              label: 'Продукт ID: ${item.productId ?? '-'}',
              value: item.productName,
            ),
            LogInfoItem(
              label: 'Сертификат ID: ${item.certificateId ?? '-'}',
              value: item.certificateName,
            ),
            LogInfoItem(
              label: 'База ID: ${item.baseId ?? '-'}',
              value: item.baseName,
            ),
            LogInfoItem(label: 'IP-адрес', value: item.ipAddress),
          ],
        ),
      ],
    );
  }
}
