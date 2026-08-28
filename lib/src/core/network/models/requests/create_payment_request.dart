import 'package:json_annotation/json_annotation.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

part 'create_payment_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CreatePaymentRequest {
  @JsonKey(name: 'legal_entity_id')
  final int? legalEntityId;
  @JsonKey(name: 'payment_method')
  final PaymentMethod? paymentMethod;
  @JsonKey(name: 'payment_provider')
  final PaymentProvider? paymentProvider;

  CreatePaymentRequest({
    this.legalEntityId,
    this.paymentMethod,
    this.paymentProvider,
  });

  factory CreatePaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreatePaymentRequestToJson(this);
}
