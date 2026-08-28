import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/network/models/requests/login_request.dart';
import 'package:saas_ui/src/core/network/models/response/user_token.dart';
import 'package:saas_ui/src/core/network/models/requests/register_request.dart';
import 'package:saas_ui/src/core/network/models/requests/reset_password_request.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) =>
    AuthRepository(ref.watch(serverApiProvider));

class AuthRepository extends BaseRepository {
  AuthRepository(super.api);

  Future<RequestResult<UserToken>> login(String login, String password) =>
      sendRequest<UserToken>(
        () => api.login(LoginRequest(email: login, password: password)),
      );

  Future<RequestResult<UserToken>> register(
    String fullName,
    String email,
    String password,
  ) => sendRequest<UserToken>(
    () => api.register(
      RegisterRequest(
        companyName: fullName,
        fullName: fullName,
        email: email,
        password: password,
      ),
    ),
  );

  Future<RequestResult<UserToken>> loginSso(String ssoToken) =>
      sendRequest<UserToken>(() => api.loginSso({"token": ssoToken}));

  Future<RequestResult<User>> me() => sendRequest<User>(() => api.me());

  Future<RequestResult<void>> requestPasswordReset(String email) =>
      sendRequest<void>(() => api.requestPasswordReset(email));

  Future<RequestResult<void>> resetPassword(String token, String password) =>
      sendRequest<void>(
        () => api.resetPassword(
          ResetPasswordRequest(token: token, password: password),
        ),
      );
}
