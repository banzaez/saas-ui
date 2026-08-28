import 'package:json_annotation/json_annotation.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

part 'payment_qr_status_response.g.dart';

@JsonSerializable()
class PaymentQrStatusResponse {
  @JsonKey(name: 'status')
  final PaymentStatus status;
  @JsonKey(name: 'is_paid')
  final bool isPaid;

  PaymentQrStatusResponse({required this.status, required this.isPaid});

  factory PaymentQrStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentQrStatusResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentQrStatusResponseToJson(this);
}
