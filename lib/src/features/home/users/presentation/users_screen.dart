import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/features/home/users/application/users_notifier.dart';
import 'package:saas_ui/src/features/home/users/application/users_panel_notifier.dart';
import 'package:saas_ui/src/features/home/users/presentation/users_edit_panel.dart';
import 'package:saas_ui/src/features/home/users/presentation/users_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/search_field.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class UsersScreen extends ConsumerWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNotifier = ref.read(usersProvider.notifier);
    final panelNotifier = ref.read(usersPanelProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Пользователи'),
      body: SelectionArea(
        child: AppScreenWithPanel(
          screen: PaddingPageContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                AppContainer(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: SearchField(
                          hintText: 'Поиск...',
                          onChanged: listNotifier.setSearchQuery,
                        ),
                      ),
                      Flexible(
                        child: AppDropdown<UserRole?>(
                          initialValue: listNotifier.settings.filter.role,
                          onChanged: listNotifier.setRole,
                          enumValues: UserRole.values,
                          hint: 'Все роли',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: panelNotifier.openCreate,
                        child: const Text('Добавить пользователя'),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: UsersTable()),
              ],
            ),
          ),
          editPanel: const UsersEditPanel(),
        ),
      ),
    );
  }
}
