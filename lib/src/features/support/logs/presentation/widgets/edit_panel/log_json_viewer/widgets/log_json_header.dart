import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import '../controllers/log_json_controller.dart';
import '../log_json_viewer.dart';

import '../styles/log_json_styles.dart';

class LogJsonHeader extends StatelessWidget {
  final String title;
  final String jsonString;
  final bool inDialog;
  final LogJsonController controller;

  const LogJsonHeader({
    super.key,
    required this.title,
    required this.jsonString,
    required this.inDialog,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: LogJsonStyles.getHeaderDecoration(),
      child: Row(
        children: [
          const Icon(Icons.code_rounded, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.primary.withValues(alpha: 0.7),
            ),
          ),
          const Spacer(),
          if (!inDialog) ...[
            _HeaderButton(
              icon: Icons.open_in_new_rounded,
              onPressed: () => showFullscreenDialog(context, title, jsonString),
              tooltip: 'Открыть в диалоге',
            ),
            const SizedBox(width: 8),
          ],
          ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              return _HeaderButton(
                icon: controller.isExpanded
                    ? Icons.unfold_less_rounded
                    : Icons.unfold_more_rounded,
                onPressed: controller.toggleExpanded,
                tooltip: controller.isExpanded ? 'Свернуть' : 'Развернуть',
              );
            },
          ),
          const SizedBox(width: 8),
          _HeaderButton(
            icon: Icons.copy_rounded,
            onPressed: controller.copyToClipboard,
            tooltip: 'Скопировать',
          ),
          if (inDialog) ...[
            const SizedBox(width: 8),
            _HeaderButton(
              icon: Icons.close_rounded,
              onPressed: () => context.pop(),
              tooltip: 'Закрыть',
            ),
          ],
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const _HeaderButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppColors.primary.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}
