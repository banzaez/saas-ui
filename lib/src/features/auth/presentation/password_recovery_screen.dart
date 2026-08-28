import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/core/network/repository/auth_repository.dart';
import 'package:saas_ui/src/features/auth/presentation/button_submit.dart';
import 'package:saas_ui/src/shared/widgets/app_version.dart';
import 'package:saas_ui/src/shared/widgets/app_logo.dart';
import 'package:saas_ui/src/core/routers/router_enums.dart';

class PasswordRecoveryScreen extends ConsumerStatefulWidget {
  final String token;

  const PasswordRecoveryScreen({
    super.key,
    required this.token,
  });

  @override
  ConsumerState<PasswordRecoveryScreen> createState() =>
      _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends ConsumerState<PasswordRecoveryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                _buildCard(context),
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

  Widget _buildCard(BuildContext context) {
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Новый пароль',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : AppColors.textColor,
                ),
              ),
            ),
            if (widget.token.isEmpty)
              const Text(
                'Токен сброса пароля отсутствует или недействителен. Пожалуйста, запросите ссылку восстановления пароля заново.',
                style: TextStyle(color: AppColors.error, fontSize: 14),
              )
            else ...[
              Text(
                'Пожалуйста, придумайте новый надежный пароль для вашей учетной записи.',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white70 : Colors.blueGrey.shade600,
                ),
              ),
              _buildPasswordField(),
              _buildConfirmPasswordField(),
              const SizedBox(height: 8),
              if (_isLoading)
                const Center(child: CircularProgressIndicator())
              else
                ButtonSubmit(
                  onPressed: _onSubmitPressed,
                  text: 'Сохранить пароль',
                ),
            ],
            TextButton(
              onPressed: () {
                context.go(MainRouters.auth.route);
              },
              child: const Text(
                'Вернуться к авторизации',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField() => TextFormField(
        controller: _passwordController,
        obscureText: true,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          labelText: 'Новый пароль',
          hintText: 'Введите новый пароль',
          prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
        ),
        validator: _passwordValidator,
      );

  Widget _buildConfirmPasswordField() => TextFormField(
        controller: _confirmPasswordController,
        obscureText: true,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          labelText: 'Подтверждение пароля',
          hintText: 'Повторите новый пароль',
          prefixIcon: Icon(Icons.lock_rounded, size: 20),
        ),
        validator: _confirmPasswordValidator,
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

  Future<void> _onSubmitPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final result = await ref
          .read(authRepositoryProvider)
          .resetPassword(widget.token, _passwordController.text);

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      if (result.isSuccess) {
        AppSnackbar.showSuccess(
          title: 'Успешно',
          message: 'Пароль успешно изменен. Войдите в систему с новым паролем.',
        );
        if (mounted) {
          context.go(MainRouters.auth.route);
        }
      } else {
        result.showError();
      }
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите новый пароль';
    }
    if (value.length < 8) {
      return 'Пароль должен содержать не менее 8 символов';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Пожалуйста, повторите новый пароль';
    }
    if (value != _passwordController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }
}
