import 'package:flutter/material.dart' show Color, Colors;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/core/network/models/certificate_item.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';

part 'certificate.freezed.dart';
part 'certificate.g.dart';

@freezed
sealed class Certificate with _$Certificate implements BaseModel {
  const Certificate._();

  const factory Certificate({
    int? id,
    @JsonKey(name: 'company_id') @Default(0) int companyId,
    @JsonKey(name: 'company_name', includeToJson: false)
    @Default("")
    String companyName,
    @JsonKey(name: 'legal_entity_id') @Default(0) int legalEntityId,
    @JsonKey(name: 'legal_entity_name', includeToJson: false)
    @Default("")
    String legalEntityName,
    @JsonKey(name: 'product_id') @Default(0) int productId,
    @JsonKey(name: 'product_name', includeToJson: false)
    @Default("")
    String productName,
    @Default(CertificateStatus.active) CertificateStatus status,
    @JsonKey(name: 'base_id') @Default(0) int baseId,
    @JsonKey(name: 'base_name', includeToJson: false)
    @Default("")
    String baseName,
    @JsonKey(name: 'note') @Default("") String description,
    @JsonKey(name: 'api_key') @Default("") String apiKey,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'certificate_items')
    @Default([])
    List<CertificateItem> certificateItems,
    @JsonKey(name: 'pincodes') @Default([]) List<PinCode> pincodes,
    @JsonKey(name: 'ip_whitelist') @Default([]) List<String> ipWhitelist,
    @JsonKey(name: 'tokens_remaining', includeToJson: false)
    @Default(0)
    int tokensRemaining,
  }) = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);

  @override
  String get getName => "($id) $description";
}

enum CertificateStatus with EnumWithText {
  @JsonValue("active")
  active,
  @JsonValue("exhausted")
  exhausted,
  @JsonValue("cancelled")
  cancelled;

  @override
  String toString() => switch (this) {
    active => "active",
    exhausted => "exhausted",
    cancelled => "cancelled",
  };

  @override
  String text() => switch (this) {
    active => "Активный",
    exhausted => "Закончился",
    cancelled => "Отменен",
  };

  Color get color => switch (this) {
    active => Colors.green,
    exhausted => Colors.red,
    cancelled => Colors.grey,
  };
}
