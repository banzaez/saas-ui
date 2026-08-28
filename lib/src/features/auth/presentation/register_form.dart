import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/features/auth/application/auth_notifier.dart';
import 'package:saas_ui/src/features/auth/presentation/button_submit.dart';
import 'package:string_validator/string_validator.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKeyRegister = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Form(
    key: _formKeyRegister,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 20,
      children: [
        _buildCompanyNameField(),
        _buildEmailField(),
        _buildPasswordRegisterFields(),
        ButtonSubmit(text: 'Зарегистрироваться', onPressed: _onRegisterPressed),
      ],
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

  Widget _buildCompanyNameField() => TextFormField(
    controller: _companyNameController,
    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    decoration: const InputDecoration(
      labelText: 'Организация или Частное лицо',
      hintText: 'ООО "Бизнес" или Иванов И.И.',
      prefixIcon: Icon(Icons.business_rounded, size: 20),
    ),
    validator: _companyNameValidator,
  );

  Widget _buildPasswordRegisterFields() => Column(
    spacing: 20,
    children: [
      TextFormField(
        autofillHints: const [AutofillHints.newPassword],
        controller: _passwordController,
        obscureText: true,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          labelText: 'Придумайте пароль',
          hintText: 'Минимум 8 знаков',
          prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
        ),
        validator: _passwordRegisterValidator,
      ),
      TextFormField(
        autofillHints: const [AutofillHints.newPassword],
        controller: _confirmPasswordController,
        obscureText: true,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: const InputDecoration(
          labelText: 'Подтвердите пароль',
          hintText: 'Введите пароль еще раз',
          prefixIcon: Icon(Icons.lock_reset_rounded, size: 20),
        ),
        validator: _passwordRegisterValidator,
      ),
    ],
  );

  Future<void> _onRegisterPressed() async {
    if (_formKeyRegister.currentState!.validate()) {
      await ref
          .read(authProvider.notifier)
          .register(
            _companyNameController.text,
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  // => validators

  String? _companyNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите название организации или ФИО';
    }
    return null;
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

  String? _passwordRegisterValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 8) {
      return 'Пароль должен содержать не менее 8 символов';
    }
    if (value != _passwordController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }
}
