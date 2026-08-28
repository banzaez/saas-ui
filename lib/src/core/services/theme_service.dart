import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/shared_preferences_provider.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';

part 'theme_service.g.dart';

@Riverpod(keepAlive: true)
class ThemeService extends _$ThemeService {
  static const String _storageKey = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final savedTheme = prefs.getString(_storageKey);

    if (savedTheme != null) {
      final mode = ThemeMode.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeMode.light,
      );
      AppLogger.info('Restored theme mode: ${mode.name}');
      return mode;
    }

    return ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (state == mode) return;

    state = mode;
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_storageKey, mode.name);

    AppLogger.info('Theme mode changed to: ${mode.name}');
  }

  Future<void> toggleTheme() async {
    await setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  bool get isDarkMode => state == ThemeMode.dark;
  bool get isLightMode => state == ThemeMode.light;
  bool get isSystemMode => state == ThemeMode.system;
}
