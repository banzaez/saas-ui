import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

/// Заголовок секции внутри панели редактирования.
///
/// Отображает иконку и название секции в едином стиле для всех панелей.
class EditPanelSectionHeader extends StatelessWidget {
  const EditPanelSectionHeader({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      spacing: 8,
      children: [
        Icon(icon, size: 16, color: AppColors.primary.withValues(alpha: 0.7)),
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primary.withValues(alpha: 0.7),
          ),
        ),
      ],
    ),
  );
}
