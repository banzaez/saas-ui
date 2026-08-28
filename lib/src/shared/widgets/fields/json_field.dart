import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/copy_button.dart';

class JsonField extends StatelessWidget {
  const JsonField({
    super.key,
    required this.jsonString,
    this.decoration = const InputDecoration(),
  });

  final InputDecoration decoration;
  final String jsonString;

  @override
  Widget build(BuildContext context) => InputDecorator(
    decoration: decoration.copyWith(
      suffixIcon: CopyButton(text: _formatJson(jsonString)),
    ),
    child: SelectableText(
      _formatJson(jsonString),
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      minLines: 1,
      maxLines: 16,
    ),
  );

  String _formatJson(String? jsonString) {
    if (jsonString == null || jsonString.isEmpty) return '';
    try {
      final jsonObject = json.decode(jsonString);
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(jsonObject);
    } catch (e) {
      // Если это невалидный JSON — возвращаем как есть
      return jsonString;
    }
  }
}
