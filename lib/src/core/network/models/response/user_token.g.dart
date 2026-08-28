// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserToken _$UserTokenFromJson(Map<String, dynamic> json) => _UserToken(
  token: json['access_token'] as String,
  type: json['token_type'] as String,
);

Map<String, dynamic> _$UserTokenToJson(_UserToken instance) =>
    <String, dynamic>{
      'access_token': instance.token,
      'token_type': instance.type,
    };
