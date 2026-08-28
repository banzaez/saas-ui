import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/theme_service.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

part 'settings_notifier.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  // only russian Location
  static const List<String> _timezones = [
    'Europe/Kaliningrad',
    'Europe/Moscow',
    'Europe/Samara',
  ];

  @override
  void build() {}

  List<String> get timezones => _timezones;

  void changeThemeMode(ThemeMode? mode) {
    if (mode == null) return;
    ref.read(themeServiceProvider.notifier).setThemeMode(mode);
  }

  Future<void> changeTimezone(String? timezone) async {
    final currentUser = ref.read(userServiceProvider);
    if (currentUser.value == null || timezone == null) return;

    final updatedUser = currentUser.value!.copyWith(timezone: timezone);
    await ref.read(userServiceProvider.notifier).updateUser(updatedUser);
  }
}
