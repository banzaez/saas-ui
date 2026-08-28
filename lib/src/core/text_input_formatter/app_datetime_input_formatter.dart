import 'package:flutter/services.dart';

/// Форматирует ввод в виде: dd.mm.yyyy HH:MM:SS
class AppDatetimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 1. Блокируем удаление (Backspace / Delete)
    if (newValue.text.length < oldValue.text.length &&
        newValue.selection.start <= oldValue.selection.start) {
      return oldValue;
    }

    // Если текст не изменился (например, только перемещение курсора), возвращаем как есть
    if (newValue.text == oldValue.text) {
      return newValue;
    }

    // 2. Реализация режима замены (Overwrite)

    // Определяем позицию начала изменения
    int selectionStart = oldValue.selection.start;
    if (selectionStart < 0) selectionStart = 0;

    // Определяем, что именно было введено
    String inserted = "";
    if (newValue.selection.start > selectionStart) {
      inserted = newValue.text.substring(
        selectionStart,
        newValue.selection.end,
      );
    }

    // Оставляем только цифры из ввода
    inserted = inserted.replaceAll(RegExp(r'[^0-9]'), '');
    if (inserted.isEmpty) {
      // Игнорируем ввод нецифровых символов (кроме случаев, когда текст не изменился)
      return oldValue;
    }

    // Базовый текст: текущий или пустая маска
    final String baseText = oldValue.text.isEmpty
        ? '00.00.0000 00:00:00'
        : oldValue.text;

    // Извлекаем цифры из базового текста и дополняем до 14 (ddmmyyyyHHMMSS)
    final List<String> digits = baseText.replaceAll(RegExp(r'[^0-9]'), '').split('');
    while (digits.length < 14) {
      digits.add('0');
    }

    // Находим индекс цифры в массиве digits, соответствующий позиции курсора в тексте
    int digitIndex = _getDigitIndex(baseText, selectionStart);

    // Заменяем цифры в массиве на новые
    for (int i = 0; i < inserted.length; i++) {
      if (digitIndex < 14) {
        digits[digitIndex] = inserted[i];
        digitIndex++;
      }
    }

    // Форматируем результат по маске
    final formatted = _applyMask(digits);

    // Вычисляем новую позицию курсора, пропуская разделители
    final int cursorOffset = _getCursorOffset(formatted, digitIndex);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorOffset),
    );
  }

  /// Возвращает количество цифр, предшествующих данной позиции в тексте
  int _getDigitIndex(String text, int offset) {
    int index = 0;
    for (int i = 0; i < offset && i < text.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(text[i])) {
        index++;
      }
    }
    return index;
  }

  /// Накладывает маску dd.mm.yyyy HH:MM:SS на список цифр
  String _applyMask(List<String> digits) {
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if (i == 1) buffer.write('.');
      if (i == 3) buffer.write('.');
      if (i == 7) buffer.write(' ');
      if (i == 9) buffer.write(':');
      if (i == 11) buffer.write(':');
    }
    return buffer.toString();
  }

  /// Находит смещение в отформатированной строке после N-й цифры, пропуская разделители
  int _getCursorOffset(String formatted, int digitTarget) {
    int currentDigit = 0;
    int offset = 0;
    for (int i = 0; i < formatted.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(formatted[i])) {
        currentDigit++;
        offset = i + 1;
        if (currentDigit == digitTarget) break;
      } else {
        if (currentDigit < digitTarget) {
          offset = i + 1;
        }
      }
    }
    // Пропускаем следующие разделители, чтобы курсор всегда стоял перед цифрой
    while (offset < formatted.length &&
        !RegExp(r'[0-9]').hasMatch(formatted[offset])) {
      offset++;
    }
    return offset;
  }
}
