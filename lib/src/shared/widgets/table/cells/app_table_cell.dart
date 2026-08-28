import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/app_initials.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';

abstract class AppTableCell extends StatelessWidget {
  const AppTableCell({
    super.key,
    this.stringToInitials,
    this.leading,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
  });

  final String? stringToInitials;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets padding;

  Widget buildValue(BuildContext context, TextStyle style);
  Widget? buildSubvalue(BuildContext context, TextStyle style) => null;

  @override
  Widget build(BuildContext context) {
    final titleStyle = getTitleStyle(context);
    final subtitleStyle = getSubtitleStyle(context);
    final subvalueWidget = buildSubvalue(context, subtitleStyle);

    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          ?leading,
          if (stringToInitials != null) AppInitials(text: stringToInitials!),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [buildValue(context, titleStyle), ?subvalueWidget],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }

  // ----------STYLES----------------------------------------------------------------------------------

  TextStyle getTitleStyle(BuildContext context) =>
      TableStyle.getTitleCell(context);
  TextStyle getSubtitleStyle(BuildContext context) =>
      TableStyle.getSubtitleCell(context);
}
