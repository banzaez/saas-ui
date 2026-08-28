import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_referral.freezed.dart';
part 'company_referral.g.dart';

@freezed
sealed class CompanyReferral with _$CompanyReferral {
  const factory CompanyReferral({
    required int id,
    @JsonKey(name: 'display_name') required String displayName,
    String? guid,
  }) = _CompanyReferral;

  factory CompanyReferral.fromJson(Map<String, dynamic> json) =>
      _$CompanyReferralFromJson(json);
}
