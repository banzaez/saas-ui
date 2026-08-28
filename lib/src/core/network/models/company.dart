import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/core/network/models/company_referral.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
sealed class Company with _$Company implements BaseModel {
  const Company._();

  const factory Company({
    int? id,
    @JsonKey(name: 'display_name') @Default("") String displayName,
    @Default(CompanyStatus.active) CompanyStatus status,
    @JsonKey(name: 'package_id') int? packageId,
    @Default("") String guid,
    @JsonKey(name: 'referral_code') String? referralCode,
    @JsonKey(name: 'referrals') List<CompanyReferral>? referrals,
    @JsonKey(name: 'sdelkabiz_id') int? sdelkabizId,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'mystock_account_id') String? mystockAccountId,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  @override
  String get getName => displayName;
}

enum CompanyStatus with EnumWithText {
  active,
  inactive,
  blocked;

  @override
  String toString() => switch (this) {
    active => 'active',
    inactive => 'inactive',
    blocked => 'blocked',
  };

  @override
  String text() => switch (this) {
    active => 'Активный',
    inactive => 'Неактивный',
    blocked => 'Заблокирован',
  };

  Color get color => switch (this) {
    active => Colors.green,
    inactive => Colors.grey,
    blocked => Colors.red,
  };
}
