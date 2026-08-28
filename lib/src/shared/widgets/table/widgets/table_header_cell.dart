import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';

class TableHeaderCell<T> extends StatelessWidget {
  const TableHeaderCell({super.key, required this.column});

  final AppTableColumn<T> column;

  @override
  Widget build(BuildContext context) {
    final title = column.title;
    final icon = column.icon;

    if (title == null && icon == null) {
      return const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          _buildIconContent(icon, title),
        ] else if (title != null) ...[
          _buildTextContent(context, title),
        ],
      ],
    );
  }

  Widget _buildIconContent(IconData icon, String? title) {
    final iconWidget = Icon(icon, size: 16, color: AppColors.primary);

    if (title != null) {
      return Tooltip(message: title, child: iconWidget);
    }
    return iconWidget;
  }

  Widget _buildTextContent(BuildContext context, String title) {
    return Flexible(
      child: Tooltip(
        message: title,
        waitDuration: const Duration(milliseconds: 500),
        child: Text(
          title.toUpperCase(),
          style: TableStyle.getTitleHeader(context),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
