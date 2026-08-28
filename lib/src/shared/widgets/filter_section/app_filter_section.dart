import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/date_fixed_period.dart';

class AppFilterSection extends StatelessWidget {
  final VoidCallback? onRefresh;
  final Function(DateFixedValue value)? onPeriodChanged;
  final DateFixedPeriodType? initialPeriod;
  final List<Widget> filtersRow1;
  final List<Widget>? filtersRow2;
  final List<Widget>? filtersRow3;

  const AppFilterSection({
    super.key,
    this.onRefresh,
    this.onPeriodChanged,
    this.initialPeriod,
    this.filtersRow1 = const [],
    this.filtersRow2,
    this.filtersRow3,
  });

  @override
  Widget build(BuildContext context) {
    // Определяем максимальное количество элементов в одной из строк для выравнивания
    final int maxItems = [
      filtersRow1.length,
      filtersRow2?.length ?? 0,
      filtersRow3?.length ?? 0,
    ].reduce((a, b) => a > b ? a : b);

    return AppContainer(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          // Слева: Кнопка и Период
          if (onRefresh != null)
            IconButton(
              onPressed: onRefresh,
              icon: const Icon(
                Icons.refresh,
                size: 32,
                color: AppColors.primary,
              ),
            ),
          if (onPeriodChanged != null)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: DateFixedPeriod(
                onChanged: onPeriodChanged!,
                initialValue:
                    initialPeriod ?? DateFixedPeriodType.last15Minutes,
              ),
            ),

          // Правая колонка: Строки фильтров
          Expanded(
            child: Column(
              spacing: 12,
              children: [
                if (filtersRow1.isNotEmpty)
                  Row(
                    spacing: 12,
                    children: _buildRowItems(filtersRow1, maxItems),
                  ),
                if (filtersRow2 != null && filtersRow2!.isNotEmpty)
                  Row(
                    spacing: 12,
                    children: _buildRowItems(filtersRow2!, maxItems),
                  ),
                if (filtersRow3 != null && filtersRow3!.isNotEmpty)
                  Row(
                    spacing: 12,
                    children: _buildRowItems(filtersRow3!, maxItems),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRowItems(List<Widget> items, int targetCount) {
    final List<Widget> rowItems = [];

    // Добавляем сами фильтры
    for (var i = 0; i < items.length; i++) {
      rowItems.add(Expanded(child: items[i]));
    }

    // Добавляем пустые заглушки до конца строки для сохранения ширины
    if (items.length < targetCount) {
      for (var i = 0; i < targetCount - items.length; i++) {
        rowItems.add(const Expanded(child: SizedBox.shrink()));
      }
    }

    return rowItems;
  }
}
