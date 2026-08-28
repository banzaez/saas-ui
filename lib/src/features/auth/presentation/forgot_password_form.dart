import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/features/auth/application/auth_notifier.dart';
import 'package:saas_ui/src/features/auth/presentation/button_submit.dart';
import 'package:string_validator/string_validator.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  ConsumerState<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20,
        children: [
          Text(
            'Введите ваш email для восстановления доступа. Мы отправим вам ссылку для смены пароля.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.blueGrey.shade600,
            ),
          ),
          _buildEmailField(),
          ButtonSubmit(
            onPressed: _onSubmitPressed,
            text: 'Отправить ссылку',
          ),
          TextButton(
            onPressed: () {
              ref.read(authProvider.notifier).showForgotPassword(false);
            },
            child: const Text(
              'Вернуться к входу',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Future<void> _onSubmitPressed() async {
    if (_formKey.currentState!.validate()) {
      final success = await ref
          .read(authProvider.notifier)
          .requestPasswordReset(_emailController.text);
      if (success) {
        AppSnackbar.showSuccess(
          title: 'Успешно',
          message: 'Ссылка для сброса пароля была отправлена на ваш email.',
        );
      }
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите email';
    }
    if (!isEmail(value)) {
      return 'Введите корректный email';
    }
    return null;
  }
}
