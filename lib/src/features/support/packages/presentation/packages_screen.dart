import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_panel_notifier.dart';
import 'package:saas_ui/src/features/support/packages/presentation/packages_edit_panel.dart';
import 'package:saas_ui/src/features/support/packages/presentation/packages_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/search_field.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class PackagesSupportScreen extends ConsumerWidget {
  const PackagesSupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(packagesProvider);
    final listNotifier = ref.read(packagesProvider.notifier);
    final panelNotifier = ref.read(packagesPanelProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Пакеты'),
      body: AppScreenWithPanel(
        screen: PaddingPageContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Text(
                          'Только активные',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGrey,
                          ),
                        ),
                        Switch(
                          value: listNotifier.settings.filter.activeOnly,
                          onChanged: (v) => listNotifier.setActiveOnly(v),
                          activeThumbColor: AppColors.primary.withValues(
                            alpha: 0.9,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: panelNotifier.openCreate,
                      child: const Text('Добавить пакет'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(child: PackagesTable()),
            ],
          ),
        ),
        editPanel: const PackagesEditPanel(),
      ),
    );
  }
}
