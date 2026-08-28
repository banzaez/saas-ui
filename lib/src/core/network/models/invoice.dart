import 'package:flutter/material.dart' show Color, Colors;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
sealed class Invoice with _$Invoice implements BaseModel {
  const Invoice._();

  const factory Invoice({
    int? id,
    @JsonKey(name: 'company_id') @Default(0) int companyId,
    @JsonKey(name: 'invoice_number') @Default("") String invoiceNumber,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(0) double amount,
    @Default('RUB') String currency,
    @Default(InvoiceStatus.pending) InvoiceStatus status,
    @JsonKey(name: 'certificate_item_id') @Default(0) int certificateItemId,
    @JsonKey(name: 'legal_entity_id') @Default(0) int legalEntityId,
    @JsonKey(name: 'transaction_id') @Default("") String transactionId,
    @Default(PaymentMethod.bankTransfer) PaymentMethod method,
    @JsonKey(name: 'company', includeToJson: false) Company? company,
    @JsonKey(name: 'buyer', includeToJson: false) LegalEntity? buyer,
    @JsonKey(name: 'seller', includeToJson: false) LegalEntity? seller,
    @JsonKey(name: 'product_offers', includeToJson: false)
    @Default([])
    List<ProductOffer> productOffers,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  @override
  String get getName => "Счет $invoiceNumber от ${createdAt?.formatDDMMYYYY}";
}

enum InvoiceStatus with EnumWithText {
  @JsonValue('pending')
  pending,
  @JsonValue('paid')
  paid,
  @JsonValue('failed')
  failed;

  @override
  String toString() => switch (this) {
    pending => 'pending',
    paid => 'paid',
    failed => 'failed',
  };

  @override
  String text() => switch (this) {
    pending => 'Ожидает оплаты',
    paid => 'Оплачен',
    failed => 'Отменен',
  };

  Color get color => switch (this) {
    pending => Colors.orange,
    paid => Colors.green,
    failed => Colors.grey,
  };
}
