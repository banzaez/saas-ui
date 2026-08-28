// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num?)?.toInt(),
  fullName: json['full_name'] as String? ?? "",
  companyId: (json['company_id'] as num?)?.toInt(),
  companyName: json['company_name'] as String? ?? "",
  email: json['email'] as String? ?? "",
  password: json['password'] as String?,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.owner,
  timezone: json['timezone'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'company_id': instance.companyId,
  'email': instance.email,
  'password': instance.password,
  'role': _$UserRoleEnumMap[instance.role]!,
  'timezone': instance.timezone,
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.support: 'support',
  UserRole.owner: 'owner',
  UserRole.user: 'user',
};
