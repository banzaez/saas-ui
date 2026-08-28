import 'package:flutter/material.dart' show Colors, Color;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';

part 'pin_code.freezed.dart';
part 'pin_code.g.dart';

@freezed
sealed class PinCode with _$PinCode implements BaseModel {
  const PinCode._();

  const factory PinCode({
    int? id,
    @JsonKey(name: 'company_id') @Default(0) int companyId,
    @JsonKey(name: 'certificate_id') @Default(0) int certificateId,
    @JsonKey(name: 'certificate_item_id') @Default(0) int certificateItemId,
    @Default("") String code,
    @Default(PinCodeStatus.created) PinCodeStatus status,
    @Default("") String key,
    @JsonKey(name: 'activated_at') DateTime? activatedAt,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PinCode;

  factory PinCode.fromJson(Map<String, dynamic> json) =>
      _$PinCodeFromJson(json);

  @override
  String get getName => code;
}

enum PinCodeStatus with EnumWithText {
  @JsonValue('created')
  created,
  @JsonValue('activated')
  activated,
  @JsonValue('exhausted')
  exhausted;

  @override
  String toString() => switch (this) {
    created => 'created',
    activated => 'activated',
    exhausted => 'exhausted',
  };

  @override
  String text() => switch (this) {
    created => "Создан",
    activated => "Активирован",
    exhausted => "Закончился",
  };

  Color get color => switch (this) {
    created => Colors.blue,
    activated => Colors.green,
    exhausted => Colors.red,
  };
}
