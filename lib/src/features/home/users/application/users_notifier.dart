import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_crud_notifier.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/network/repository/users_repository.dart';
import 'package:saas_ui/src/features/home/users/application/settings/user_settings.dart';

part 'users_notifier.g.dart';

@riverpod
class Users extends _$Users
    with
        AsyncReadOnlyNotifierMixin<User, int, UserSettings>,
        AsyncCrudNotifierMixin<User, int, UserSettings>,
        AppTableSourceMixin<User, UserSettings> {
  UserSettings _settings = UserSettings();
  @override
  UserSettings get settings => _settings;
  @override
  set settings(UserSettings value) => _settings = value;

  @override
  UsersRepository get repository => ref.read(usersRepositoryProvider);

  @override
  FutureOr<List<User>> build() => reloadItems();

  @override
  User createNewInstance() => const User();

  Future<void> setRole(UserRole? role) =>
      applyFilter(() => settings.filter.role = role);
}
