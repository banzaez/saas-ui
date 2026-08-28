import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.padding,
    this.margin,
    this.constraints,
    this.backgroundColor,
    this.borderColor,
    this.boxShadow,
    this.borderRadius,
    this.child,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;
  final double? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: padding ?? const EdgeInsets.all(24),
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow:
            boxShadow ??
            [
              BoxShadow(
                color: isDark
                    ? Colors.black.withValues(alpha: 0.3)
                    : AppColors.primary.withValues(alpha: 0.06),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
      ),
      child: child,
    );
  }
}
