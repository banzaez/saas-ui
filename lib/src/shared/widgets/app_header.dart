import 'package:flutter/material.dart';
import 'package:saas_ui/src/shared/widgets/theme_toggle_button.dart';

/// Верхняя панель для shell-экранов (заголовок + действия + тема / уведомления / справка).
class AppHomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHomeHeader({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(104); // 16 + 72 + 16

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final surface = theme.colorScheme.surface;
    final onSurface = theme.colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 16),
            if (actions != null) ...[
              Row(spacing: 8, children: actions!),
              const SizedBox(width: 16),
            ],
            Row(
              spacing: 8,
              children: [
                const ThemeToggleButton(),
                _notificationButton(surface),
                _helpButton(isDark, onSurface),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationButton(Color surface) => Stack(
    clipBehavior: Clip.none,
    children: [
      _HeaderIconButton(
        icon: Icons.notifications_none_rounded,
        tooltip: 'Уведомления',
        onPressed: () {},
      ),
      Positioned(
        right: 8,
        top: 8,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            shape: BoxShape.circle,
            border: Border.all(color: surface, width: 2),
          ),
          constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
        ),
      ),
    ],
  );

  Widget _helpButton(bool isDark, Color onSurface) => _HeaderIconButton(
    icon: Icons.help_outline_rounded,
    tooltip: 'Справка',
    onPressed: () {},
    isDark: isDark,
    onSurface: onSurface,
  );
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.isDark,
    this.onSurface,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final bool? isDark;
  final Color? onSurface;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = isDark ?? theme.brightness == Brightness.dark;
    final foreground =
        onSurface ?? theme.colorScheme.onSurface.withValues(alpha: 0.8);

    final button = Container(
      decoration: BoxDecoration(
        color: dark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, size: 22),
        color: foreground,
        onPressed: onPressed,
        splashRadius: 24,
      ),
    );

    if (tooltip == null) return button;

    return Tooltip(message: tooltip!, child: button);
  }
}
