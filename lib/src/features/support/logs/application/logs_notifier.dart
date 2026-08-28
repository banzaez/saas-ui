import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/repository/certificates_repository.dart';
import 'package:saas_ui/src/core/network/repository/logs_repository.dart';
import 'package:saas_ui/src/core/network/repository/products_repository.dart';
import 'package:saas_ui/src/features/support/logs/application/settings/log_settings.dart';
import 'package:saas_ui/src/features/support/products/application/settings/product_settings.dart';
import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';

part 'logs_notifier.g.dart';

@riverpod
Future<List<Product>> logsFilterProducts(Ref ref) async {
  final res = await ref
      .read(productsRepositoryProvider)
      .listAll(ProductSettings(activeOnly: true));
  return res.result ?? [];
}

@riverpod
Future<List<Certificate>> logsFilterCertificates(Ref ref) async {
  final res = await ref.read(certificatesRepositoryProvider).listAll();
  return res.result ?? [];
}

@riverpod
Future<List<String>> logsFilterRequestPaths(Ref ref) async {
  final res = await ref.read(logsRepositoryProvider).getRequestPaths();
  if (res.isSuccess) return res.result ?? [];
  return [];
}

@riverpod
class Logs extends _$Logs
    with
        AsyncReadOnlyNotifierMixin<Log, int, LogSettings>,
        AppTableSourceMixin<Log, LogSettings> {
  LogSettings _settings = LogSettings(
    fromDate: DateFixedPeriodType.last15Minutes.value?.from,
    toDate: DateFixedPeriodType.last15Minutes.value?.to,
    periodType: DateFixedPeriodType.last15Minutes,
  );
  @override
  LogSettings get settings => _settings;
  @override
  set settings(LogSettings value) => _settings = value;

  @override
  LogsRepository get repository => ref.read(logsRepositoryProvider);

  @override
  FutureOr<List<Log>> build() {
    ref.onDispose(cancelDebounce);
    return reloadItems();
  }

  @override
  Future<List<Log>> reloadItems() {
    final period = settings.filter.periodType;
    if (period != null && period != DateFixedPeriodType.custom) {
      final val = period.value;
      settings.filter.fromDate = val?.from;
      settings.filter.toDate = val?.to;
    }
    return super.reloadItems();
  }

  @override
  void setGroupingBy(GroupField<Log>? value) {}

  Future<void> setPeriodFilter(DateFixedValue value) => applyFilter(() {
    settings.filter.fromDate = value.from;
    settings.filter.toDate = value.to;
    settings.filter.periodType = value.type;
  });

  Future<void> setProductIdFilter(int? value) =>
      applyFilter(() => settings.filter.productId = value);

  Future<void> setCertificateIdFilter(int? value) =>
      applyFilter(() => settings.filter.certificateId = value);

  void setIpAddressFilter(String? value) =>
      debounceFilter(() => settings.filter.ipAddress = value);

  Future<void> setPathFilter(String? value) =>
      applyFilter(() => settings.filter.requestPath = value);

  Future<void> setErrorTypeFilter(LogErrorType? value) =>
      applyFilter(() => settings.filter.errorType = value);

  void setTokenUsageFilter(int? value) =>
      debounceFilter(() => settings.filter.tokenUsage = value);

  void setTokenRequestSizeFilter(String? value) =>
      debounceFilter(() => settings.filter.externalServiceRequestSize = value);

  void setTokenResponseSizeFilter(String? value) =>
      debounceFilter(() => settings.filter.externalServiceResponseSize = value);
}
