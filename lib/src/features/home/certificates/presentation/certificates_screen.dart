import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/features/home/certificates/presentation/certificates_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class CertificatesScreen extends ConsumerWidget {
  const CertificatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef _) {
    return Scaffold(
      appBar: const AppHomeHeader(title: 'Сертификаты'),
      body: AppScreenWithPanel(
        screen: PaddingPageContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              ElevatedButton.icon(
                onPressed: () => context.go(HomeRouters.tarifs.route),
                icon: const Icon(Icons.add),
                label: const Text('Добавить'),
              ),
              const Expanded(child: CertificatesTable()),
            ],
          ),
        ),
        editPanel: const SizedBox.shrink(),
      ),
    );
  }
}
