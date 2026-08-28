import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/auth/application/auth_notifier.dart';
import 'package:saas_ui/src/features/auth/presentation/login_form.dart';
import 'package:saas_ui/src/features/auth/presentation/register_form.dart';
import 'package:saas_ui/src/features/auth/presentation/forgot_password_form.dart';
import 'package:saas_ui/src/shared/widgets/app_version.dart';
import 'package:saas_ui/src/shared/widgets/app_logo.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(authProvider);
    final uiValue = ui.value ?? const AuthUiState();
    final notifier = ref.read(authProvider.notifier);

    return Scaffold(
      body: _buildBackground(
        context,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 32,
              children: [
                _buildHeaderLogo(),
                _buildAuthCard(context, ui, uiValue, notifier),
                _buildFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(BuildContext context, {required Widget child}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
              : [const Color(0xFFF8FAFC), const Color(0xFFEFF6FF)],
        ),
      ),
      child: child,
    );
  }

  Widget _buildHeaderLogo() =>
      const AppLogo(isVertical: true, showSubtitle: true, iconSize: 48);

  Widget _buildAuthCard(
    BuildContext context,
    AsyncValue<AuthUiState> ui,
    AuthUiState uiValue,
    Auth notifier,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: const BoxConstraints(maxWidth: 440),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.4)
                : AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 32,
        children: [_buildTabs(), _buildFormContent()],
      ),
    );
  }

  Widget _buildTabs() => Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final ui = ref.watch(authProvider);
      final uiValue = ui.value ?? const AuthUiState();
      final notifier = ref.read(authProvider.notifier);
      if (uiValue.isForgotPassword) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Восстановление пароля',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : AppColors.textColor,
            ),
          ),
        );
      }
      return Row(
        children: [
          _buildTab(
            context,
            text: 'Вход',
            isSelected: uiValue.isLogin,
            onTap: ui.isLoading ? () {} : () => notifier.setLoginTab(true),
          ),
          _buildTab(
            context,
            text: 'Регистрация',
            isSelected: !uiValue.isLogin,
            onTap: ui.isLoading ? () {} : () => notifier.setLoginTab(false),
          ),
        ],
      );
    },
  );

  Widget _buildTab(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Column(
            spacing: 8,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.primary
                      : Colors.blueGrey.shade300,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 3,
                width: isSelected ? 40 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormContent() => Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final ui = ref.watch(authProvider);
      final uiValue = ui.value ?? const AuthUiState();
      if (uiValue.isForgotPassword) {
        return const ForgotPasswordForm();
      }
      return uiValue.isLogin ? const LoginForm() : const RegisterForm();
    },
  );

  Widget _buildFooter(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text(
          '© ${DateTime.now().year} KeySoft SaaS Platform',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: isDark ? Colors.white54 : Colors.blueGrey.shade400,
          ),
        ),
        const AppVersion(),
      ],
    );
  }
}
