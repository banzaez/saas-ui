import 'package:flutter/services.dart';

/// Форматтер для номера банковской карты
/// Форматирует ввод в формате: XXXX XXXX XXXX XXXX (4 группы по 4 цифры)
/// Максимальная длина: 16 цифр
class AppCardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Извлекаем только цифры из нового значения
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ограничиваем до 16 цифр
    if (digitsOnly.length > 16) {
      return oldValue;
    }

    // Если цифр нет, возвращаем пустое значение
    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Форматируем номер карты группами по 4 цифры с пробелами
    final StringBuffer formatted = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      // Добавляем пробел после каждых 4 цифр (кроме первой группы)
      if (i > 0 && i % 4 == 0) {
        formatted.write(' ');
      }
      formatted.write(digitsOnly[i]);
    }

    final formattedText = formatted.toString();

    // Вычисляем новую позицию курсора
    // Учитываем добавленные пробелы при перемещении курсора
    int cursorPosition = formattedText.length;

    // Если пользователь редактирует в середине, сохраняем относительную позицию
    if (newValue.selection.baseOffset <= newValue.text.length) {
      // Подсчитываем количество цифр до позиции курсора
      final digitsBeforeCursor = newValue.text
          .substring(0, newValue.selection.baseOffset)
          .replaceAll(RegExp(r'\D'), '')
          .length;

      // Находим позицию в отформатированном тексте
      int digitCount = 0;
      for (int i = 0; i < formattedText.length; i++) {
        if (formattedText[i] != ' ') {
          digitCount++;
        }
        if (digitCount == digitsBeforeCursor) {
          cursorPosition = i + 1;
          break;
        }
      }

      // Если курсор находится на пробеле, сдвигаем его вправо
      if (cursorPosition < formattedText.length &&
          formattedText[cursorPosition] == ' ') {
        cursorPosition++;
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
