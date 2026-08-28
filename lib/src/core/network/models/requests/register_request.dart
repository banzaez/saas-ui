import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  final String password;

  RegisterRequest({
    required this.companyName,
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
