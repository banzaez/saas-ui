import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/features/support/logs/presentation/log_edit_panel.dart';
import 'package:saas_ui/src/features/support/logs/presentation/logs_table.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/log_filter_section.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Scaffold(
    appBar: AppHomeHeader(title: 'Системные логи'),
    body: AppScreenWithPanel(
      screen: PaddingPageContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogFilterSection(),
            SizedBox(height: 16),
            Expanded(child: LogsTable()),
          ],
        ),
      ),
      editPanel: LogEditPanel(),
    ),
  );
}
