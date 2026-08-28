import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import '../controllers/log_json_controller.dart';

class LogJsonSearchBar extends StatelessWidget {
  final LogJsonController controller;

  const LogJsonSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.primary.withValues(alpha: 0.1)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.searchController,
              onChanged: controller.updateSearch,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Поиск по JSON...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                ),
                prefixIcon: const Icon(Icons.search_rounded, size: 18),
                border: InputBorder.none,
              ),
            ),
          ),
          ListenableBuilder(
            listenable: controller,
            builder: (context, _) {
              if (controller.searchQuery.isEmpty) {
                return const SizedBox.shrink();
              }
              return Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    '${controller.totalMatches > 0 ? controller.currentMatchIndex + 1 : 0} / ${controller.totalMatches}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  _SearchNavButton(
                    icon: Icons.keyboard_arrow_up_rounded,
                    onPressed: controller.previousMatch,
                  ),
                  const SizedBox(width: 4),
                  _SearchNavButton(
                    icon: Icons.keyboard_arrow_down_rounded,
                    onPressed: controller.nextMatch,
                  ),
                  const SizedBox(width: 8),
                  _SearchNavButton(
                    icon: Icons.clear_rounded,
                    onPressed: controller.clearSearch,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SearchNavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SearchNavButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
          ),
          child: Icon(
            icon,
            size: 18,
            color: AppColors.primary.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}
