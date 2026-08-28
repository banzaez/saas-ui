import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppSidebarItem extends StatefulWidget {
  final String label;
  final String pathAsset;
  final String route;
  final bool isSelected;
  final bool isCollapsed;

  const AppSidebarItem({
    super.key,
    required this.label,
    required this.pathAsset,
    required this.route,
    required this.isSelected,
    this.isCollapsed = false,
  });

  @override
  State<AppSidebarItem> createState() => _AppSidebarItemState();
}

class _AppSidebarItemState extends State<AppSidebarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final iconColor = widget.isSelected
        ? Colors.white
        : (_isHovered ? AppColors.primary.shade400 : AppColors.greyDarker);

    final textColor = widget.isSelected
        ? Colors.white
        : (_isHovered ? AppColors.primary.shade700 : AppColors.greyDarker);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: widget.isCollapsed ? 4 : 16,
          vertical: widget.isCollapsed ? 8 : 12,
        ),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? AppColors.primary
              : (_isHovered
                    ? AppColors.primary.withValues(alpha: .08)
                    : Colors.transparent),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            if (widget.isSelected)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: .24),
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: widget.isCollapsed
            ? SizedBox(
                width: 72,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Center(
                        child: SvgPicture.asset(
                          widget.pathAsset,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            iconColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Tiny label
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            : FittedBox(
                fit: BoxFit.none,
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 260, // Fixed width for internal layout
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Icon
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: SvgPicture.asset(
                            widget.pathAsset,
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              iconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Text label
                      Expanded(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: (widget.isSelected || _isHovered)
                              ? TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: textColor,
                                )
                              : TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: textColor,
                                ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          child: Text(widget.label),
                        ),
                      ),
                      // Active indicator
                      if (widget.isSelected)
                        Container(
                          width: 3,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
