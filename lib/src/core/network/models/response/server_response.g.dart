// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerResponse<T> _$ServerResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ServerResponse<T>(
  DateTime.parse(json['date'] as String),
  ServerResponseStatus.fromJson(json['status'] as Map<String, dynamic>),
  _$nullableGenericFromJson(json['result'], fromJsonT),
);

Map<String, dynamic> _$ServerResponseToJson<T>(
  ServerResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'status': instance.status,
  'result': _$nullableGenericToJson(instance.result, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

ServerResponseStatus _$ServerResponseStatusFromJson(
  Map<String, dynamic> json,
) => ServerResponseStatus(
  (json['code'] as num).toInt(),
  json['message'] as String,
);

Map<String, dynamic> _$ServerResponseStatusToJson(
  ServerResponseStatus instance,
) => <String, dynamic>{'code': instance.code, 'message': instance.message};
