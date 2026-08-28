import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

import 'product_offer_filter_settings.dart';
import 'product_offer_group_settings.dart';
import 'product_offer_sort_settings.dart';

export 'product_offer_filter_settings.dart';
export 'product_offer_group_settings.dart';
export 'product_offer_sort_settings.dart';

/// Настройки для списка предложений (ProductOffer).
/// Объединяет параметры фильтрации, сортировки и группировки.
class ProductOfferSettings
    extends BaseListSettings<ProductOffer, ProductOfferSettings> {
  @override
  final ProductOfferFilterSettings filter;

  @override
  final ProductOfferSortSettings sort;

  final ProductOfferGroupSettings _group;

  @override
  ProductOfferGroupSettings get group => _group;

  ProductOfferSettings({
    String? search,
    int? productId,
    bool activeOnly = true,
    ProductOfferSortApi? sortingApiBy = ProductOfferSortApi.productOfferName,
    SortField<ProductOffer>? sortingBy,
    bool sortingReverse = false,
    ProductOfferGroupSettings? group,
  }) : filter = ProductOfferFilterSettings(
         search: search,
         productId: productId,
         activeOnly: activeOnly,
       ),
       sort = ProductOfferSortSettings(
         sortingApiBy: sortingApiBy,
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       ),
       _group = group ?? ProductOfferGroupSettings();

  @override
  ProductOfferSettings createCopy({
    SortSettings<ProductOffer>? sort,
    GroupSettings<ProductOffer>? group,
  }) => ProductOfferSettings(
    search: filter.search,
    productId: filter.productId,
    activeOnly: filter.activeOnly,
    sortingApiBy: this.sort.sortingApiBy,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
    group: group as ProductOfferGroupSettings? ?? _group,
  );
}
