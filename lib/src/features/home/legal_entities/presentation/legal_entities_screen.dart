import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_notifier.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_panel_notifier.dart';
import 'package:saas_ui/src/features/home/legal_entities/presentation/legal_entities_edit_panel.dart';
import 'package:saas_ui/src/features/home/legal_entities/presentation/legal_entities_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/search_field.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class LegalEntitiesScreen extends ConsumerWidget {
  const LegalEntitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNotifier = ref.read(legalEntitiesProvider.notifier);
    final panelNotifier = ref.read(legalEntitiesPanelProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Юридические лица'),
      body: AppScreenWithPanel(
        screen: PaddingPageContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    ElevatedButton(
                      onPressed: panelNotifier.openCreate,
                      child: const Text('Добавить юрлицо'),
                    ),
                  ],
                ),
              ),
              const Expanded(child: LegalEntitiesTable()),
            ],
          ),
        ),
        editPanel: const LegalEntitiesEditPanel(),
      ),
    );
  }
}
