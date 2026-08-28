import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

/// Настройки фильтрации для списка предложений (ProductOffer).
class ProductOfferFilterSettings extends FilterSettings<ProductOffer> {
  /// Фильтр по конкретному продукту
  int? productId;

  /// Показывать только активные предложения
  bool activeOnly;

  ProductOfferFilterSettings({
    super.search,
    this.productId,
    this.activeOnly = true,
  });

  @override
  List<ProductOffer> filterItems(List<ProductOffer> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [
        if (productId != null) (item) => item.productId == productId,
        if (activeOnly) (item) => item.isActive,
      ],
      searchExtractors: [
        (item) => item.name,
        (item) => item.description,
        (item) => item.id.toString(),
      ],
    );
  }
}
