import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_token.freezed.dart';
part 'user_token.g.dart';

@freezed
sealed class UserToken with _$UserToken {
  const factory UserToken({
    @JsonKey(name: 'access_token') required String token,
    @JsonKey(name: 'token_type') required String type,
  }) = _UserToken;

  factory UserToken.fromJson(Map<String, dynamic> json) =>
      _$UserTokenFromJson(json);
}
