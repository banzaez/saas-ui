// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_sum_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalSumResponse _$TotalSumResponseFromJson(Map<String, dynamic> json) =>
    TotalSumResponse(
      price: (json['price'] as num?)?.toDouble() ?? 0,
      periodCount: (json['period_count'] as num?)?.toInt() ?? 0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      totalSum: (json['total_sum'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$TotalSumResponseToJson(TotalSumResponse instance) =>
    <String, dynamic>{
      'price': instance.price,
      'period_count': instance.periodCount,
      'discount': instance.discount,
      'total_sum': instance.totalSum,
    };
