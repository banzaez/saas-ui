import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/features/home/statistics/application/statistics_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';

class StatisticsInfoCards extends ConsumerWidget {
  const StatisticsInfoCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(statisticsProvider);
    final notifier = ref.read(statisticsProvider.notifier);

    return async.when(
      data: (items) {
        if (items.isEmpty) return const SizedBox.shrink();
        final firstItem = items.first;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Flexible(
              child: _buildInfo(
                title: 'Всего\nдоходов',
                value: firstItem.totalIncome,
                borderColor: Colors.green,
              ),
            ),
            Flexible(
              child: _buildInfo(
                title: 'Всего\nрасходов',
                value: firstItem.totalExpenses.abs(),
                borderColor: Colors.red,
              ),
            ),
            Flexible(
              child: _buildInfo(
                title: 'Баланс на\n${notifier.endDate?.formatDDMMYYYY}',
                value: firstItem.tokensAfter,
                borderColor: Colors.blue,
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  Widget _buildInfo({
    required String title,
    required int value,
    required Color borderColor,
  }) => AppContainer(
    borderColor: borderColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: borderColor,
          ),
        ),
      ],
    ),
  );
}
