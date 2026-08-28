// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentRequest _$CreatePaymentRequestFromJson(
  Map<String, dynamic> json,
) => CreatePaymentRequest(
  legalEntityId: (json['legal_entity_id'] as num?)?.toInt(),
  paymentMethod: $enumDecodeNullable(
    _$PaymentMethodEnumMap,
    json['payment_method'],
  ),
  paymentProvider: $enumDecodeNullable(
    _$PaymentProviderEnumMap,
    json['payment_provider'],
  ),
);

Map<String, dynamic> _$CreatePaymentRequestToJson(
  CreatePaymentRequest instance,
) => <String, dynamic>{
  'legal_entity_id': ?instance.legalEntityId,
  'payment_method': ?_$PaymentMethodEnumMap[instance.paymentMethod],
  'payment_provider': ?_$PaymentProviderEnumMap[instance.paymentProvider],
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.bankTransfer: 'bank_transfer',
  PaymentMethod.qrCode: 'qr_code',
  PaymentMethod.other: 'other',
};

const _$PaymentProviderEnumMap = {
  PaymentProvider.amelie: 'amelie',
  PaymentProvider.modulbank: 'modulbank',
};
