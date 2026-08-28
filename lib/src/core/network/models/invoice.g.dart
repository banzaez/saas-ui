// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Invoice _$InvoiceFromJson(Map<String, dynamic> json) => _Invoice(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt() ?? 0,
  invoiceNumber: json['invoice_number'] as String? ?? "",
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  amount: (json['amount'] as num?)?.toDouble() ?? 0,
  currency: json['currency'] as String? ?? 'RUB',
  status:
      $enumDecodeNullable(_$InvoiceStatusEnumMap, json['status']) ??
      InvoiceStatus.pending,
  certificateItemId: (json['certificate_item_id'] as num?)?.toInt() ?? 0,
  legalEntityId: (json['legal_entity_id'] as num?)?.toInt() ?? 0,
  transactionId: json['transaction_id'] as String? ?? "",
  method:
      $enumDecodeNullable(_$PaymentMethodEnumMap, json['method']) ??
      PaymentMethod.bankTransfer,
  company: json['company'] == null
      ? null
      : Company.fromJson(json['company'] as Map<String, dynamic>),
  buyer: json['buyer'] == null
      ? null
      : LegalEntity.fromJson(json['buyer'] as Map<String, dynamic>),
  seller: json['seller'] == null
      ? null
      : LegalEntity.fromJson(json['seller'] as Map<String, dynamic>),
  productOffers:
      (json['product_offers'] as List<dynamic>?)
          ?.map((e) => ProductOffer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$InvoiceToJson(_Invoice instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'invoice_number': instance.invoiceNumber,
  'created_at': instance.createdAt?.toIso8601String(),
  'amount': instance.amount,
  'currency': instance.currency,
  'status': _$InvoiceStatusEnumMap[instance.status]!,
  'certificate_item_id': instance.certificateItemId,
  'legal_entity_id': instance.legalEntityId,
  'transaction_id': instance.transactionId,
  'method': _$PaymentMethodEnumMap[instance.method]!,
};

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.pending: 'pending',
  InvoiceStatus.paid: 'paid',
  InvoiceStatus.failed: 'failed',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.bankTransfer: 'bank_transfer',
  PaymentMethod.qrCode: 'qr_code',
  PaymentMethod.other: 'other',
};
