import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/features/support/logs/application/logs_notifier.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/searchable_list_dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/numeric_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/search_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/size_field.dart';
import 'package:saas_ui/src/shared/widgets/filter_section/app_filter_section.dart';

class LogFilterSection extends ConsumerWidget {
  const LogFilterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(logsFilterProductsProvider);
    final certificatesAsync = ref.watch(logsFilterCertificatesProvider);
    final pathsAsync = ref.watch(logsFilterRequestPathsProvider);
    final listNotifier = ref.read(logsProvider.notifier);
    ref.watch(logsProvider);

    return AppFilterSection(
      onRefresh: () => listNotifier.reloadWithState(),
      onPeriodChanged: listNotifier.setPeriodFilter,
      initialPeriod: DateFixedPeriodType.last15Minutes,
      filtersRow1: [
        productsAsync.when(
          data: (products) => SearchableListDropdown<Product>(
            hint: 'Продукт',
            onChanged: (value) => listNotifier.setProductIdFilter(value?.id),
            items: products
                .map(
                  (p) => SearchableItem(
                    id: p.id ?? 0,
                    label: p.name,
                    subtitle: p.sellerName.isNotEmpty ? p.sellerName : null,
                    value: p,
                  ),
                )
                .toList(),
          ),
          loading: () => SearchableListDropdown<Product>(
            hint: 'Продукт',
            onChanged: (_) {},
            items: const [],
            isLoading: true,
          ),
          error: (_, _) => const SizedBox.shrink(),
        ),
        SearchField(
          onChanged: (value) => listNotifier.setIpAddressFilter(value),
          hintText: 'IP-адрес',
        ),
        pathsAsync.when(
          data: (paths) => SearchableListDropdown<String>(
            hint: 'Путь',
            onChanged: listNotifier.setPathFilter,
            items: paths
                .map(
                  (path) => SearchableItem(
                    id: paths.indexOf(path) + 1,
                    label: path,
                    value: path,
                  ),
                )
                .toList(),
          ),
          loading: () => SearchableListDropdown<String>(
            hint: 'Путь',
            onChanged: (_) {},
            items: const [],
            isLoading: true,
          ),
          error: (_, _) => const SizedBox.shrink(),
        ),
      ],
      filtersRow2: [
        certificatesAsync.when(
          data: (certificates) => SearchableListDropdown<Certificate>(
            hint: 'Сертификат',
            onChanged: (value) =>
                listNotifier.setCertificateIdFilter(value?.id),
            items: certificates
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
          loading: () => SearchableListDropdown<Certificate>(
            hint: 'Сертификат',
            onChanged: (_) {},
            items: const [],
            isLoading: true,
          ),
          error: (_, _) => const SizedBox.shrink(),
        ),
        NumericField(
          onChanged: (value) => listNotifier.setTokenUsageFilter(value.toInt()),
          decoration: const InputDecoration(labelText: 'Токенов >='),
        ),
        AppDropdown<LogErrorType?>(
          onChanged: listNotifier.setErrorTypeFilter,
          enumValues: LogErrorType.values,
          hint: 'Тип ошибки',
        ),
      ],
      filtersRow3: [
        SizeField(
          onChangedFilter: (value) =>
              listNotifier.setTokenRequestSizeFilter(value),
          initialFilterValue:
              listNotifier.settings.filter.externalServiceRequestSize,
          label: 'Размер запроса',
        ),
        SizeField(
          onChangedFilter: (value) =>
              listNotifier.setTokenResponseSizeFilter(value),
          initialFilterValue:
              listNotifier.settings.filter.externalServiceResponseSize,
          label: 'Размер ответа',
        ),
      ],
    );
  }
}
