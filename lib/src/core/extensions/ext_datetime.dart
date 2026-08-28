import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatDDMMYYYY => DateFormat("dd.MM.yyyy").format(this);

  String get formatDDMMSYYYY => DateFormat("dd.MM yyyy").format(this);

  String get formatDDMMM => DateFormat("dd MMM").format(this);

  String get formatMMMDDYYYY => DateFormat("MMM dd yyyy").format(this);

  String get formatMMMM => DateFormat("MMMM").format(this);

  String get formatHourMin => DateFormat("HH:mm").format(this);

  String get formatYYYYMMDD => DateFormat("yyyy.MM.dd").format(this);

  String get formatDDMMYYYYHHmmss =>
      DateFormat("dd.MM.yyyy HH:mm:ss").format(this);

  String get formatQuery => DateFormat("yyyy-MM-dd").format(this);

  String toFormat(String format) => DateFormat(format).format(this);

  // --------------------------------------------------------------------------------------------

  DateTime get startOfDay => DateTime(year, month, day);

  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  DateTime get startOfMonth => DateTime(year, month, 1);

  DateTime get endOfMonth {
    final lastDay = DateTime(year, month + 1, 0);
    return DateTime(year, month, lastDay.day, 23, 59, 59, 999);
  }

  DateTime get startOfYear => DateTime(year, 1, 1);

  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59, 999);

  // --------------------------------------------------------------------------------------------

  bool get isToday => DateTime.now().difference(startOfDay).inDays == 0;

  bool get isYesterday => DateTime.now().difference(startOfDay).inDays == 1;

  int get daysInMonth => DateTime(year, month + 1, 0).day;
}
