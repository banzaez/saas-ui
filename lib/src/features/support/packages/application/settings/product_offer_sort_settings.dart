import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

/// Настройки сортировки предложений.
class ProductOfferSortSettings extends SortSettings<ProductOffer> {
  /// Регулярное выражение для очистки имен от эмодзи перед сравнением строк.
  static final _emojiRegExp = RegExp(
    // ignore: valid_regexps
    r'[\p{Emoji_Presentation}\p{Extended_Pictographic}\uFE0F]',
    unicode: true,
  );

  /// Тип сортировки для передачи в API запрос
  ProductOfferSortApi? sortingApiBy;

  @override
  final List<SortField<ProductOffer>> availableSortFields = [
    SortField(
      id: 'name',
      name: 'По наименованию',
      compareTo: (a, b) {
        // Приоритет активным предложениям
        if (a.isActive != b.isActive) {
          return a.isActive ? -1 : 1;
        }
        final aName = a.name.replaceAll(_emojiRegExp, '').trim();
        final bName = b.name.replaceAll(_emojiRegExp, '').trim();
        return aName.compareTo(bName);
      },
    ),
    SortField(
      id: 'price',
      name: 'По цене',
      compareTo: (a, b) {
        // Приоритет активным предложениям
        if (a.isActive != b.isActive) {
          return a.isActive ? -1 : 1;
        }
        return a.totalSum.compareTo(b.totalSum);
      },
    ),
    SortField(
      id: 'tokenPrice',
      name: 'По цене за 1 токен',
      compareTo: (a, b) {
        // Приоритет активным предложениям
        if (a.isActive != b.isActive) {
          return a.isActive ? -1 : 1;
        }
        return a.pricePerToken.compareTo(b.pricePerToken);
      },
    ),
    SortField(
      id: 'tokens',
      name: 'По токенам',
      compareTo: (a, b) {
        // Приоритет активным предложениям
        if (a.isActive != b.isActive) {
          return a.isActive ? -1 : 1;
        }
        return a.totalTokens.compareTo(b.totalTokens);
      },
    ),
  ];

  @override
  String? get initialSortFieldId => 'name';

  ProductOfferSortSettings({
    this.sortingApiBy = ProductOfferSortApi.productOfferName,
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  ProductOfferSortSettings createCopy({
    SortField<ProductOffer>? sortingBy,
    bool? sortReverse,
  }) => ProductOfferSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}

/// Перечисление полей сортировки, поддерживаемых серверным API.
enum ProductOfferSortApi {
  /// Сортировка по имени предложения
  productOfferName('product_offer_name', 'По наименованию'),

  /// Сортировка по имени родительского продукта
  productName('product_name', 'По продукту');

  /// Значение ключа для отправки в HTTP-запросе
  final String value;

  /// Человекочитаемое название поля
  final String name;

  const ProductOfferSortApi(this.value, this.name);
}
