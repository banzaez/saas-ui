import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/constants/app_constants.dart';
import 'package:saas_ui/src/core/gen/assets.gen.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppLogo extends StatelessWidget {
  final bool showTitle;
  final bool isVertical;
  final bool showSubtitle;
  final double iconSize;
  final double? fontSize;

  const AppLogo({
    super.key,
    this.showTitle = true,
    this.isVertical = false,
    this.showSubtitle = false,
    this.iconSize = 32,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final logoIcon = Container(
      padding: EdgeInsets.all(iconSize * 0.3),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(iconSize * 0.4),
      ),
      child: Assets.appIcon.logo.svg(width: iconSize, height: iconSize),
    );

    final brandName = Flexible(
      child: Text(
        AppConstants.appTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize ?? (isVertical ? 24 : 20),
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white : AppColors.primary.shade900,
        ),
      ),
    );

    if (isVertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          logoIcon,
          const SizedBox(height: 16),
          brandName,
          if (showSubtitle) ...[
            const SizedBox(height: 4),
            Text(
              'Единая платформа для вашего бизнеса',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey.shade500,
              ),
            ),
          ],
        ],
      );
    }

    if (!showTitle) return Center(child: logoIcon);

    return FittedBox(
      fit: BoxFit.none,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [logoIcon, const SizedBox(width: 12), brandName],
      ),
    );
  }
}
