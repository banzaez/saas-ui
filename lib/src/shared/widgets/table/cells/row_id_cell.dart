import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/copy_button.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowIdCell extends AppTableCell {
  const RowIdCell({
    super.key,
    required this.id,
    this.shorten = true,
    this.withCopy = false,
    this.onTap,
    super.leading,
    super.trailing,
  }) : super(padding: EdgeInsets.zero);

  final String id;
  final bool shorten;
  final bool withCopy;
  final VoidCallback? onTap;

  @override
  Widget buildValue(BuildContext context, TextStyle style) {
    final isLong = id.length > 12;
    final displayId = shorten && isLong
        ? '${id.substring(0, 6)}...${id.substring(id.length - 4)}'
        : id;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.primary.withValues(alpha: 0.12)
        : AppColors.primary.withValues(alpha: 0.06);

    final textColor = isDark
        ? AppColors.primary.shade100
        : AppColors.primary.shade800;

    final borderColor = isDark
        ? AppColors.primary.withValues(alpha: 0.2)
        : AppColors.primary.withValues(alpha: 0.1);

    Widget idWidget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: borderColor, width: 0.5),
      ),
      child: Text(
        displayId,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.robotoMono(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor,
          letterSpacing: 0.2,
        ),
      ),
    );

    // Если есть onTap, делаем InkWell
    if (onTap != null) {
      idWidget = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: idWidget,
      );
    }

    // Если есть shorten и isLong, выводим подсказку при наведении
    if (shorten && isLong) {
      idWidget = Tooltip(message: id, preferBelow: false, child: idWidget);
    }

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4,
        children: [
          Flexible(child: idWidget),
          if (withCopy)
            CopyButton(
              text: id,
              size: 14,
              color: textColor.withValues(alpha: 0.4),
            ),
        ],
      ),
    );
  }
}
