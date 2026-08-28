extension CustomValidationBuilder on String {
  /// Валидация номера карты
  /// Проверяет что номер содержит только цифры и имеет длину 13-19 символов
  String? isCardNumber(String? value) {
    if (value == null || value == "") {
      return "Укажите номер карты";
    }

    // Убираем все пробелы и дефисы
    final cleanValue = value.replaceAll(RegExp(r'[\s\-]'), '');

    // Проверяем что содержит только цифры
    if (!RegExp(r'^\d+$').hasMatch(cleanValue)) {
      return 'Номер карты должен содержать только цифры';
    }

    // Проверяем длину (13-19 цифр)
    if (cleanValue.length < 13 || cleanValue.length > 19) {
      return 'Номер карты должен содержать от 13 до 19 цифр';
    }

    return null;
  }

  /// Валидация срока действия карты
  /// Проверяет формат MM/YY и что дата не истекла
  String? isCardDate(String? value) {
    if (value == null || value == "") {
      return "Укажите срок действия карты";
    }

    // Проверяем формат MM/YY
    if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
      return 'Неверный формат даты. Используйте MM/YY';
    }

    final parts = value.split('/');
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);

    if (month == null || year == null) {
      return 'Неверный формат даты';
    }

    // Проверяем месяц (1-12)
    if (month < 1 || month > 12) {
      return 'Месяц должен быть от 01 до 12';
    }

    // Проверяем что дата не истекла
    final now = DateTime.now();
    final currentYear = now.year % 100; // Получаем последние 2 цифры года
    final currentMonth = now.month;

    if (year < currentYear || (year == currentYear && month < currentMonth)) {
      return 'Срок действия карты истек';
    }

    return null;
  }

  /// Валидация владельца карты
  String? isCardHolder(String? value) {
    if (value == null || value == "") {
      return 'Укажите владельца карты';
    }
    return null;
  }

  /// Валидация CVV карты
  /// Проверяет что CVV содержит ровно 3 цифры
  String? isCardCvc(String? value) {
    if (value == null || value == "") {
      return 'Укажите CVV';
    }

    // Проверяем что содержит только цифры
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'CVV должен содержать только цифры';
    }

    // Проверяем что ровно 3 цифры
    if (value.length != 3) {
      return 'CVV должен содержать ровно 3 цифры';
    }

    return null;
  }
}
