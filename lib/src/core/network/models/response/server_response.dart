import 'package:json_annotation/json_annotation.dart';

part 'server_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ServerResponse<T> {
  final DateTime date;
  final ServerResponseStatus status;
  final T? result;

  ServerResponse(this.date, this.status, this.result);

  factory ServerResponse.error(int code, String message) =>
      ServerResponse(DateTime.now(), ServerResponseStatus(code, message), null);

  // ---------------------------------------------------------------------------

  factory ServerResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ServerResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ServerResponseToJson(this, toJsonT);

  // ---------------------------------------------------------------------------

  int get errorCode => status.code;
  String get errorMessage => status.message;

  String get errorString => "$errorCode - $errorMessage";

  bool get isSuccess => errorCode == 0 || (errorCode >= 200 && errorCode < 300);
}

@JsonSerializable()
class ServerResponseStatus {
  final int code;
  final String message;

  ServerResponseStatus(this.code, this.message);

  factory ServerResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$ServerResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ServerResponseStatusToJson(this);
}
