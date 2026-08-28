import 'package:json_annotation/json_annotation.dart';

part 'email_response.g.dart';

@JsonSerializable()
class EmailResponse {
  final String detail;

  EmailResponse({required this.detail});

  factory EmailResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmailResponseToJson(this);
}
