import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/shared/widgets/fields/date_time_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';

class DateFixedPeriod extends StatefulWidget {
  final Function(DateFixedValue value) onChanged;
  final DateFixedPeriodType initialValue;

  const DateFixedPeriod({
    super.key,
    required this.onChanged,
    required this.initialValue,
  });

  @override
  State<DateFixedPeriod> createState() => _DateFixedPeriodState();
}

class _DateFixedPeriodState extends State<DateFixedPeriod> {
  late DateFixedPeriodType _periodType;
  DateTime? _fromDateTime;
  DateTime? _toDateTime;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _periodType = widget.initialValue;
    _updateDatesFromPeriod(_periodType);
  }

  void _updateDatesFromPeriod(DateFixedPeriodType type) {
    if (type == DateFixedPeriodType.custom) return;

    final value = type.value;
    if (value != null) {
      _fromDateTime = value.from;
      _toDateTime = value.to;
    }
  }

  @override
  Widget build(BuildContext context) => Column(
    spacing: 16,
    children: [
      AppDropdown<DateFixedPeriodType>(
        onChanged: _setPeriodType,
        enumValues: DateFixedPeriodType.values,
        hint: 'Период',
        initialValue: widget.initialValue,
        showClearButton: false,
      ),
      if (_periodType == DateFixedPeriodType.custom) ...[
        AppDateTimeField(
          onDateTimeSelected: _setFromDateTime,
          label: 'Нач. дата',
          initialDateTime: _fromDateTime,
          errorText: _errorText,
        ),
        AppDateTimeField(
          onDateTimeSelected: _setToDateTime,
          label: 'Кон. дата',
          initialDateTime: _toDateTime,
        ),
      ],
    ],
  );

  void _setToDateTime(DateTime? value) {
    setState(() {
      _toDateTime = value;
    });
    _validate();
  }

  void _setFromDateTime(DateTime? value) {
    setState(() {
      _fromDateTime = value;
    });
    _validate();
  }

  void _validate() {
    String? error;
    if (_fromDateTime != null && _toDateTime != null) {
      if (_fromDateTime!.isAfter(_toDateTime!)) {
        error = 'Дата меньше даты окончания';
      }
    }

    setState(() {
      _errorText = error;
    });

    if (error == null) {
      widget.onChanged(DateFixedValue(
        from: _fromDateTime,
        to: _toDateTime,
        type: _periodType,
      ));
    }
  }

  void _setPeriodType(DateFixedPeriodType? value) {
    if (value == null) return;

    setState(() {
      _periodType = value;
      _updateDatesFromPeriod(value);
      if (_periodType != DateFixedPeriodType.custom) {
        _errorText = null;
      }
    });

    if (_periodType != DateFixedPeriodType.custom) {
      widget.onChanged(DateFixedValue(
        from: _fromDateTime,
        to: _toDateTime,
        type: _periodType,
      ));
    } else {
      _validate();
    }
  }
}
