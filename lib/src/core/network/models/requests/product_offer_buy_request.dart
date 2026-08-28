import 'package:json_annotation/json_annotation.dart';

part 'product_offer_buy_request.g.dart';

@JsonSerializable()
class ProductOfferBuyRequest {
  @JsonKey(name: 'certificate_id')
  final int? certificateId;

  ProductOfferBuyRequest({this.certificateId});

  factory ProductOfferBuyRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductOfferBuyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOfferBuyRequestToJson(this);
}
