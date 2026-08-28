import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowLinkCell extends AppTableCell {
  const RowLinkCell({
    super.key,
    required this.onPressed,
    required this.title,
    this.color = Colors.blue,
  });

  final VoidCallback onPressed;
  final String title;

  final Color color;

  @override
  Widget buildValue(BuildContext context, TextStyle style) => Center(
    child: Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: .2)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
