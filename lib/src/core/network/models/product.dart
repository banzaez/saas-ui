import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/has_active_status.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
sealed class Product with _$Product implements BaseModel, HasActiveStatus {
  const Product._();

  const factory Product({
    int? id,
    @Default('') String name,
    @Default('') String description,
    @JsonKey(name: 'seller_id') int? sellerId,
    @JsonKey(name: 'seller_name', includeToJson: false)
    @Default("")
    String sellerName,
    @JsonKey(name: 'external_api_url') @Default("") String url,
    @JsonKey(name: 'key_name') @Default("") String keyName,
    @JsonKey(name: 'demo_product_offer_id') int? demoProductOfferId,

    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'use_proxy') @Default(false) bool useProxy,
    @JsonKey(name: 'proxy_parameters', includeIfNull: false)
    ProxyParameters? proxyParameters,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  String get getName => name;
}

@freezed
sealed class ProxyParameters with _$ProxyParameters {
  const ProxyParameters._();

  const factory ProxyParameters({
    @JsonKey(includeIfNull: false) String? host,
    @JsonKey(includeIfNull: false) String? port,
    @JsonKey(includeIfNull: false) String? user,
    @JsonKey(includeIfNull: false) String? password,
  }) = _ProxyParameters;

  factory ProxyParameters.fromJson(Map<String, dynamic> json) =>
      _$ProxyParametersFromJson(json);
}
