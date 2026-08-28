import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

Uint8List? _qrCodeImageFromJson(String? value) {
  if (value == null || value.isEmpty) return null;
  try {
    return base64Decode(value);
  } catch (_) {
    return Uint8List.fromList(latin1.encode(value));
  }
}

@freezed
sealed class Payment with _$Payment implements BaseModel {
  const Payment._();

  const factory Payment({
    int? id,
    @JsonKey(name: 'company_id') @Default(0) int companyId,
    @JsonKey(name: 'company_name', includeToJson: false)
    @Default("")
    String companyName,
    @JsonKey(name: 'legal_entity_id') @Default(0) int legalEntityId,
    @JsonKey(name: 'legal_entity_name', includeToJson: false)
    @Default("")
    String legalEntityName,
    @JsonKey(name: 'certificate_item_id') @Default(0) int certificateItemId,
    @Default(PaymentStatus.created) PaymentStatus status,
    @Default(PaymentMethod.bankTransfer) PaymentMethod method,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'paid_at') DateTime? paidAt,
    @JsonKey(name: 'payment_link') String? paymentLink,
    @JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson)
    Uint8List? qrCodeImage,
    @Default(0) double amount,
    @JsonKey(name: 'amount_paid') @Default(0) double amountPaid,
    @Default('RUB') String currency,
    @JsonKey(name: 'invoice_id') int? invoiceId,
    @JsonKey(name: 'invoice') InvoiceData? invoice,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  @override
  String get getName => "Платеж №$id";
}

@freezed
sealed class InvoiceData with _$InvoiceData {
  const factory InvoiceData({
    required int id,
    @JsonKey(name: 'legal_entity_id') required int legalEntityId,
    required double amount,
    required String currency,
    @JsonKey(name: 'invoice_number') required String invoiceNumber,
  }) = _InvoiceData;

  factory InvoiceData.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDataFromJson(json);
}

enum PaymentStatus with EnumWithText {
  @JsonValue('created')
  created,
  @JsonValue('paid')
  paid,
  @JsonValue('error')
  error,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('unknown')
  unknown;

  @override
  String toString() => switch (this) {
    created => 'created',
    paid => 'paid',
    error => 'error',
    cancelled => 'cancelled',
    unknown => 'unknown',
  };

  @override
  String text() => switch (this) {
    created => 'Ожидает оплаты',
    paid => 'Оплачен',
    error => 'Ошибка',
    cancelled => 'Отменен',
    unknown => 'Неизвестно',
  };

  Color get color => switch (this) {
    created => Colors.orange,
    paid => Colors.green,
    error => Colors.red,
    cancelled => Colors.grey,
    unknown => Colors.grey,
  };
}

enum PaymentMethod with EnumWithText {
  @JsonValue('bank_transfer')
  bankTransfer,
  @JsonValue('qr_code')
  qrCode,
  @JsonValue('other')
  other;

  @override
  String toString() => switch (this) {
    bankTransfer => 'bank_transfer',
    qrCode => 'qr_code',
    other => 'other',
  };

  @override
  String text() => switch (this) {
    bankTransfer => 'По счету',
    qrCode => 'QR-код',
    other => 'Другой',
  };

  Color get color => switch (this) {
    bankTransfer => Colors.blue,
    qrCode => Colors.blue,
    other => Colors.blue,
  };
}

enum PaymentProvider with EnumWithText {
  @JsonValue('amelie')
  amelie,
  @JsonValue('modulbank')
  modulbank;

  @override
  String toString() => switch (this) {
    amelie => 'amelie',
    modulbank => 'modulbank',
  };

  @override
  String text() => switch (this) {
    amelie => 'Амели',
    modulbank => 'Модульбанк',
  };

  Color get color => switch (this) {
    amelie => Colors.blue,
    modulbank => Colors.blue,
  };
}
