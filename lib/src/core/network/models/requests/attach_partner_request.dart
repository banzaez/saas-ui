import 'package:json_annotation/json_annotation.dart';

part 'attach_partner_request.g.dart';

@JsonSerializable()
class AttachPartnerRequest {
  @JsonKey(name: 'referral_code')
  final String referralCode;

  AttachPartnerRequest({required this.referralCode});

  factory AttachPartnerRequest.fromJson(Map<String, dynamic> json) =>
      _$AttachPartnerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AttachPartnerRequestToJson(this);
}
