import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';

class AppDateRangePicker extends StatefulWidget {
  final Function(DateTime?, DateTime?) onSubmit;
  final DateTime? initialStart;
  final DateTime? initialEnd;
  final String label;

  const AppDateRangePicker({
    super.key,
    required this.onSubmit,
    this.initialStart,
    this.initialEnd,
    this.label = 'Выбрать период',
  });

  @override
  State<AppDateRangePicker> createState() => _AppDateRangePickerState();
}

class _AppDateRangePickerState extends State<AppDateRangePicker> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
    startDate = widget.initialStart;
    endDate = widget.initialEnd;
  }

  String get _displayText {
    if (startDate == null || endDate == null) return '';
    return '${startDate!.formatDDMMYYYY} - ${endDate!.formatDDMMYYYY}';
  }

  DateTimeRange? get _initialDateRange {
    if (startDate == null || endDate == null) return null;
    return DateTimeRange(start: startDate!, end: endDate!);
  }

  Future<void> _showPicker(BuildContext context) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2100, 12, 31),
      initialDateRange: _initialDateRange,
      builder: (context, child) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 1024),
          child: child,
        ),
      ),
    );

    if (result == null) return;
    if (!mounted) return;

    setState(() {
      startDate = result.start;
      endDate = result.end;
    });
    widget.onSubmit(startDate, endDate);
  }

  void _clear() {
    setState(() {
      startDate = null;
      endDate = null;
    });
    widget.onSubmit(null, null);
  }

  @override
  Widget build(BuildContext context) => TextField(
    controller: TextEditingController(text: _displayText),
    readOnly: true,
    onTap: () => _showPicker(context),
    decoration: InputDecoration(
      labelText: widget.label,
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (startDate != null || endDate != null)
            IconButton(
              onPressed: _clear,
              icon: const Icon(Icons.close, size: 16),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.calendar_today, size: 16),
          const SizedBox(width: 16),
        ],
      ),
    ),
  );
}
