// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppFile _$AppFileFromJson(Map<String, dynamic> json) => _AppFile(
  id: (json['id'] as num?)?.toInt(),
  filename: json['filename'] as String,
  uuid: json['uuid'] as String,
  url: json['url'] as String,
  companyId: (json['company_id'] as num?)?.toInt(),
  companyName: json['company_name'] as String?,
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  mimetype: json['mimetype'] as String?,
);

Map<String, dynamic> _$AppFileToJson(_AppFile instance) => <String, dynamic>{
  'id': instance.id,
  'filename': instance.filename,
  'company_id': instance.companyId,
  'product_id': instance.productId,
  'mimetype': instance.mimetype,
};
