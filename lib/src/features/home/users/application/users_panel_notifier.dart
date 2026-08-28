import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/features/home/users/application/users_notifier.dart';

part 'users_panel_notifier.g.dart';

@riverpod
class UsersPanel extends _$UsersPanel with PanelActions<User> {
  @override
  User? build() => null;

  void openCreate() {
    state = ref.read(usersProvider.notifier).createNewInstance();
  }
}
