import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/home/users/application/settings/user_settings.dart';
import 'package:saas_ui/src/core/network/models/user.dart';

part 'users_repository.g.dart';

@Riverpod(keepAlive: true)
UsersRepository usersRepository(Ref ref) =>
    UsersRepository(ref.watch(serverApiProvider));

class UsersRepository extends CrudRepository<User, int, UserSettings> {
  UsersRepository(super.api);
  @override
  Future<RequestResult<User>> getById(int id) =>
      sendRequest<User>(() => api.getUser(id));

  @override
  Future<RequestResult<List<User>>> listAll([UserSettings? filter]) =>
      sendRequest<List<User>>(
        () => api.getUsers(filter?.offset, filter?.limit),
      );

  @override
  Future<RequestResult<User>> create(User user) =>
      sendRequest<User>(() => api.createUser(user));

  @override
  Future<RequestResult<User>> update(int id, User user) =>
      sendRequest<User>(() => api.updateUser(id, user));

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteUser(id));
}
