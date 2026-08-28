import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/features/home/statistics/application/statistics_notifier.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/widgets/bar_chart.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/widgets/chart_legends.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/widgets/empty_data.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/widgets/line_chart.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/widgets/statistics_filter.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/widgets/statistics_info_cards.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  static const double _leftChartPadding = 24.0;
  static const double _bottomChartPadding = 48.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(statisticsProvider);
    final notifier = ref.read(statisticsProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Статистика'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            const StatisticsFilter(),
            Expanded(
              child: async.when(
                data: (items) => notifier.certificateId == null
                    ? const Center(child: EmptyCertificate())
                    : items.isEmpty
                    ? const Center(child: EmptyData())
                    : _buildCharts(),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('$e')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCharts() => const Column(
    spacing: 16,
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Stack(
            children: [
              AppStatisticsBarChart(
                leftPadding: _leftChartPadding,
                bottomPadding: _bottomChartPadding,
              ),
              AppStatisticsLineChart(
                leftPadding: _leftChartPadding,
                bottomPadding: _bottomChartPadding,
              ),
            ],
          ),
        ),
      ),
      AppStatisticsChartLegends(),
      StatisticsInfoCards(),
    ],
  );
}
