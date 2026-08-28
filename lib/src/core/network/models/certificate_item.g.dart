// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CertificateItem _$CertificateItemFromJson(Map<String, dynamic> json) =>
    _CertificateItem(
      id: (json['id'] as num?)?.toInt(),
      certificateId: (json['certificate_id'] as num?)?.toInt() ?? 0,
      productOfferId: (json['product_offer_id'] as num?)?.toInt() ?? 0,
      productOfferName: json['product_offer_name'] as String? ?? "",
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'RUB',
      tokensTotal: (json['tokens_total'] as num?)?.toInt() ?? 0,
      tokensInitial: (json['tokens_initial'] as num?)?.toInt() ?? 0,
      tokensUsed: (json['tokens_used'] as num?)?.toInt() ?? 0,
      tokensRemaining: (json['tokens_remaining'] as num?)?.toInt() ?? 0,
      status:
          $enumDecodeNullable(_$CertificateItemStatusEnumMap, json['status']) ??
          CertificateItemStatus.created,
      activatedAt: json['activated_at'] == null
          ? null
          : DateTime.parse(json['activated_at'] as String),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      invoiceIds:
          (json['invoice_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      invoices:
          (json['invoices'] as List<dynamic>?)
              ?.map((e) => Invoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CertificateItemToJson(_CertificateItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'certificate_id': instance.certificateId,
      'product_offer_id': instance.productOfferId,
      'amount': instance.amount,
      'currency': instance.currency,
      'tokens_total': instance.tokensTotal,
      'tokens_initial': instance.tokensInitial,
      'tokens_used': instance.tokensUsed,
      'tokens_remaining': instance.tokensRemaining,
      'status': _$CertificateItemStatusEnumMap[instance.status]!,
      'activated_at': instance.activatedAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

const _$CertificateItemStatusEnumMap = {
  CertificateItemStatus.created: 'created',
  CertificateItemStatus.pending: 'pending',
  CertificateItemStatus.active: 'active',
  CertificateItemStatus.cancelled: 'cancelled',
  CertificateItemStatus.exhausted: 'exhausted',
};
