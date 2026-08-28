import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/services/user_service.dart';
import 'package:saas_ui/src/features/support/logs/application/logs_panel_notifier.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_basic_info_section.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_external_service_section.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_metadata_section.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_request_section.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_response_section.dart';
import 'package:saas_ui/src/shared/widgets/app_divider.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/edit_panel.dart';

class LogEditPanel extends ConsumerWidget {
  const LogEditPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final panel = ref.watch(logsPanelProvider);
    final isAdmin = ref.watch(
      userServiceProvider.select((u) => u.value?.role == UserRole.admin),
    );

    return switch (panel) {
      AsyncLoading() => const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: CircularProgressIndicator(),
        ),
      ),
      AsyncError() => const SizedBox.shrink(),
      AsyncData(:final value) =>
        value == null
            ? const SizedBox.shrink()
            : _buildPanel(context, ref, value, isAdmin),
    };
  }

  Widget _buildPanel(
    BuildContext context,
    WidgetRef ref,
    Log item,
    bool isAdmin,
  ) {
    final showExternal = item.externalServiceUrl.isNotEmpty && isAdmin;

    return AppEditPanel(
      key: ValueKey(item.id ?? 'new'),
      onClose: () => ref.read(logsPanelProvider.notifier).close(),
      title: 'Детальный просмотр лога',
      maxWidth: 820,
      isScrollable: false,
      children: [
        LogMetadataSection(item: item),
        const SizedBox(height: 24),
        LogBasicInfoSection(item: item),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: AppDivider(),
        ),
        _buildRequestResponseSection(item),
        if (showExternal) ...[
          const SizedBox(height: 16),
          Expanded(child: LogExternalServiceSection(item: item)),
        ],
      ],
    );
  }

  Widget _buildRequestResponseSection(Log item) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 24,
    children: [
      Expanded(child: LogRequestSection(item: item)),
      Expanded(child: LogResponseSection(item: item)),
    ],
  );
}
