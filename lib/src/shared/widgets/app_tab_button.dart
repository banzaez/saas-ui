import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppTabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;

  const AppTabButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) => Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.primary : Colors.grey[500],
            ),
          ),
        ),
      ),
    ),
  );
}
