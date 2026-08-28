import 'package:flutter/services.dart';

/// Форматтер для CVV/CVC кода банковской карты
/// Ограничивает ввод только цифрами
/// Максимальная длина: 3-4 цифры (3 для большинства карт, 4 для American Express)
class AppCvvInputFormatter extends TextInputFormatter {
  /// Максимальная длина CVV кода
  final int maxLength;

  /// Создает форматтер CVV кода
  /// [maxLength] - максимальная длина (по умолчанию 3, для American Express можно указать 4)
  AppCvvInputFormatter({this.maxLength = 3});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Извлекаем только цифры из нового значения
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ограничиваем до maxLength цифр
    if (digitsOnly.length > maxLength) {
      return oldValue;
    }

    // Возвращаем только цифры
    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: digitsOnly.length),
    );
  }
}
