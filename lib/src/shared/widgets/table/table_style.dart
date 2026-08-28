import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class TableStyle {
  TableStyle._();

  static TextStyle getTitleHeader(BuildContext context) => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).textTheme.bodyMedium?.color?.withAlpha(160),
  ).copyWith(letterSpacing: 0.5);

  static TextStyle getTitleCell(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).textTheme.bodyMedium?.color?.withAlpha(220),
  );

  static TextStyle getSubtitleCell(BuildContext context) => TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).textTheme.bodyMedium?.color?.withAlpha(150),
  );

  static Color getDividerColor(BuildContext context) =>
      Theme.of(context).dividerColor.withValues(alpha: 0.08);

  static Color getVerticalDividerColor(BuildContext context) =>
      Theme.of(context).dividerColor.withValues(alpha: 0.06);

  static Color getHoverColor(BuildContext context) =>
      AppColors.primary.withValues(alpha: 0.08);

  static Color getZebraColor(BuildContext context) =>
      Theme.of(context).dividerColor.withValues(alpha: 0.05);
}
