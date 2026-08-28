import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';

class AppDatePicker extends StatelessWidget {
  final Function(DateTime?) onDateSelected;
  final DateTime? initialDate;
  final String label;

  const AppDatePicker({
    super.key,
    required this.onDateSelected,
    this.initialDate,
    this.label = 'Выбрать дату',
  });

  @override
  Widget build(BuildContext context) => TextField(
    controller: TextEditingController(text: initialDate?.formatDDMMYYYY ?? ""),
    readOnly: true,
    onTap: () async {
      final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        initialDate: initialDate ?? DateTime.now(),
      );
      if (date != null) {
        onDateSelected(date);
      }
    },
    decoration: InputDecoration(
      labelText: label,
      suffixIcon: const Icon(Icons.calendar_today, size: 18),
    ),
  );
}
