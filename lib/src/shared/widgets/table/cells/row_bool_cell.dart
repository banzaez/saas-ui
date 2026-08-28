import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowBoolCell extends AppTableCell {
  const RowBoolCell({super.key, required this.value});

  final bool value;

  @override
  Widget buildValue(BuildContext context, TextStyle style) {
    final activeColor = value ? const Color(0xFF10B981) : AppColors.error;
    final icon = value ? Icons.check_rounded : Icons.close_rounded;

    return Center(
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: activeColor.withValues(alpha: 0.1),
          shape: BoxShape.circle,
          border: Border.all(
            color: activeColor.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Icon(icon, size: 14, color: activeColor),
      ),
    );
  }
}
