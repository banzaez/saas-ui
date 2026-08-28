// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Certificate _$CertificateFromJson(Map<String, dynamic> json) => _Certificate(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt() ?? 0,
  companyName: json['company_name'] as String? ?? "",
  legalEntityId: (json['legal_entity_id'] as num?)?.toInt() ?? 0,
  legalEntityName: json['legal_entity_name'] as String? ?? "",
  productId: (json['product_id'] as num?)?.toInt() ?? 0,
  productName: json['product_name'] as String? ?? "",
  status:
      $enumDecodeNullable(_$CertificateStatusEnumMap, json['status']) ??
      CertificateStatus.active,
  baseId: (json['base_id'] as num?)?.toInt() ?? 0,
  baseName: json['base_name'] as String? ?? "",
  description: json['note'] as String? ?? "",
  apiKey: json['api_key'] as String? ?? "",
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  certificateItems:
      (json['certificate_items'] as List<dynamic>?)
          ?.map((e) => CertificateItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pincodes:
      (json['pincodes'] as List<dynamic>?)
          ?.map((e) => PinCode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  ipWhitelist:
      (json['ip_whitelist'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  tokensRemaining: (json['tokens_remaining'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CertificateToJson(_Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'legal_entity_id': instance.legalEntityId,
      'product_id': instance.productId,
      'status': _$CertificateStatusEnumMap[instance.status]!,
      'base_id': instance.baseId,
      'note': instance.description,
      'api_key': instance.apiKey,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'certificate_items': instance.certificateItems,
      'pincodes': instance.pincodes,
      'ip_whitelist': instance.ipWhitelist,
    };

const _$CertificateStatusEnumMap = {
  CertificateStatus.active: 'active',
  CertificateStatus.exhausted: 'exhausted',
  CertificateStatus.cancelled: 'cancelled',
};
