// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt() ?? 0,
  companyName: json['company_name'] as String? ?? "",
  legalEntityId: (json['legal_entity_id'] as num?)?.toInt() ?? 0,
  legalEntityName: json['legal_entity_name'] as String? ?? "",
  certificateItemId: (json['certificate_item_id'] as num?)?.toInt() ?? 0,
  status:
      $enumDecodeNullable(_$PaymentStatusEnumMap, json['status']) ??
      PaymentStatus.created,
  method:
      $enumDecodeNullable(_$PaymentMethodEnumMap, json['method']) ??
      PaymentMethod.bankTransfer,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  paidAt: json['paid_at'] == null
      ? null
      : DateTime.parse(json['paid_at'] as String),
  paymentLink: json['payment_link'] as String?,
  qrCodeImage: _qrCodeImageFromJson(json['qr_code_image'] as String?),
  amount: (json['amount'] as num?)?.toDouble() ?? 0,
  amountPaid: (json['amount_paid'] as num?)?.toDouble() ?? 0,
  currency: json['currency'] as String? ?? 'RUB',
  invoiceId: (json['invoice_id'] as num?)?.toInt(),
  invoice: json['invoice'] == null
      ? null
      : InvoiceData.fromJson(json['invoice'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'legal_entity_id': instance.legalEntityId,
  'certificate_item_id': instance.certificateItemId,
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'method': _$PaymentMethodEnumMap[instance.method]!,
  'created_at': instance.createdAt?.toIso8601String(),
  'paid_at': instance.paidAt?.toIso8601String(),
  'payment_link': instance.paymentLink,
  'qr_code_image': instance.qrCodeImage,
  'amount': instance.amount,
  'amount_paid': instance.amountPaid,
  'currency': instance.currency,
  'invoice_id': instance.invoiceId,
  'invoice': instance.invoice,
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.created: 'created',
  PaymentStatus.paid: 'paid',
  PaymentStatus.error: 'error',
  PaymentStatus.cancelled: 'cancelled',
  PaymentStatus.unknown: 'unknown',
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.bankTransfer: 'bank_transfer',
  PaymentMethod.qrCode: 'qr_code',
  PaymentMethod.other: 'other',
};

_InvoiceData _$InvoiceDataFromJson(Map<String, dynamic> json) => _InvoiceData(
  id: (json['id'] as num).toInt(),
  legalEntityId: (json['legal_entity_id'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
  invoiceNumber: json['invoice_number'] as String,
);

Map<String, dynamic> _$InvoiceDataToJson(_InvoiceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'legal_entity_id': instance.legalEntityId,
      'amount': instance.amount,
      'currency': instance.currency,
      'invoice_number': instance.invoiceNumber,
    };
