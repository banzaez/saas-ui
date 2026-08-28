import 'package:intl/intl.dart';

extension NumExtension on num {
  String format([int decimals = 0]) => NumberFormat(
    "#,##0${decimals > 0 ? ".${'0' * decimals}" : ""}",
    "en_US",
  ).format(this).replaceAll(',', ' ');

  String get formatSum => format(0);

  String get formatDouble => format(2);
}
