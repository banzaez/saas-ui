// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LegalEntity _$LegalEntityFromJson(Map<String, dynamic> json) => _LegalEntity(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt() ?? 0,
  companyName: json['company_name'] as String? ?? "",
  inn: json['inn'] as String? ?? "",
  kpp: json['kpp'] as String? ?? "",
  fullName: json['full_name'] as String? ?? "",
  bank: json['bank'] as String? ?? "",
  bankAccount: json['bank_account'] as String? ?? "",
  korrAccount: json['korr_account'] as String? ?? "",
  bik: json['bik'] as String? ?? "",
  address: json['address'] as String? ?? "",
  phone: json['phone'] as String? ?? "",
  email: json['email'] as String? ?? "",
  isSeller: json['is_seller'] as bool? ?? false,
);

Map<String, dynamic> _$LegalEntityToJson(_LegalEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'inn': instance.inn,
      'kpp': instance.kpp,
      'full_name': instance.fullName,
      'bank': instance.bank,
      'bank_account': instance.bankAccount,
      'korr_account': instance.korrAccount,
      'bik': instance.bik,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'is_seller': instance.isSeller,
    };
