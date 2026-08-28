import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';
import 'package:saas_ui/src/features/support/token_transactions/application/token_transaction_notifier.dart';
import 'package:saas_ui/src/features/support/token_transactions/presentation/token_transaction_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/filter_section/app_filter_section.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/shared/widgets/fields/searchable_list_dropdown.dart';
import 'package:saas_ui/src/shared/widgets/padding_page_content.dart';

class TokenTransactionScreen extends ConsumerWidget {
  const TokenTransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(tokenTransactionsProvider);
    final listNotifier = ref.read(tokenTransactionsProvider.notifier);
    final certsAsync = ref.watch(tokenTransactionCertificatesProvider);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Транзакции токенов'),
      body: AppScreenWithPanel(
        screen: PaddingPageContent(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFilterSection(
                onRefresh: listNotifier.reloadWithState,
                onPeriodChanged: listNotifier.setPeriodFilter,
                initialPeriod: DateFixedPeriodType.last15Minutes,
                filtersRow1: [
                  certsAsync.when(
                    data: (certs) => SearchableListDropdown<Certificate>(
                      hint: 'Сертификат',
                      onChanged: listNotifier.setCertificateFilter,
                      initialValue: listNotifier.settings.filter.certificateId,
                      items: certs
                          .map(
                            (c) => SearchableItem(
                              id: c.id ?? 0,
                              label: c.getName,
                              subtitle: c.productName.isNotEmpty
                                  ? c.productName
                                  : null,
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
                  AppDropdown<TokenTransactionType?>(
                    onChanged: listNotifier.setTransactionTypeFilter,
                    enumValues: TokenTransactionType.values,
                    hint: 'Тип',
                    initialValue: listNotifier.settings.filter.transactionType,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Expanded(child: TokenTransactionTable()),
            ],
          ),
        ),
        editPanel: const SizedBox.shrink(),
      ),
    );
  }
}
