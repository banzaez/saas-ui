import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

/// Настройки группировки предложений в табличном отображении.
class ProductOfferGroupSettings extends GroupSettings<ProductOffer> {
  @override
  final List<GroupField<ProductOffer>> availableGroupFields = [
    GroupField(id: 'none', name: 'Без группировки', groupBy: (item) => null),
    GroupField(
      id: 'product_name',
      name: 'По продукту',
      groupBy: (item) => item.productName,
    ),
  ];

  @override
  String? get initialGroupFieldId => 'product_name';

  ProductOfferGroupSettings({super.groupBy});

  @override
  ProductOfferGroupSettings createCopy({GroupField<ProductOffer>? groupBy}) =>
      ProductOfferGroupSettings(groupBy: groupBy);
}
