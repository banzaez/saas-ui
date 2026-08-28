import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/services/user_service.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_panel_components.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/features/support/logs/presentation/widgets/edit_panel/log_json_viewer/log_json_viewer.dart';

class LogExternalServiceSection extends ConsumerWidget {
  final Log item;
  const LogExternalServiceSection({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.read(userServiceProvider.notifier);
    if (item.externalServiceUrl.isEmpty || !userService.isAdmin) {
      return const SizedBox.shrink();
    }

    return AppContainer(
      padding: const EdgeInsets.all(20),
      backgroundColor: AppColors.primary.withValues(alpha: 0.03),
      borderColor: AppColors.primary.withValues(alpha: 0.1),
      borderRadius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.cloud_outlined, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              const Text(
                'ВНЕШНИЙ СЕРВИС',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              LogStatusBadge(status: item.externalServiceResponseStatus),
              const SizedBox(width: 8),
              LogBadge(
                text: LogStatusBadge.getHttpStatusText(
                  item.externalServiceResponseStatus,
                ),
                color: LogStatusBadge.getHttpStatusColor(
                  item.externalServiceResponseStatus,
                ),
              ),
              const SizedBox(width: 8),
              LogDurationBadge(duration: item.externalServiceResponseTime),
            ],
          ),
          const SizedBox(height: 16),
          LogUrlBadge(url: item.externalServiceUrl),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Expanded(
                  child: item.externalServiceRequestBody.isNotEmpty
                      ? LogJsonViewer(
                          title: 'Запрос',
                          jsonString: item.externalServiceRequestBody,
                          maxSize: true,
                        )
                      : const _NoBodyIndicator(label: 'Запрос'),
                ),
                Expanded(
                  child: item.externalServiceResponseBody.isNotEmpty
                      ? LogJsonViewer(
                          title: 'Ответ',
                          jsonString: item.externalServiceResponseBody,
                          maxSize: true,
                        )
                      : const _NoBodyIndicator(label: 'Ответ'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NoBodyIndicator extends StatelessWidget {
  final String label;
  const _NoBodyIndicator({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.textGrey.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        const LogBadge(text: 'Тело пустое'),
      ],
    );
  }
}
