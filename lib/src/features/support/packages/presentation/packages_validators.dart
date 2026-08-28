import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

/// Валидаторы для формы редактирования пакета.
abstract class PackagesValidators {
  static String? product(Product? value) {
    if (value == null) return 'Продукт не может быть пустым';
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Наименование не может быть пустым';
    }
    return null;
  }

  static String? description(String? value) {
    if (value == null || value.isEmpty) return 'Описание не может быть пустым';
    return null;
  }

  static String? tokensPerPeriod(num? value, PackageType? type) {
    if (type != PackageType.tokenBased) return null;
    if (value == null || value <= 0) return 'Укажите количество токенов';
    return null;
  }

  static String? periodType(PeriodType? value) {
    if (value == null) return 'Тип периода обновления не может быть пустым';
    return null;
  }

  static String? periodValue(num? value, PeriodType? type) {
    if (type == null) return null;
    if (value == null || value <= 0) return 'Укажите период обновления';
    return null;
  }

  static String? periodCount(num? value, PeriodType? type) {
    if (type == null) return null;
    if (value == null || value <= 0) return 'Укажите количество обновлений';
    return null;
  }
}
