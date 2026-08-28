import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/core/services/theme_service.dart';
import 'package:saas_ui/src/core/services/user_service.dart';
import '../application/settings_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const AppHomeHeader(title: 'Настройки'),
      body: SelectionArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1024),
            child: _buildBody(ref),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(WidgetRef ref) => ListView(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    children: [_buildThemeSettings(ref), _buildUserSettings(ref)],
  );

  // => BUILDERS

  Widget _buildCard({required String title, required List<Widget> children}) =>
      AppContainer(
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              ...children,
            ],
          ),
        ),
      );

  Widget _buildThemeSettings(WidgetRef ref) {
    final themeMode = ref.watch(themeServiceProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return _buildCard(
      title: 'Внешний вид',
      children: [
        ListTile(
          title: const Text(
            'Тема приложения',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(_getThemeModeText(themeMode)),
          trailing: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: AppDropdown<ThemeMode>(
              initialValue: themeMode,
              onChanged: notifier.changeThemeMode,
              items: ThemeMode.values
                  .map(
                    (ThemeMode mode) => DropdownMenuItem<ThemeMode>(
                      value: mode,
                      child: Text(_getThemeModeText(mode)),
                    ),
                  )
                  .toList(),
              showClearButton: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserSettings(WidgetRef ref) {
    final user = ref.watch(userServiceProvider);
    final notifier = ref.read(settingsProvider.notifier);
    final timezones = notifier.timezones;

    return _buildCard(
      title: 'Настройки пользователя',
      children: [
        ListTile(
          title: const Text(
            'Временная зона',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(user.value?.timezone ?? 'Не установлена'),
          trailing: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: AppDropdown<String>(
              initialValue: user.value?.timezone,
              onChanged: notifier.changeTimezone,
              items: timezones
                  .map(
                    (String timezone) => DropdownMenuItem<String>(
                      value: timezone,
                      child: Text(timezone),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // => HELPERS

  String _getThemeModeText(ThemeMode mode) => switch (mode) {
    ThemeMode.light => 'Светлая',
    ThemeMode.dark => 'Темная',
    ThemeMode.system => 'Системная',
  };
}
