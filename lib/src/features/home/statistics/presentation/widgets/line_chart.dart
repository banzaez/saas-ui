import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/home/statistics/application/statistics_notifier.dart';

class AppStatisticsLineChart extends ConsumerWidget {
  final double leftPadding;
  final double bottomPadding;

  const AppStatisticsLineChart({
    super.key,
    required this.leftPadding,
    required this.bottomPadding,
  });

  Color get _forecastColor => AppColors.primary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(statisticsProvider);
    final notifier = ref.read(statisticsProvider.notifier);

    return async.when(
      data: (items) => Padding(
        padding: EdgeInsets.only(left: leftPadding, bottom: bottomPadding),
        child: LineChart(
          LineChartData(
            minY: notifier.minY(items)?.toDouble(),
            maxY: notifier.maxY(items)?.toDouble(),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: const FlTitlesData(show: false),
            lineBarsData: _buildLines(notifier, items),
            extraLinesData: _buildExtraLines(notifier, items),
          ),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  ExtraLinesData _buildExtraLines(Statistics notifier, List<Statistic> items) {
    DateTime? forecastDate;

    for (final item in items) {
      for (final data in item.data) {
        if (data.isForecast) {
          if (forecastDate == null || data.date.isBefore(forecastDate)) {
            forecastDate = data.date;
          }
        }
      }
    }

    if (forecastDate == null) {
      return const ExtraLinesData();
    }

    final forecastIndex = notifier.getDateIndex(items, forecastDate);
    final x = forecastIndex > 0 ? forecastIndex - 1 : forecastIndex;

    return ExtraLinesData(
      verticalLines: [
        VerticalLine(
          x: x,
          color: _forecastColor,
          strokeWidth: 1,
          dashArray: [5, 5],
          label: VerticalLineLabel(
            show: true,
            alignment: Alignment.topRight,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ),
            labelResolver: (line) => 'ПРОГНОЗ',
          ),
        ),
      ],
    );
  }

  List<LineChartBarData> _buildLines(
    Statistics notifier,
    List<Statistic> items,
  ) => items.map((item) => _buildLine(notifier, items, item)).toList();

  LineChartBarData _buildLine(
    Statistics notifier,
    List<Statistic> items,
    Statistic item,
  ) => LineChartBarData(
    barWidth: 2.0,
    color: AppColors.primary,
    dotData: const FlDotData(show: true),
    isCurved: true,
    spots: [
      for (final data in item.data)
        FlSpot(
          notifier.getDateIndex(items, data.date),
          data.tokensAfter.toDouble(),
        ),
    ],
  );
}
