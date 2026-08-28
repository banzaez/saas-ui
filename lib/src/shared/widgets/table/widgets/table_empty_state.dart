import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';

class TableEmptyState extends StatelessWidget {
  const TableEmptyState({
    super.key,
    this.message = 'Нет данных для отображения',
    this.icon = Icons.inbox_outlined,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 48,
              color: TableStyle.getDividerColor(context).withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(
                color: TableStyle.getDividerColor(
                  context,
                ).withValues(alpha: 0.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
