import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class RowDateCell extends AppTableCell {
  const RowDateCell({
    super.key,
    super.leading,
    super.trailing,
    super.stringToInitials,
    required this.value,
    this.subvalue,
    this.valueFormat = 'dd.MM.yyyy',
    this.subvalueFormat = 'dd.MM.yyyy',
    this.valueColor,
    this.subvalueColor,
    this.valueFontSize = 13,
    this.subvalueFontSize = 12,
    this.overflow = TextOverflow.clip,
    this.useFriendlyDate = true,
    this.showTimeIfAvailable = true,
  }) : super(padding: const EdgeInsets.symmetric(horizontal: 8));

  final DateTime? value;
  final DateTime? subvalue;
  final String valueFormat;
  final String subvalueFormat;
  final Color? valueColor;
  final Color? subvalueColor;
  final double valueFontSize;
  final double subvalueFontSize;
  final TextOverflow overflow;
  final bool useFriendlyDate;
  final bool showTimeIfAvailable;

  @override
  Widget buildValue(BuildContext context, TextStyle style) {
    if (value == null) return const SizedBox.shrink();

    final isToday = value!.isToday;
    final isYesterday = value!.isYesterday;

    // Сделаем акцент на сегодня/вчера цветом из палитры, но не слишком агрессивно
    final effectiveColor =
        valueColor ??
        (isToday
            ? AppColors.primary
            : isYesterday
            ? AppColors.secondary
            : null);

    return Tooltip(
      message: _formatDateFull(context, value),
      child: Text(
        _formatDate(context, value, valueFormat),
        style: style.copyWith(
          color: effectiveColor,
          fontSize: valueFontSize,
          fontWeight: (isToday || isYesterday) ? FontWeight.w600 : null,
        ),
        overflow: overflow,
      ),
    );
  }

  @override
  Widget? buildSubvalue(BuildContext context, TextStyle style) {
    if (subvalue != null) {
      return Text(
        _formatDate(context, subvalue, subvalueFormat),
        style: style.copyWith(color: subvalueColor, fontSize: subvalueFontSize),
        overflow: overflow,
      );
    }

    if (showTimeIfAvailable &&
        value != null &&
        (value!.hour != 0 || value!.minute != 0)) {
      final timeColor = subvalueColor ?? AppColors.textGrey;
      return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          DateFormat('HH:mm:ss').format(value!),
          style: style.copyWith(
            color: timeColor,
            fontSize: subvalueFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return null;
  }

  String _formatDate(BuildContext context, DateTime? date, String format) {
    if (date == null) return '';

    if (useFriendlyDate) {
      if (date.isToday) return 'Сегодня';
      if (date.isYesterday) return 'Вчера';

      final now = DateTime.now();
      final locale = Localizations.localeOf(context).languageCode;

      if (date.year == now.year) {
        return DateFormat('d MMMM', locale).format(date);
      }
      return DateFormat('d MMMM yyyy', locale).format(date);
    }

    return DateFormat(format).format(date);
  }

  String _formatDateFull(BuildContext context, DateTime? date) {
    if (date == null) return '';

    final locale = Localizations.localeOf(context).languageCode;

    return DateFormat('dd.MM.yyyy HH:mm:ss', locale).format(date);
  }
}
