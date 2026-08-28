import 'package:json_annotation/json_annotation.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

part 'product_offer_buy_response.g.dart';

@JsonSerializable()
class ProductOfferBuyResponse {
  @JsonKey(name: 'certificate_id')
  final int certificateId;
  @JsonKey(name: 'certificate_item_id')
  final int certificateItemId;
  @JsonKey(name: 'package_type')
  final PackageType packageType;
  @JsonKey(name: 'price', defaultValue: 0)
  final double price;
  @JsonKey(name: 'product_name')
  final String? productName;

  ProductOfferBuyResponse({
    required this.certificateId,
    required this.certificateItemId,
    required this.packageType,
    required this.price,
    required this.productName,
  });

  factory ProductOfferBuyResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductOfferBuyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOfferBuyResponseToJson(this);
}
