// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PinCode _$PinCodeFromJson(Map<String, dynamic> json) => _PinCode(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt() ?? 0,
  certificateId: (json['certificate_id'] as num?)?.toInt() ?? 0,
  certificateItemId: (json['certificate_item_id'] as num?)?.toInt() ?? 0,
  code: json['code'] as String? ?? "",
  status:
      $enumDecodeNullable(_$PinCodeStatusEnumMap, json['status']) ??
      PinCodeStatus.created,
  key: json['key'] as String? ?? "",
  activatedAt: json['activated_at'] == null
      ? null
      : DateTime.parse(json['activated_at'] as String),
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$PinCodeToJson(_PinCode instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'certificate_id': instance.certificateId,
  'certificate_item_id': instance.certificateItemId,
  'code': instance.code,
  'status': _$PinCodeStatusEnumMap[instance.status]!,
  'key': instance.key,
  'activated_at': instance.activatedAt?.toIso8601String(),
  'expires_at': instance.expiresAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
};

const _$PinCodeStatusEnumMap = {
  PinCodeStatus.created: 'created',
  PinCodeStatus.activated: 'activated',
  PinCodeStatus.exhausted: 'exhausted',
};
