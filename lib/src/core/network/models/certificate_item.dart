import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';

part 'certificate_item.freezed.dart';
part 'certificate_item.g.dart';

@freezed
sealed class CertificateItem with _$CertificateItem implements BaseModel {
  const CertificateItem._();

  const factory CertificateItem({
    int? id,
    @JsonKey(name: 'certificate_id') @Default(0) int certificateId,
    @JsonKey(name: 'product_offer_id') @Default(0) int productOfferId,
    @JsonKey(name: 'product_offer_name', includeToJson: false)
    @Default("")
    String productOfferName,
    @Default(0) double amount,
    @Default('RUB') String currency,
    @JsonKey(name: 'tokens_total') @Default(0) int tokensTotal,
    @JsonKey(name: 'tokens_initial') @Default(0) int tokensInitial,
    @JsonKey(name: 'tokens_used') @Default(0) int tokensUsed,
    @JsonKey(name: 'tokens_remaining') @Default(0) int tokensRemaining,
    @Default(CertificateItemStatus.created) CertificateItemStatus status,
    @JsonKey(name: 'activated_at') DateTime? activatedAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'invoice_ids', includeToJson: false)
    @Default([])
    List<int> invoiceIds,
    @JsonKey(name: 'invoices', includeToJson: false)
    @Default([])
    List<Invoice> invoices,
  }) = _CertificateItem;

  factory CertificateItem.fromJson(Map<String, dynamic> json) =>
      _$CertificateItemFromJson(json);

  @override
  String get getName => "Токен №$id";
}

enum CertificateItemStatus {
  @JsonValue("created")
  created,
  @JsonValue("pending")
  pending,
  @JsonValue("active")
  active,
  @JsonValue("cancelled")
  cancelled,
  @JsonValue("exhausted")
  exhausted;

  @override
  String toString() => switch (this) {
    created => 'Требуется оплата',
    pending => 'Ожидает оплаты',
    active => 'Активный',
    cancelled => 'Отменен',
    exhausted => 'Закончился',
  };

  Color get color => switch (this) {
    created => Colors.blue,
    pending => Colors.orange,
    active => Colors.green,
    cancelled => Colors.grey,
    exhausted => Colors.red,
  };
}
