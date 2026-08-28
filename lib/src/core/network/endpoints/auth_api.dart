import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/network/models/requests/login_request.dart';
import 'package:saas_ui/src/core/network/models/response/user_token.dart';
import 'package:saas_ui/src/core/network/models/requests/register_request.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';
import 'package:saas_ui/src/core/network/models/requests/reset_password_request.dart';

const String _path = "/auth";

mixin AuthApiMixin {
  @POST("$_path/login")
  Future<ServerResponse<UserToken>> login(@Body() LoginRequest request);

  @POST("$_path/register")
  Future<ServerResponse<UserToken>> register(@Body() RegisterRequest request);

  @POST("$_path/login_sso")
  Future<ServerResponse<UserToken>> loginSso(@Body() Map<String, String> body);

  @GET("$_path/me")
  Future<ServerResponse<User>> me();

  @GET("/admin/user/password_reset")
  Future<ServerResponse<void>> requestPasswordReset(@Query("email") String email);

  @POST("/admin/user/password_reset")
  Future<ServerResponse<void>> resetPassword(@Body() ResetPasswordRequest request);
}
