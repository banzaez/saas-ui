import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/text_input_formatter/app_phone_input_formatter.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_notifier.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/base_riverpod_crud_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/section_header.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/company_reference_field.dart';
import 'package:string_validator/string_validator.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

class LegalEntitiesEditPanel extends BaseRiverpodCrudEditPanel<LegalEntity> {
  const LegalEntitiesEditPanel({
    super.key,
    this.onAfterSave,
    this.onAfterCancel,
  });

  final ValueChanged<LegalEntity?>? onAfterSave;
  final VoidCallback? onAfterCancel;

  @override
  LegalEntity? watchPanel(WidgetRef ref) =>
      ref.watch(legalEntitiesPanelProvider);

  @override
  String get createTitle => 'Создание юрлица';

  @override
  String get editTitle => 'Редактирование юрлица';

  @override
  double get maxWidth => 750;

  @override
  Future<LegalEntity?> performSave(WidgetRef ref, LegalEntity item) async {
    final saved = await ref.read(legalEntitiesProvider.notifier).saveItem(item);
    if (saved != null) onAfterSave?.call(saved);
    return saved;
  }

  @override
  void closePanel(WidgetRef ref) =>
      ref.read(legalEntitiesPanelProvider.notifier).close();

  @override
  void afterCancel(WidgetRef ref) {
    onAfterCancel?.call();
  }

  @override
  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, LegalEntity item) =>
      isCreating(item)
      ? null
      : [EditPanelInfoItem(title: 'ID', value: item.id.toString())];

  void _set(WidgetRef ref, LegalEntity item) =>
      ref.read(legalEntitiesPanelProvider.notifier).open(item);

  @override
  List<Widget> buildFormChildren(
    BuildContext context,
    WidgetRef ref,
    LegalEntity item,
  ) => [
    const EditPanelSectionHeader(
      title: 'Общая информация',
      icon: Icons.info_outline_rounded,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(fullName: value)),
            initialValue: item.fullName,
            decoration: const InputDecoration(labelText: 'Наименование'),
            maxLines: null,
            validator: _nameValidator,
          ),
        ),
        Expanded(
          child: CompanyReferenceField(
            onChanged: (value) =>
                _set(ref, item.copyWith(companyId: value!.id!)),
            decoration: const InputDecoration(labelText: 'Компания'),
            initialValue: item.companyId,
            validator: _companyValidator,
          ).visibleForSupport(
            role: ref.watch(userServiceProvider).value?.role,
          ),
        ),
      ],
    ),
    const EditPanelSectionHeader(
      title: 'Реквизиты',
      icon: Icons.receipt_long_outlined,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(inn: value)),
            initialValue: item.inn,
            decoration: const InputDecoration(labelText: 'ИНН'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: _innValidator,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(kpp: value)),
            initialValue: item.kpp,
            decoration: const InputDecoration(labelText: 'КПП'),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ],
    ),
    const EditPanelSectionHeader(
      title: 'Контакты',
      icon: Icons.contact_mail_outlined,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(email: value)),
            initialValue: item.email,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: _emailValidator,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(phone: value)),
            initialValue: item.phone,
            decoration: const InputDecoration(labelText: 'Телефон'),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              AppPhoneInputFormatter(),
            ],
          ),
        ),
      ],
    ),
    TextFormField(
      onChanged: (value) => _set(ref, item.copyWith(address: value)),
      initialValue: item.address,
      decoration: const InputDecoration(labelText: 'Адрес'),
      maxLines: null,
    ),
    const EditPanelSectionHeader(
      title: 'Банковские реквизиты',
      icon: Icons.account_balance_outlined,
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(bank: value)),
            initialValue: item.bank,
            decoration: const InputDecoration(labelText: 'Банк'),
            maxLines: null,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(bik: value)),
            initialValue: item.bik,
            decoration: const InputDecoration(labelText: 'БИК'),
          ),
        ),
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(bankAccount: value)),
            initialValue: item.bankAccount,
            decoration: const InputDecoration(labelText: 'Счет'),
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: (value) => _set(ref, item.copyWith(korrAccount: value)),
            initialValue: item.korrAccount,
            decoration: const InputDecoration(labelText: 'Корр'),
          ),
        ),
      ],
    ),
  ];

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Наименование не может быть пустым';
    }
    return null;
  }

  String? _companyValidator(Company? value) {
    if (value == null) return 'Компания не может быть пустой';
    return null;
  }

  String? _innValidator(String? value) {
    if (value == null || value.isEmpty) return 'ИНН не может быть пустым';
    if (value.length != 10 && value.length != 12) {
      return 'ИНН должен содержать 10 или 12 цифр';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Email не может быть пустым';
    if (!isEmail(value)) return 'Email должен быть валидным';
    return null;
  }
}
