import 'package:json_annotation/json_annotation.dart';

part "app_file_upload_response.g.dart";

@JsonSerializable()
class AppFileUploadResponse {
  @JsonKey(name: 'file_id')
  final int fileId;

  AppFileUploadResponse({required this.fileId});

  factory AppFileUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$AppFileUploadResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AppFileUploadResponseToJson(this);
}
