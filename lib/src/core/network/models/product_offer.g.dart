// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductOffer _$ProductOfferFromJson(Map<String, dynamic> json) =>
    _ProductOffer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      productId: (json['product_id'] as num?)?.toInt(),
      productName: json['product_name'] as String? ?? "",
      companyId: (json['company_id'] as num?)?.toInt(),
      companyName: json['company_name'] as String? ?? "",
      price: (json['price'] as num?)?.toDouble() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      type:
          $enumDecodeNullable(_$PackageTypeEnumMap, json['package_type']) ??
          PackageType.timeBased,
      tokensPerPeriod: (json['tokens_per_period'] as num?)?.toInt() ?? 0,
      periodType: $enumDecodeNullable(_$PeriodTypeEnumMap, json['period_type']),
      periodValue: (json['period_value'] as num?)?.toInt() ?? 0,
      periodCount: (json['period_count'] as num?)?.toInt() ?? 0,
      totalSum: (json['total_sum'] as num?)?.toDouble() ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      mystockTariffId: json['mystock_tariff_id'] as String?,
    );

Map<String, dynamic> _$ProductOfferToJson(_ProductOffer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'product_id': instance.productId,
      'company_id': instance.companyId,
      'price': instance.price,
      'discount': instance.discount,
      'package_type': _$PackageTypeEnumMap[instance.type]!,
      'tokens_per_period': instance.tokensPerPeriod,
      'period_type': _$PeriodTypeEnumMap[instance.periodType],
      'period_value': instance.periodValue,
      'period_count': instance.periodCount,
      'is_active': instance.isActive,
      'mystock_tariff_id': instance.mystockTariffId,
    };

const _$PackageTypeEnumMap = {
  PackageType.timeBased: 'time_based',
  PackageType.tokenBased: 'token_based',
};

const _$PeriodTypeEnumMap = {PeriodType.day: 'day', PeriodType.month: 'month'};
