// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_qr_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentQrStatusResponse _$PaymentQrStatusResponseFromJson(
  Map<String, dynamic> json,
) => PaymentQrStatusResponse(
  status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
  isPaid: json['is_paid'] as bool,
);

Map<String, dynamic> _$PaymentQrStatusResponseToJson(
  PaymentQrStatusResponse instance,
) => <String, dynamic>{
  'status': _$PaymentStatusEnumMap[instance.status]!,
  'is_paid': instance.isPaid,
};

const _$PaymentStatusEnumMap = {
  PaymentStatus.created: 'created',
  PaymentStatus.paid: 'paid',
  PaymentStatus.error: 'error',
  PaymentStatus.cancelled: 'cancelled',
  PaymentStatus.unknown: 'unknown',
};
