import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';

part 'app_file.freezed.dart';
part 'app_file.g.dart';

@freezed
sealed class AppFile with _$AppFile implements BaseModel {
  const AppFile._();

  const factory AppFile({
    int? id,
    @JsonKey(name: 'filename') required String filename,
    @JsonKey(name: 'uuid', includeToJson: false) required String uuid,
    @JsonKey(name: 'url', includeToJson: false) required String url,
    @JsonKey(name: 'company_id') int? companyId,
    @JsonKey(name: 'company_name', includeToJson: false) String? companyName,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name', includeToJson: false) String? productName,
    @JsonKey(name: 'mimetype') String? mimetype,
  }) = _AppFile;

  factory AppFile.fromJson(Map<String, dynamic> json) =>
      _$AppFileFromJson(json);

  @override
  String get getName => id?.toString() ?? "";
}
