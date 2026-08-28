// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyReferral _$CompanyReferralFromJson(Map<String, dynamic> json) =>
    _CompanyReferral(
      id: (json['id'] as num).toInt(),
      displayName: json['display_name'] as String,
      guid: json['guid'] as String?,
    );

Map<String, dynamic> _$CompanyReferralToJson(_CompanyReferral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'guid': instance.guid,
    };
