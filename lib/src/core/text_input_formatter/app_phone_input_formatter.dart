import 'package:flutter/services.dart';

class AppPhoneInputFormatter extends TextInputFormatter {
  static const String _countryCode = '+7';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    String formatted = _countryCode;

    if (digitsOnly.isEmpty) {
      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }

    String buffer = '';
    int i = 0;

    if (digitsOnly.startsWith('7')) {
      i = 1; // пропускаем первую 7
    }

    final digitsCount = digitsOnly.length - i;

    if (digitsCount > 0) {
      final codeLength = digitsCount >= 3 ? 3 : digitsCount;
      buffer += ' (${digitsOnly.substring(i, i + codeLength)}';

      if (digitsCount >= 3) {
        buffer += ')';
        if (digitsCount >= 6) {
          buffer += ' ${digitsOnly.substring(i + 3, i + 6)}';
          if (digitsCount >= 8) {
            buffer += '-${digitsOnly.substring(i + 6, i + 8)}';
            if (digitsCount >= 10) {
              buffer += '-${digitsOnly.substring(i + 8, i + 10)}';
            } else if (digitsCount > 8) {
              buffer += '-${digitsOnly.substring(i + 8, i + digitsCount)}';
            }
          } else if (digitsCount > 6) {
            buffer += '-${digitsOnly.substring(i + 6, i + digitsCount)}';
          }
        } else if (digitsCount > 3) {
          buffer += ' ${digitsOnly.substring(i + 3, i + digitsCount)}';
        }
      }
    }

    formatted += buffer;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
