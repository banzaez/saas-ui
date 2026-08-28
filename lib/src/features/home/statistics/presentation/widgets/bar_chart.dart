import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/features/home/statistics/application/statistics_notifier.dart';

class AppStatisticsBarChart extends ConsumerWidget {
  final double leftPadding;
  final double bottomPadding;

  const AppStatisticsBarChart({
    super.key,
    required this.leftPadding,
    required this.bottomPadding,
  });

  static const double _bottomTitleSpace = 28.0;
  static const double _tooltipMargin = 4.0;
  static const Color _incomeColor = Colors.green;
  static const Color _expenseColor = Colors.red;
  static const double _zeroAxisWidth = 1;

  Color _zeroAxisColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.white70
      : Colors.black;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(statisticsProvider);
    final notifier = ref.read(statisticsProvider.notifier);

    return async.when(
      data: (items) => BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          minY: notifier.minY(items)?.toDouble(),
          maxY: notifier.maxY(items)?.toDouble(),
          barGroups: _buildBarGroups(notifier, items),
          barTouchData: _buildBarTouchData(),
          borderData: FlBorderData(show: false),
          gridData: _buildGridData(context, notifier, items),
          titlesData: _buildTitlesData(notifier, items),
        ),
      ),
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  BarTouchData _buildBarTouchData() => BarTouchData(
    enabled: true,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (_) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: _tooltipMargin,
    ),
  );

  FlTitlesData _buildTitlesData(Statistics notifier, List<Statistic> items) =>
      FlTitlesData(
        show: true,
        topTitles: _buildTitles(showTitles: false),
        rightTitles: _buildTitles(showTitles: false),
        leftTitles: _buildTitles(
          showTitles: true,
          reservedSize: leftPadding,
          getTitlesWidget: _buildLeftTitle,
        ),
        bottomTitles: _buildTitles(
          showTitles: true,
          reservedSize: bottomPadding,
          getTitlesWidget: (value, meta) =>
              _buildBottomTitle(notifier, items, value, meta),
        ),
      );

  AxisTitles _buildTitles({
    required bool showTitles,
    double reservedSize = 22,
    Widget Function(double value, TitleMeta meta) getTitlesWidget =
        defaultGetTitle,
  }) => AxisTitles(
    sideTitles: SideTitles(
      showTitles: showTitles,
      reservedSize: reservedSize,
      getTitlesWidget: getTitlesWidget,
    ),
  );

  Widget _buildLeftTitle(double value, TitleMeta meta) {
    if (value % 1 == 0) {
      return Text(
        value.toInt().toString(),
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildBottomTitle(
    Statistics notifier,
    List<Statistic> items,
    double value,
    TitleMeta meta,
  ) => SideTitleWidget(
    meta: meta,
    space: _bottomTitleSpace,
    child: Text(
      notifier.getDateLabel(items, value),
      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ),
  );

  FlGridData _buildGridData(
    BuildContext context,
    Statistics notifier,
    List<Statistic> items,
  ) => FlGridData(
    show: true,
    getDrawingHorizontalLine: (value) => value == 0
        ? FlLine(color: _zeroAxisColor(context), strokeWidth: _zeroAxisWidth)
        : defaultGridLine(value),
  );

  List<BarChartGroupData> _buildBarGroups(
    Statistics notifier,
    List<Statistic> items,
  ) {
    if (items.isEmpty) return [];
    final statistic = items.first;
    return statistic.data
        .map((d) => _createBarGroup(notifier, items, d))
        .toList();
  }

  BarChartGroupData _createBarGroup(
    Statistics notifier,
    List<Statistic> items,
    StatisticData data,
  ) {
    final barRods = <BarChartRodData>[];

    if (data.tokensReceived > 0) {
      barRods.add(_createBarRod(data.tokensReceived));
    }
    if (data.tokensSpent < 0) {
      barRods.add(_createBarRod(data.tokensSpent));
    }

    return BarChartGroupData(
      x: notifier.getDateIndex(items, data.date).toInt(),
      barRods: barRods,
      showingTooltipIndicators: List.generate(barRods.length, (i) => i),
    );
  }

  BarChartRodData _createBarRod(int value) {
    const barWidth = 12.0;
    const barBorderRadius = 4.0;
    final isPositive = value > 0;
    return BarChartRodData(
      toY: value.toDouble(),
      color: isPositive ? _incomeColor : _expenseColor,
      width: barWidth,
      borderRadius: BorderRadius.vertical(
        top: isPositive ? const Radius.circular(barBorderRadius) : Radius.zero,
        bottom: isPositive
            ? Radius.zero
            : const Radius.circular(barBorderRadius),
      ),
    );
  }
}
