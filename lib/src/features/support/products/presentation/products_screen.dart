import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/products/application/products_notifier.dart';
import 'package:saas_ui/src/features/support/products/application/products_panel_notifier.dart';
import 'package:saas_ui/src/features/support/products/presentation/products_edit_panel.dart';
import 'package:saas_ui/src/features/support/products/presentation/products_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/search_field.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class ProductsSupportScreen extends ConsumerWidget {
  const ProductsSupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(productsProvider);
    final listNotifier = ref.read(productsProvider.notifier);
    final panelNotifier = ref.read(productsPanelProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Продукты'),
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
                    const SizedBox(width: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Только активные',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textGrey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Switch(
                          value: listNotifier.settings.filter.activeOnly,
                          onChanged: listNotifier.setActiveOnly,
                          activeThumbColor: AppColors.primary.withValues(
                            alpha: 0.9,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: panelNotifier.openCreate,
                      child: const Text('Добавить продукт'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Expanded(child: ProductsTable()),
            ],
          ),
        ),
        editPanel: const ProductsEditPanel(),
      ),
    );
  }
}
