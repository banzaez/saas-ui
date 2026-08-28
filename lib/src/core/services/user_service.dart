import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/network/models/response/user_token.dart';
import 'package:saas_ui/src/core/network/repository/auth_repository.dart';
import 'package:saas_ui/src/core/network/repository/users_repository.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/services/token_service.dart';

part 'user_service.g.dart';

@Riverpod(keepAlive: true)
class UserService extends _$UserService {

  @override
  FutureOr<User?> build() async {
    final token = ref.watch(tokenServiceProvider);

    if (token == null) return null;

    return await _fetchMe();
  }

  // => Initialization

  // Приватный метод загрузки, возвращающий данные для build()
  Future<User?> _fetchMe() async {
    final result = await ref.read(authRepositoryProvider).me();
    if (result.isSuccess) return result.result;

    AppLogger.warning('Failed to load user: ${result.errorMessage}');
    throw Exception(result.errorMessage);
  }

  /// Вход через SSO токен.
  /// Токен обычно передается из параметров URL через роутер.
  Future<void> loginSso(String ssoToken) async {
    state = const AsyncValue.loading();
    
    final result = await ref.read(authRepositoryProvider).loginSso(ssoToken);
    if (result.isSuccess) {
      // Сохраняем токен. Это вызовет обновление tokenServiceProvider,
      // что в свою очередь перезапустит build() этого сервиса.
      await ref.read(tokenServiceProvider.notifier).save(result.result);
    } else {
      state = AsyncValue.error(result.errorMessage, StackTrace.current);
    }
  }

  // => Getters

  bool get hasSession => ref.read(tokenServiceProvider) != null;
  UserToken? get userToken => ref.read(tokenServiceProvider);

  bool get isOwner => state.value?.role == UserRole.owner;
  bool get isSupport => state.value?.role == UserRole.support;
  bool get isAdmin => state.value?.role == UserRole.admin;
  UserRole? get role => state.value?.role;

  int get defaultCompanyId => state.value?.companyId ?? 0;

  // => API Calls

  Future<void> refreshProfile() async {
    final id = state.value?.id;
    if (id == null) return;

    state = await AsyncValue.guard(() async {
      final response = await ref.read(usersRepositoryProvider).getById(id);
      if (response.isSuccess) return response.result;
      throw Exception(response.errorMessage);
    });
  }

  Future<void> updateUser(User user) async {
    state = await AsyncValue.guard(() async {
      final response = await ref
          .read(usersRepositoryProvider)
          .update(user.id!, user);
      if (response.isSuccess) return response.result;
      throw Exception(response.errorMessage);
    });
  }
}
