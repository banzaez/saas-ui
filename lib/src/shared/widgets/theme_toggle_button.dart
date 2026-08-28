import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/services/theme_service.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeService = ref.read(themeServiceProvider.notifier);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () => themeService.toggleTheme(),
        icon: Icon(
          themeService.isDarkMode
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
          size: 22,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        ),
        tooltip: themeService.isDarkMode
            ? 'Переключить на светлую тему'
            : 'Переключить на темную тему',
      ),
    );
  }
}
