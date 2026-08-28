import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

class AppStatisticsChartLegends extends StatelessWidget {
  const AppStatisticsChartLegends({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildLegendItem('Приход', Colors.green),
        _buildLegendItem('Расход', Colors.red),
        _buildLegendItem('Баланс', AppColors.primary),
      ],
    ),
  );

  Widget _buildLegendItem(String title, Color color) => Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 8,
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
    ],
  );
}
