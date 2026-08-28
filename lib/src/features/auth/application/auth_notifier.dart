import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/repository/auth_repository.dart';
import 'package:saas_ui/src/core/services/token_service.dart';

part 'auth_notifier.freezed.dart';
part 'auth_notifier.g.dart';

@freezed
sealed class AuthUiState with _$AuthUiState {
  const factory AuthUiState({
    @Default(true) bool isLogin,
    @Default(false) bool isForgotPassword,
  }) = _AuthUiState;
}

@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<AuthUiState> build() => const AuthUiState();

  void setLoginTab(bool isLogin) {
    final cur = state.value ?? const AuthUiState();
    state = AsyncData(cur.copyWith(isLogin: isLogin, isForgotPassword: false));
  }

  void showForgotPassword(bool show) {
    final cur = state.value ?? const AuthUiState();
    state = AsyncData(cur.copyWith(isForgotPassword: show));
  }

  Future<bool> login(String email, String password) async {
    final cur = state.value ?? const AuthUiState();
    state = const AsyncLoading();

    final apiResult = await ref
        .read(authRepositoryProvider)
        .login(email, password);

    if (!ref.mounted) return false;

    if (apiResult.isSuccess) {
      await ref.read(tokenServiceProvider.notifier).save(apiResult.result!);
      if (!ref.mounted) return false;
      state = AsyncData(cur);
      return true;
    }

    apiResult.showError();
    state = AsyncData(cur);
    return false;
  }

  Future<bool> register(
    String companyName,
    String email,
    String password,
  ) async {
    final cur = state.value ?? const AuthUiState();
    state = const AsyncLoading();

    final apiResult = await ref
        .read(authRepositoryProvider)
        .register(companyName, email, password);

    if (!ref.mounted) return false;

    if (apiResult.isSuccess) {
      await ref.read(tokenServiceProvider.notifier).save(apiResult.result!);
      if (!ref.mounted) return false;
      state = AsyncData(cur);
      return true;
    }

    apiResult.showError();
    state = AsyncData(cur);
    return false;
  }

  Future<bool> requestPasswordReset(String email) async {
    final cur = state.value ?? const AuthUiState();
    state = const AsyncLoading();

    final apiResult = await ref
        .read(authRepositoryProvider)
        .requestPasswordReset(email);

    if (!ref.mounted) return false;

    if (apiResult.isSuccess) {
      state = AsyncData(cur.copyWith(isForgotPassword: false));
      return true;
    }

    apiResult.showError();
    state = AsyncData(cur);
    return false;
  }
}
