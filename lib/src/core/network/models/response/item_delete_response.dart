import 'package:json_annotation/json_annotation.dart';

part 'item_delete_response.g.dart';

@JsonSerializable()
class ItemDeleteResponse {
  final String detail;

  ItemDeleteResponse({this.detail = ''});

  factory ItemDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemDeleteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDeleteResponseToJson(this);
}
