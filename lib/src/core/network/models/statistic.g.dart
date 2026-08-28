// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Statistic _$StatisticFromJson(Map<String, dynamic> json) => _Statistic(
  id: (json['id'] as num?)?.toInt(),
  certificateId: (json['certificate_id'] as num).toInt(),
  certificateDescription: json['certificate_description'] as String,
  tokensBefore: (json['tokens_before'] as num?)?.toInt() ?? 0,
  tokensAfter: (json['tokens_after'] as num?)?.toInt() ?? 0,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => StatisticData.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$StatisticToJson(_Statistic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'certificate_id': instance.certificateId,
      'certificate_description': instance.certificateDescription,
      'tokens_before': instance.tokensBefore,
      'tokens_after': instance.tokensAfter,
      'data': instance.data,
    };

_StatisticData _$StatisticDataFromJson(Map<String, dynamic> json) =>
    _StatisticData(
      date: DateTime.parse(json['date'] as String),
      tokensAfter: (json['tokens_after'] as num?)?.toInt() ?? 0,
      tokensReceived: (json['tokens_received'] as num?)?.toInt() ?? 0,
      tokensSpent: (json['tokens_spent'] as num?)?.toInt() ?? 0,
      tokensChange: (json['tokens_change'] as num?)?.toInt() ?? 0,
      isForecast: json['is_forecast'] as bool? ?? false,
    );

Map<String, dynamic> _$StatisticDataToJson(_StatisticData instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'tokens_after': instance.tokensAfter,
      'tokens_received': instance.tokensReceived,
      'tokens_spent': instance.tokensSpent,
      'tokens_change': instance.tokensChange,
      'is_forecast': instance.isForecast,
    };
