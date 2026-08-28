import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_notifier.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_status.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/base_riverpod_crud_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/core/services/user_service.dart';
import 'package:saas_ui/src/shared/widgets/integration_section.dart';
import 'package:saas_ui/src/core/gen/assets.gen.dart';

class CompaniesEditPanel extends BaseRiverpodCrudEditPanel<Company> {
  const CompaniesEditPanel({super.key});

  @override
  Company? watchPanel(WidgetRef ref) => ref.watch(companiesPanelProvider);

  @override
  String get createTitle => 'Создание компании';

  @override
  String get editTitle => 'Редактирование компании';

  @override
  Future<Company?> performSave(WidgetRef ref, Company item) =>
      ref.read(companiesProvider.notifier).saveItem(item);

  @override
  void closePanel(WidgetRef ref) =>
      ref.read(companiesPanelProvider.notifier).close();

  @override
  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, Company item) => [
    if (item.id != null) EditPanelInfoItem(title: 'ID', value: '${item.id}'),
    EditPanelInfoItem(
      title: 'Статус компании:',
      valueWidget: AppStatus(
        status: item.status.toString(),
        color: item.status.color,
      ),
    ),
  ];

  @override
  List<Widget> buildFormChildren(
    BuildContext context,
    WidgetRef ref,
    Company item,
  ) => [
    TextFormField(
      onChanged: (value) => ref
          .read(companiesPanelProvider.notifier)
          .open(item.copyWith(displayName: value)),
      initialValue: item.displayName,
      decoration: const InputDecoration(labelText: 'Наименование'),
      validator: _nameValidator,
    ),
    AppDropdown<CompanyStatus>(
      onChanged: (value) => ref
          .read(companiesPanelProvider.notifier)
          .open(item.copyWith(status: value!)),
      hint: 'Выберите статус',
      label: 'Статус',
      initialValue: item.status,
      enumValues: CompanyStatus.values,
      showClearButton: false,
    ),
    TextFormField(
      onChanged: (value) => ref
          .read(companiesPanelProvider.notifier)
          .open(item.copyWith(sdelkabizId: int.tryParse(value))),
      initialValue: item.sdelkabizId?.toString(),
      decoration: const InputDecoration(labelText: 'SDELKA.BIZ ID'),
    ).visibleForSupport(
      role: ref.watch(userServiceProvider).value?.role,
    ),
    TextFormField(
      onChanged: (value) => ref
          .read(companiesPanelProvider.notifier)
          .open(item.copyWith(guid: value)),
      initialValue: item.guid,
      decoration: const InputDecoration(labelText: 'GUID'),
      validator: _guidValidator,
    ).visibleForSupport(
      role: ref.watch(userServiceProvider).value?.role,
    ),
    IntegrationSection(
      children: [
        IntegrationGroup(
          title: 'МойСклад',
          logo: Assets.integrations.moysklad.image(),
          children: [
            ConfirmedTextField(
              initialValue: item.mystockAccountId,
              onChanged: (value) => ref
                  .read(companiesPanelProvider.notifier)
                  .open(item.copyWith(mystockAccountId: value.isEmpty ? null : value)),
              label: 'ID аккаунта МойСклад',
              helperText: 'Идентификатор аккаунта в сервисе МойСклад',
            ),
          ],
        ),
      ],
    ),
  ];

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) return 'Обязательно для заполнения';
    return null;
  }

  String? _guidValidator(String? value) {
    if (value == null || value.isEmpty) return 'Обязательно для заполнения';
    return null;
  }
}
