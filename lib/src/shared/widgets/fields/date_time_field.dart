import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/text_input_formatter/app_datetime_input_formatter.dart';

class AppDateTimeField extends StatefulWidget {
  final Function(DateTime?) onDateTimeSelected;
  final DateTime? initialDateTime;
  final String label;
  final String? errorText;

  const AppDateTimeField({
    super.key,
    required this.onDateTimeSelected,
    this.initialDateTime,
    this.label = 'Выбрать дату и время',
    this.errorText,
  });

  @override
  State<AppDateTimeField> createState() => _AppDateTimeFieldState();
}

class _AppDateTimeFieldState extends State<AppDateTimeField> {
  final String _errorMessage = 'Неверный формат даты';

  DateTime? _dateTime;
  String? _errorText;
  late final TextEditingController _controller;

  Timer? debounceTimer;
  void debounce(VoidCallback callback, Duration delay) {
    debounceTimer?.cancel();
    debounceTimer = Timer(delay, callback);
  }

  @override
  void initState() {
    super.initState();
    _dateTime = widget.initialDateTime;
    _controller = TextEditingController(text: _dateTime?.formatDDMMYYYYHHmmss);
  }

  @override
  void dispose() {
    _controller.dispose();
    debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: _controller,
    onChanged: (value) {
      debounce(
        () => _onEditingComplete(value),
        const Duration(milliseconds: 500),
      );
    },
    decoration: InputDecoration(
      labelText: widget.label,
      errorText: _errorText ?? widget.errorText,
      suffixIcon: IconButton(
        icon: const Icon(Icons.calendar_month),
        onPressed: _showPicker,
      ),
    ),
    inputFormatters: [AppDatetimeInputFormatter()],
  );

  Future<void> _showPicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    final newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      0,
      0,
      0,
    );

    setState(() {
      _dateTime = newDateTime;
      _controller.text = newDateTime.formatDDMMYYYYHHmmss;
      _errorText = null;
    });

    widget.onDateTimeSelected(newDateTime);
  }

  void _onEditingComplete(String value) {
    final listValue = value
        .trim()
        .replaceAll(" ", "#")
        .replaceAll(".", "#")
        .replaceAll(":", "#")
        .split("#");
    if (listValue.length != 6) {
      setState(() {
        _errorText = _errorMessage;
      });
      return;
    }
    final year = int.parse(listValue[2]);
    final month = int.parse(listValue[1]);
    final day = int.parse(listValue[0]);
    final hour = int.parse(listValue[3]);
    final minute = int.parse(listValue[4]);
    final second = int.parse(listValue[5]);

    if (year < 1900 ||
        year > 2100 ||
        month < 1 ||
        month > 12 ||
        day < 1 ||
        day > 31 ||
        hour < 0 ||
        hour > 23 ||
        minute < 0 ||
        minute > 59 ||
        second < 0 ||
        second > 59) {
      setState(() {
        _errorText = _errorMessage;
      });
      return;
    }

    final formattedYear = year.toString().padLeft(4, '0');
    final formattedMonth = month.toString().padLeft(2, '0');
    final formattedDay = day.toString().padLeft(2, '0');
    final formattedHour = hour.toString().padLeft(2, '0');
    final formattedMinute = minute.toString().padLeft(2, '0');
    final formattedSecond = second.toString().padLeft(2, '0');

    try {
      final formattedDate =
          '$formattedYear-$formattedMonth-$formattedDay $formattedHour:$formattedMinute:$formattedSecond';
      final newDate = DateTime.parse(formattedDate);
      setState(() {
        _dateTime = newDate;
        _errorText = null;
      });
      widget.onDateTimeSelected(newDate);
    } catch (e) {
      setState(() {
        _errorText = _errorMessage;
      });
      return;
    }
  }
}
