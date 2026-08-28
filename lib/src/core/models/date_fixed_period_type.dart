import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';

class DateFixedValue {
  final DateTime? from;
  final DateTime? to;
  final DateFixedPeriodType type;

  DateFixedValue({this.from, this.to, required this.type});
}

enum DateFixedPeriodType with EnumWithText {
  last15Minutes,
  last30Minutes,
  last1Hour,
  today,
  yesterday,
  custom;

  DateFixedValue? get value {
    final now = DateTime.now();
    return switch (this) {
      last15Minutes => DateFixedValue(
        from: now.subtract(const Duration(minutes: 15)),
        to: now,
        type: last15Minutes,
      ),
      last30Minutes => DateFixedValue(
        from: now.subtract(const Duration(minutes: 30)),
        to: now,
        type: last30Minutes,
      ),
      last1Hour => DateFixedValue(
        from: now.subtract(const Duration(hours: 1)),
        to: now,
        type: last1Hour,
      ),
      today => DateFixedValue(from: now.startOfDay, to: now.endOfDay, type: today),
      yesterday => DateFixedValue(
        from: now.subtract(const Duration(days: 1)).startOfDay,
        to: now.subtract(const Duration(days: 1)).endOfDay,
        type: yesterday,
      ),
      custom => null,
    };
  }

  @override
  String toString() => switch (this) {
    last15Minutes => 'last15Minutes',
    last30Minutes => 'last30Minutes',
    last1Hour => 'last1Hour',
    today => 'today',
    yesterday => 'yesterday',
    custom => 'custom',
  };

  @override
  String text() => switch (this) {
    last15Minutes => 'За последние 15 минут',
    last30Minutes => 'За последние 30 минут',
    last1Hour => 'За последний час',
    today => 'За сегодня',
    yesterday => 'За вчера',
    custom => 'Другой период',
  };
}
