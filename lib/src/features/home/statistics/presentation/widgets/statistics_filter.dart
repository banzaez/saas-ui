import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/statistics_period.dart';
import 'package:saas_ui/src/features/home/statistics/application/statistics_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/searchable_list_dropdown.dart';

class StatisticsFilter extends ConsumerWidget {
  const StatisticsFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(statisticsProvider);
    final notifier = ref.read(statisticsProvider.notifier);

    return AppContainer(
      padding: const EdgeInsets.all(20),
      child: Row(
        spacing: 16,
        children: [
          Text(
            notifier.periodString,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Flexible(
            child: AppDropdown(
              onChanged: notifier.setPeriod,
              enumValues: StatisticsPeriod.values,
              initialValue: notifier.period,
              hint: 'Период',
              showClearButton: false,
            ),
          ),
          Flexible(
            child: SearchableListDropdown<Certificate>(
              hint: 'Сертификат',
              initialValue: notifier.certificateId,
              onChanged: (value) => notifier.setCertificate(value?.id),
              items: notifier.certificates
                  .map(
                    (c) => SearchableItem(
                      id: c.id ?? 0,
                      label: c.getName,
                      subtitle: c.productName.isNotEmpty ? c.productName : null,
                      value: c,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
