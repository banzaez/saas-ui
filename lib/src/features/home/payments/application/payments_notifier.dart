import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/repository/payments_repository.dart';
import 'package:saas_ui/src/features/home/payments/application/settings/payment_settings.dart';

part 'payments_notifier.g.dart';

@riverpod
class Payments extends _$Payments
    with
        AsyncReadOnlyNotifierMixin<Payment, int, PaymentSettings>,
        AppTableSourceMixin<Payment, PaymentSettings> {
  PaymentSettings _settings = PaymentSettings();
  @override
  PaymentSettings get settings => _settings;
  @override
  set settings(PaymentSettings value) => _settings = value;

  @override
  PaymentsRepository get repository => ref.read(paymentsRepositoryProvider);

  @override
  FutureOr<List<Payment>> build() => reloadItems();

  Future<void> setMethodFilter(PaymentMethod? value) => applyFilter(
    () => settings.filter.methods = value != null ? [value] : null,
  );

  Future<void> setStatusFilter(PaymentStatus? value) => applyFilter(
    () => settings.filter.statuses = value != null ? [value] : null,
  );

  Future<void> setDateRangeFilter(DateTime? startDate, DateTime? endDate) =>
      applyFilter(() {
        settings.filter.fromDate = startDate?.startOfDay;
        settings.filter.toDate = endDate?.endOfDay;
      });
}
