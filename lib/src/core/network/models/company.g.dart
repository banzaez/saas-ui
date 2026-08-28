// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
  id: (json['id'] as num?)?.toInt(),
  displayName: json['display_name'] as String? ?? "",
  status:
      $enumDecodeNullable(_$CompanyStatusEnumMap, json['status']) ??
      CompanyStatus.active,
  packageId: (json['package_id'] as num?)?.toInt(),
  guid: json['guid'] as String? ?? "",
  referralCode: json['referral_code'] as String?,
  referrals: (json['referrals'] as List<dynamic>?)
      ?.map((e) => CompanyReferral.fromJson(e as Map<String, dynamic>))
      .toList(),
  sdelkabizId: (json['sdelkabiz_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  mystockAccountId: json['mystock_account_id'] as String?,
);

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
  'id': instance.id,
  'display_name': instance.displayName,
  'status': _$CompanyStatusEnumMap[instance.status]!,
  'package_id': instance.packageId,
  'guid': instance.guid,
  'referral_code': instance.referralCode,
  'referrals': instance.referrals,
  'sdelkabiz_id': instance.sdelkabizId,
  'created_at': instance.createdAt,
  'mystock_account_id': instance.mystockAccountId,
};

const _$CompanyStatusEnumMap = {
  CompanyStatus.active: 'active',
  CompanyStatus.inactive: 'inactive',
  CompanyStatus.blocked: 'blocked',
};
