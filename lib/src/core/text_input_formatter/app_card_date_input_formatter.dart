import 'package:flutter/services.dart';

/// Форматтер для срока действия банковской карты
/// Форматирует ввод в формате: MM/YY (месяц/год)
/// Максимальная длина: 4 цифры (2 для месяца + 2 для года)
/// Автоматически исправляет некорректный месяц (>12)
class AppCardDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Извлекаем только цифры из нового значения
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ограничиваем до 4 цифр (MMYY)
    if (digitsOnly.length > 4) {
      return oldValue;
    }

    // Если цифр нет, возвращаем пустое значение
    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Форматируем в MM/YY
    final StringBuffer formatted = StringBuffer();

    // Первая цифра месяца
    formatted.write(digitsOnly[0]);

    if (digitsOnly.length >= 2) {
      // Вторая цифра месяца
      String month = digitsOnly.substring(0, 2);

      // Проверяем корректность месяца (01-12)
      final int? monthValue = int.tryParse(month);
      if (monthValue != null && monthValue > 12) {
        // Если месяц > 12, ограничиваем до 12
        month = '12';
      }

      formatted.clear();
      formatted.write(month);
      formatted.write('/');

      // Добавляем год, если есть
      if (digitsOnly.length > 2) {
        formatted.write(digitsOnly.substring(2));
      }
    }

    final formattedText = formatted.toString();

    // Вычисляем позицию курсора
    int cursorPosition = formattedText.length;

    // Если пользователь редактирует в середине
    if (newValue.selection.baseOffset <= newValue.text.length) {
      final digitsBeforeCursor = newValue.text
          .substring(0, newValue.selection.baseOffset)
          .replaceAll(RegExp(r'\D'), '')
          .length;

      if (digitsBeforeCursor <= 2) {
        cursorPosition = digitsBeforeCursor;
        // Если после двух цифр месяца, переместить курсор за слэш
        if (digitsBeforeCursor == 2 && digitsOnly.length > 2) {
          cursorPosition = 3; // после "MM/"
        }
      } else {
        cursorPosition = digitsBeforeCursor + 1; // +1 для слэша
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
