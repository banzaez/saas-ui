import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/models/highlight_level.dart';

class NumericField extends StatefulWidget {
  const NumericField({
    super.key,
    required this.onChanged,
    this.initialValue,
    this.decoration = const InputDecoration(),
    this.enabled = true,
    this.decimals = 2,
    this.validator,
    this.highlightLevel = HighlightLevel.none,
  });

  final ValueChanged<num> onChanged;
  final num? initialValue;
  final InputDecoration decoration;
  final bool enabled;
  final int decimals;
  final FormFieldValidator<num>? validator;
  final HighlightLevel highlightLevel;

  @override
  State<NumericField> createState() => _NumericFieldState();
}

class _NumericFieldState extends State<NumericField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final initialText = widget.initialValue?.format(widget.decimals) ?? '';
    _controller = TextEditingController(text: initialText);
  }

  @override
  void didUpdateWidget(NumericField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      final newText = widget.initialValue?.format(widget.decimals) ?? '';
      if (_parseValue(newText) != _parseValue(_controller.text)) {
        _controller.text = newText;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  num _parseValue(String text) {
    final cleanText = text.replaceAll(' ', '').replaceAll(',', '.');
    return num.tryParse(cleanText) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final isHighlighted = widget.highlightLevel != HighlightLevel.none;
    final isStrong = widget.highlightLevel == HighlightLevel.strong;

    return TextFormField(
      controller: _controller,
      onChanged: (value) => widget.onChanged(_parseValue(value)),
      decoration: widget.decoration.copyWith(
        filled: isHighlighted || widget.decoration.filled == true,
        fillColor: isHighlighted
            ? Theme.of(
                context,
              ).colorScheme.primary.withAlpha(isStrong ? 40 : 20)
            : widget.decoration.fillColor,
        enabledBorder: isHighlighted
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(isStrong ? 200 : 100),
                  width: isStrong ? 2.5 : 2,
                ),
                borderRadius: BorderRadius.circular(12),
              )
            : null,
      ),
      enabled: widget.enabled,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9., ]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          String text = newValue.text;

          // 1. Убираем лишние пробелы и запятые
          text = text.replaceAll(',', '.');

          // Если пусто - ок
          if (text.isEmpty) return newValue;

          // 2. Ограничиваем количество точек
          if ('.'.allMatches(text).length > 1) return oldValue;

          // 3. Разделяем на целую и дробную части
          final parts = text.split('.');
          String integerPart = parts[0].replaceAll(' ', '');
          final String? decimalPart = parts.length > 1 ? parts[1] : null;

          // 4. Ограничиваем дробную часть
          if (decimalPart != null && decimalPart.length > widget.decimals) {
            return oldValue;
          }

          // 5. Форматируем целую часть пробелами
          if (integerPart.isNotEmpty) {
            final number = BigInt.tryParse(integerPart);
            if (number != null) {
              // Вставляем пробелы каждые 3 цифры с конца
              integerPart = integerPart.replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => '${m[1]} ',
              );
            } else if (integerPart != '-') {
              return oldValue;
            }
          }

          // 6. Собираем итоговую строку
          String newFormattedText = integerPart;
          if (parts.length > 1) {
            newFormattedText += '.$decimalPart';
          }

          // 7. Рассчитываем положение курсора
          final int cursorPosition = newValue.selection.end;

          // Находим сколько символов (кроме пробелов) было до курсора
          final String textBeforeCursor = newValue.text.substring(0, cursorPosition);
          final int nonSpaceCharsBeforeCursor = textBeforeCursor
              .replaceAll(' ', '')
              .length;

          // Ставим курсор после такого же количества значащих символов в новой строке
          int newCursorPosition = 0;
          int count = 0;
          for (
            int i = 0;
            i < newFormattedText.length && count < nonSpaceCharsBeforeCursor;
            i++
          ) {
            if (newFormattedText[i] != ' ') {
              count++;
            }
            newCursorPosition = i + 1;
          }

          // Если перед курсором был разделитель, который мы могли добавить/удалить
          // Проверяем крайний случай
          if (newCursorPosition < newFormattedText.length &&
              newFormattedText[newCursorPosition] == ' ') {
            // если мы удаляли символ и попали на пробел - возможно надо шагнуть
          }

          return TextEditingValue(
            text: newFormattedText,
            selection: TextSelection.collapsed(offset: newCursorPosition),
          );
        }),
      ],
      validator: (value) => widget.validator?.call(_parseValue(value ?? '')),
    );
  }
}
