// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  sellerId: (json['seller_id'] as num?)?.toInt(),
  sellerName: json['seller_name'] as String? ?? "",
  url: json['external_api_url'] as String? ?? "",
  keyName: json['key_name'] as String? ?? "",
  demoProductOfferId: (json['demo_product_offer_id'] as num?)?.toInt(),
  isActive: json['is_active'] as bool? ?? true,
  useProxy: json['use_proxy'] as bool? ?? false,
  proxyParameters: json['proxy_parameters'] == null
      ? null
      : ProxyParameters.fromJson(
          json['proxy_parameters'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'seller_id': instance.sellerId,
  'external_api_url': instance.url,
  'key_name': instance.keyName,
  'demo_product_offer_id': instance.demoProductOfferId,
  'is_active': instance.isActive,
  'use_proxy': instance.useProxy,
  'proxy_parameters': ?instance.proxyParameters,
};

_ProxyParameters _$ProxyParametersFromJson(Map<String, dynamic> json) =>
    _ProxyParameters(
      host: json['host'] as String?,
      port: json['port'] as String?,
      user: json['user'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$ProxyParametersToJson(_ProxyParameters instance) =>
    <String, dynamic>{
      'host': ?instance.host,
      'port': ?instance.port,
      'user': ?instance.user,
      'password': ?instance.password,
    };
