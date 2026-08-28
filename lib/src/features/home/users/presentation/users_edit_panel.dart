import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/features/home/users/application/users_notifier.dart';
import 'package:saas_ui/src/features/home/users/application/users_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/base_riverpod_crud_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/company_reference_field.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

class UsersEditPanel extends BaseRiverpodCrudEditPanel<User> {
  const UsersEditPanel({super.key});

  @override
  User? watchPanel(WidgetRef ref) => ref.watch(usersPanelProvider);

  @override
  String get createTitle => 'Создание пользователя';

  @override
  String get editTitle => 'Редактирование пользователя';

  @override
  Future<User?> performSave(WidgetRef ref, User item) =>
      ref.read(usersProvider.notifier).saveItem(item);

  @override
  void closePanel(WidgetRef ref) =>
      ref.read(usersPanelProvider.notifier).close();

  @override
  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, User item) => [
    if (item.id != null)
      EditPanelInfoItem(title: 'ID', value: item.id.toString()),
  ];

  void _set(WidgetRef ref, User item) =>
      ref.read(usersPanelProvider.notifier).open(item);

  @override
  List<Widget> buildFormChildren(
    BuildContext context,
    WidgetRef ref,
    User item,
  ) => [
    CompanyReferenceField(
      onChanged: (value) => _set(ref, item.copyWith(companyId: value?.id)),
      decoration: const InputDecoration(labelText: 'Компания'),
      initialValue: item.companyId,
      validator: _companyValidator,
    ).visibleForSupport(
      role: ref.watch(userServiceProvider).value?.role,
    ),
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(email: value)),
      initialValue: item.email,
      decoration: const InputDecoration(labelText: 'Email'),
      validator: _emailValidator,
    ),
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(fullName: value)),
      initialValue: item.fullName,
      decoration: const InputDecoration(labelText: 'Наименование'),
    ),
    TextFormField(
      onChanged: (value) =>
          _set(ref, item.copyWith(password: value.isEmpty ? null : value)),
      initialValue: item.password,
      obscureText: true,
      decoration: InputDecoration(
        labelText: item.id == null ? 'Пароль' : 'Новый пароль',
        hintText: item.id == null
            ? 'Введите пароль'
            : 'Оставьте пустым, чтобы не менять',
      ),
      validator: (value) {
        if (item.id == null && (value == null || value.isEmpty)) {
          return 'Пароль не может быть пустым';
        }
        if (value != null && value.isNotEmpty && value.length < 8) {
          return 'Пароль должен быть не менее 8 символов';
        }
        return null;
      },
    ),
    AppDropdown<UserRole>(
      onChanged: (value) => _set(ref, item.copyWith(role: value!)),
      initialValue: item.role,
      items: UserRole.values
          .map(
            (role) => DropdownMenuItem(value: role, child: Text(role.text())),
          )
          .toList(),
      showClearButton: false,
      hint: 'Выберите роль',
      label: 'Роль',
    ),
  ];

  String? _companyValidator(Company? value) {
    if (value == null) return 'Компания не может быть пустой';
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email не может быть пустым';
    return null;
  }
}
