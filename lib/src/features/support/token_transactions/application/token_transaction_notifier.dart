import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';
import 'package:saas_ui/src/core/network/repository/certificates_repository.dart';
import 'package:saas_ui/src/core/network/repository/token_transaction_repository.dart';
import 'package:saas_ui/src/features/support/token_transactions/application/settings/token_transaction_settings.dart';

part 'token_transaction_notifier.g.dart';

@riverpod
Future<List<Certificate>> tokenTransactionCertificates(Ref ref) async {
  final res = await ref.read(certificatesRepositoryProvider).listAll();
  if (res.isSuccess) return res.result ?? [];
  return [];
}

@riverpod
class TokenTransactions extends _$TokenTransactions
    with
        AsyncReadOnlyNotifierMixin<
          TokenTransaction,
          int,
          TokenTransactionSettings
        >,
        AppTableSourceMixin<TokenTransaction, TokenTransactionSettings> {
  TokenTransactionSettings _settings = TokenTransactionSettings(
    fromDate: DateFixedPeriodType.last15Minutes.value?.from,
    toDate: DateFixedPeriodType.last15Minutes.value?.to,
    periodType: DateFixedPeriodType.last15Minutes,
  );
  @override
  TokenTransactionSettings get settings => _settings;
  @override
  set settings(TokenTransactionSettings value) => _settings = value;

  @override
  TokenTransactionsRepository get repository =>
      ref.read(tokenTransactionsRepositoryProvider);

  @override
  FutureOr<List<TokenTransaction>> build() {
    ref.onDispose(cancelDebounce);
    return reloadItems();
  }

  @override
  Future<List<TokenTransaction>> reloadItems() {
    final period = settings.filter.periodType;
    if (period != null && period != DateFixedPeriodType.custom) {
      final val = period.value;
      settings.filter.fromDate = val?.from;
      settings.filter.toDate = val?.to;
    }
    return super.reloadItems();
  }

  Future<void> setPeriodFilter(DateFixedValue value) => applyFilter(() {
    settings.filter.fromDate = value.from;
    settings.filter.toDate = value.to;
    settings.filter.periodType = value.type;
  });

  Future<void> setTransactionTypeFilter(TokenTransactionType? value) =>
      applyFilter(() => settings.filter.transactionType = value);

  Future<void> setCertificateFilter(Certificate? value) =>
      applyFilter(() => settings.filter.certificateId = value?.id);
}
