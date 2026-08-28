// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_offer_buy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOfferBuyResponse _$ProductOfferBuyResponseFromJson(
  Map<String, dynamic> json,
) => ProductOfferBuyResponse(
  certificateId: (json['certificate_id'] as num).toInt(),
  certificateItemId: (json['certificate_item_id'] as num).toInt(),
  packageType: $enumDecode(_$PackageTypeEnumMap, json['package_type']),
  price: (json['price'] as num?)?.toDouble() ?? 0,
  productName: json['product_name'] as String?,
);

Map<String, dynamic> _$ProductOfferBuyResponseToJson(
  ProductOfferBuyResponse instance,
) => <String, dynamic>{
  'certificate_id': instance.certificateId,
  'certificate_item_id': instance.certificateItemId,
  'package_type': _$PackageTypeEnumMap[instance.packageType]!,
  'price': instance.price,
  'product_name': instance.productName,
};

const _$PackageTypeEnumMap = {
  PackageType.timeBased: 'time_based',
  PackageType.tokenBased: 'token_based',
};
