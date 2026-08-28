import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

enum AppSnackbarType { success, error, info }

class AppSnackbar {
  AppSnackbar._();

  static OverlayEntry? _currentEntry;

  static void showSuccess({required String title, required String message}) =>
      _show(title: title, message: message, type: AppSnackbarType.success);

  static void showError({required String title, required String message}) =>
      _show(title: title, message: message, type: AppSnackbarType.error);

  static void showInfo({required String title, required String message}) =>
      _show(title: title, message: message, type: AppSnackbarType.info);

  static void _show({
    required String title,
    required String message,
    required AppSnackbarType type,
  }) {
    final overlay = AppRouters.rootNavigatorKey.currentState?.overlay;
    if (overlay == null) return;

    // Удаляем предыдущий, если он есть
    _removeCurrent();

    _currentEntry = OverlayEntry(
      builder: (context) => _AppSnackbarWidget(
        title: title,
        message: message,
        type: type,
        onDismiss: _removeCurrent,
      ),
    );

    overlay.insert(_currentEntry!);
  }

  static void _removeCurrent() {
    if (_currentEntry != null) {
      try {
        _currentEntry?.remove();
      } catch (e) {
        // Игнорируем, если уже удалено
      }
      _currentEntry = null;
    }
  }
}

class _AppSnackbarWidget extends StatefulWidget {
  final String title;
  final String message;
  final AppSnackbarType type;
  final VoidCallback onDismiss;

  const _AppSnackbarWidget({
    required this.title,
    required this.message,
    required this.type,
    required this.onDismiss,
  });

  @override
  State<_AppSnackbarWidget> createState() => _AppSnackbarWidgetState();
}

class _AppSnackbarWidgetState extends State<_AppSnackbarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Timer? _displayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.forward();

    _displayTimer = Timer(const Duration(seconds: 4), () {
      _dismiss();
    });
  }

  void _dismiss() async {
    if (!mounted) return;
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _displayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = switch (widget.type) {
      AppSnackbarType.success =>
        isDark ? const Color(0xFF1B2E1E) : const Color(0xFFE9F7EF),
      AppSnackbarType.error =>
        isDark ? const Color(0xFF2E1B1B) : const Color(0xFFFDEDEE),
      AppSnackbarType.info =>
        isDark ? const Color(0xFF1B262E) : const Color(0xFFEBF5FB),
    };

    final mainColor = switch (widget.type) {
      AppSnackbarType.success => const Color(0xFF27AE60),
      AppSnackbarType.error => AppColors.error,
      AppSnackbarType.info => AppColors.primary,
    };

    final icon = switch (widget.type) {
      AppSnackbarType.success => Icons.check_circle_rounded,
      AppSnackbarType.error => Icons.error_rounded,
      AppSnackbarType.info => Icons.info_rounded,
    };

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: mainColor.withAlpha(51)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: mainColor.withAlpha(25),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, color: mainColor, size: 24),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.textColorDark
                                    : AppColors.textColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.message,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: isDark
                                    ? AppColors.textGreyDark
                                    : AppColors.textGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: _dismiss,
                        icon: Icon(
                          Icons.close,
                          color: isDark
                              ? AppColors.textGreyDark
                              : AppColors.textGrey,
                          size: 18,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
