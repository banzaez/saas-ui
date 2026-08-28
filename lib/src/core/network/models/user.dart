import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User implements BaseModel {
  const User._(); // For rich domain methods

  const factory User({
    int? id,
    @JsonKey(name: "full_name") @Default("") String fullName,
    @JsonKey(name: "company_id") int? companyId,
    @JsonKey(name: 'company_name', includeToJson: false)
    @Default("")
    String companyName,
    @Default("") String email,
    String? password,
    @Default(UserRole.owner) UserRole role,
    String? timezone,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Rich domain methods
  @override
  String get getName => email;
}

enum UserRole with EnumWithText {
  @JsonValue("admin")
  admin,
  @JsonValue("support")
  support,
  @JsonValue("owner")
  owner,
  @JsonValue("user")
  user;

  @override
  String toString() => name;

  @override
  String text() => switch (this) {
    admin => 'Администратор',
    support => 'Служба поддержки',
    owner => 'Основной пользователь',
    user => 'Пользователь',
  };

  Color get color => switch (this) {
    admin => Colors.red,
    support => Colors.blue,
    owner => Colors.green,
    user => Colors.orange,
  };
}
