import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_notifier.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_panel_notifier.dart';
import 'package:saas_ui/src/features/home/companies/presentation/companies_edit_panel.dart';
import 'package:saas_ui/src/features/home/companies/presentation/companies_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/search_field.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

class CompaniesScreen extends ConsumerWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(companiesProvider);

    final listNotifier = ref.read(companiesProvider.notifier);
    final panelNotifier = ref.read(companiesPanelProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Компании'),
      body: AppScreenWithPanel(
        screen: PaddingPageContent(
          child: Column(
            spacing: 16,
            children: [
              AppContainer(
                padding: const EdgeInsets.all(20),
                child: Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: SearchField(
                        hintText: 'Поиск...',
                        onChanged: listNotifier.setSearchQuery,
                      ),
                    ),
                    Flexible(
                      child: AppDropdown<CompanyStatus?>(
                        initialValue: listNotifier.settings.filter.status,
                        onChanged: listNotifier.setStatus,
                        enumValues: CompanyStatus.values,
                        hint: 'Все статусы',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: panelNotifier.openCreate,
                      child: const Text('Создать компанию'),
                    ).visibleForAdmin(
                      role: ref.watch(userServiceProvider).value?.role,
                    ),
                  ],
                ),
              ),
              const Expanded(child: CompaniesTable()),
            ],
          ),
        ),
        editPanel: const CompaniesEditPanel(),
      ),
    );
  }
}
