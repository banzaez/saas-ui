import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowNumericCell extends AppTableCell {
  const RowNumericCell({
    super.key,
    required this.value,
    this.decimals = 0,
    this.subtitle,
    this.prefix,
    this.suffix,
    this.isBold = false,
    this.isTrend = false,
    this.color,
    this.textAlign = TextAlign.end,
    super.stringToInitials,
    super.leading,
    super.trailing,
  });

  final num? value;
  final String? subtitle;
  final int decimals;
  final String? prefix;
  final String? suffix;

  /// Если true, текст будет жирным
  final bool isBold;

  /// Если true, положительные числа будут зелеными, отрицательные - красными
  final bool isTrend;

  /// Цвет текста по умолчанию (если isTrend = false)
  final Color? color;

  /// Выравнивание текста
  final TextAlign textAlign;

  @override
  Widget buildValue(BuildContext context, TextStyle style) {
    Color? textColor = color;
    if (isTrend && value != null) {
      if (value! > 0) {
        textColor = Colors.green;
      } else if (value! < 0) {
        textColor = Colors.red;
      }
    }

    final displayValue = value?.format(decimals) ?? '0';

    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: GoogleFonts.robotoMono(
            fontSize: 13,
            fontWeight: isBold
                ? FontWeight.w700
                : (style.fontWeight ?? FontWeight.w400),
            color: textColor ?? style.color,
          ),
          children: [
            if (prefix != null) TextSpan(text: '$prefix '),
            TextSpan(text: displayValue),
            if (suffix != null) TextSpan(text: ' $suffix'),
          ],
        ),
      ),
    );
  }

  @override
  Widget? buildSubvalue(BuildContext context, TextStyle style) =>
      subtitle == null
      ? null
      : SizedBox(
          width: double.infinity,
          child: Text(
            subtitle!,
            style: style,
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
          ),
        );
}
