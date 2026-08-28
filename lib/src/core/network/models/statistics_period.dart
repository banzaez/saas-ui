import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';

enum StatisticsPeriod with EnumWithText {
  today,
  last7Days,
  last30Days,
  last90Days,
  last180Days,
  last270Days,
  last365Days,
  allTime;

  @override
  String toString() => switch (this) {
    today => 'today',
    last7Days => 'last7Days',
    last30Days => 'last30Days',
    last90Days => 'last90Days',
    last180Days => 'last180Days',
    last270Days => 'last270Days',
    last365Days => 'last365Days',
    allTime => 'allTime',
  };

  @override
  String text() => switch (this) {
    today => 'За сегодня',
    last7Days => 'За последние 7 дней',
    last30Days => 'За последние 30 дней',
    last90Days => 'За последние 90 дней',
    last180Days => 'За последние 180 дней',
    last270Days => 'За последние 270 дней',
    last365Days => 'За последние 365 дней',
    allTime => 'За все время',
  };

  Duration get duration => switch (this) {
    today => const Duration(days: 0),
    last7Days => const Duration(days: 7),
    last30Days => const Duration(days: 30),
    last90Days => const Duration(days: 90),
    last180Days => const Duration(days: 180),
    last270Days => const Duration(days: 270),
    last365Days => const Duration(days: 365),
    allTime => const Duration(days: 365 * 10), // например, 10 лет
  };
}
