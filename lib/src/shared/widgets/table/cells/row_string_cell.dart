import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowStringCell extends AppTableCell {
  const RowStringCell({
    super.key,
    super.stringToInitials,
    super.leading,
    required this.value,
    this.subvalue,
    super.trailing,
    this.overflow,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.valueStyle,
    this.subvalueStyle,
  });

  final String value;
  final String? subvalue;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final int? maxLines;
  final TextStyle? valueStyle;
  final TextStyle? subvalueStyle;

  @override
  Widget buildValue(BuildContext context, TextStyle style) =>
      _buildText(value, valueStyle ?? style);

  @override
  Widget? buildSubvalue(BuildContext context, TextStyle style) =>
      subvalue != null ? _buildText(subvalue!, subvalueStyle ?? style) : null;

  Widget _buildText(String text, TextStyle textStyle) => SizedBox(
    width: double.infinity,
    child: Text(
      text,
      style: textStyle,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
    ),
  );
}
