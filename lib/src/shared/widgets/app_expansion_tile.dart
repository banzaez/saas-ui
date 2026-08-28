import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/styles/app_widget_styles.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class AppExpansionTile extends StatefulWidget {
  const AppExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
    this.tilePadding,
    this.childrenPadding,
    this.containerPadding,
  });

  final Widget title;
  final List<Widget> children;
  final ValueChanged<bool>? onExpansionChanged;
  final bool initiallyExpanded;
  final EdgeInsetsGeometry? tilePadding;
  final EdgeInsetsGeometry? childrenPadding;
  final EdgeInsetsGeometry? containerPadding;

  @override
  State<AppExpansionTile> createState() => _AppExpansionTileState();
}

class _AppExpansionTileState extends State<AppExpansionTile> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  void didUpdateWidget(covariant AppExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initiallyExpanded != oldWidget.initiallyExpanded) {
      setState(() {
        _expanded = widget.initiallyExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Theme(
      data: AppWidgetStyles.expansionTileTheme(context),
      child: AppContainer(
        padding: widget.containerPadding ?? EdgeInsets.zero,
        borderRadius: 20,
        backgroundColor: isDark ? null : Colors.white,
        child: ExpansionTile(
          title: DefaultTextStyle.merge(
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _expanded ? AppColors.primary : null,
            ),
            child: widget.title,
          ),
          backgroundColor: isDark
              ? Theme.of(context).colorScheme.surfaceContainer.withAlpha(50)
              : Colors.grey.shade50,
          collapsedBackgroundColor: Colors.transparent,
          initiallyExpanded: widget.initiallyExpanded,
          onExpansionChanged: (value) {
            setState(() => _expanded = value);
            widget.onExpansionChanged?.call(value);
          },
          tilePadding:
              widget.tilePadding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          childrenPadding:
              widget.childrenPadding ??
              const EdgeInsets.only(left: 24, right: 24, bottom: 20),
          shape: AppWidgetStyles.expansionTileShape,
          collapsedShape: AppWidgetStyles.expansionTileShape,
          children: widget.children,
        ),
      ),
    );
  }
}
