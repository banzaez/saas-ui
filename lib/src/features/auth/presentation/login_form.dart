import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/auth/application/auth_notifier.dart';
import 'package:saas_ui/src/features/auth/presentation/button_submit.dart';
import 'package:string_validator/string_validator.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKeyLogin = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Form(
    key: _formKeyLogin,
    child: AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20,
        children: [
          _buildEmailField(),
          _buildPasswordField(),
          ButtonSubmit(onPressed: _onLoginPressed, text: 'Войти в систему'),
        ],
      ),
    ),
  );

  Widget _buildEmailField() => TextFormField(
    autofillHints: const [AutofillHints.email],
    controller: _emailController,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    decoration: const InputDecoration(
      labelText: 'Email',
      hintText: 'user@example.com',
      prefixIcon: Icon(Icons.alternate_email_rounded, size: 20),
    ),
    validator: _emailValidator,
  );

  Widget _buildPasswordField() => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      TextFormField(
        autofillHints: const [AutofillHints.password],
        controller: _passwordController,
        obscureText: true,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          labelText: 'Пароль',
          hintText: 'Введите пароль',
          prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
        ),
        validator: _passwordValidator,
      ),
      TextButton(
        onPressed: () {
          ref.read(authProvider.notifier).showForgotPassword(true);
        },
        child: const Text(
          'Забыли пароль?',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
    ],
  );

  Future<void> _onLoginPressed() async {
    if (_formKeyLogin.currentState!.validate()) {
      await ref
          .read(authProvider.notifier)
          .login(_emailController.text, _passwordController.text);
    }
  }

  // => validators

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите email';
    }
    if (!isEmail(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 8) {
      return 'Пароль должен содержать не менее 8 символов';
    }
    return null;
  }
}
