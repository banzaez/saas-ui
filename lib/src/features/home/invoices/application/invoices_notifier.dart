import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_crud_notifier.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/repository/invoices_repository.dart';
import 'package:saas_ui/src/features/home/invoices/application/settings/invoice_settings.dart';

part 'invoices_notifier.g.dart';

@riverpod
class Invoices extends _$Invoices
    with
        AsyncReadOnlyNotifierMixin<Invoice, int, InvoiceSettings>,
        AsyncCrudNotifierMixin<Invoice, int, InvoiceSettings>,
        AppTableSourceMixin<Invoice, InvoiceSettings> {
  InvoiceSettings _settings = InvoiceSettings();
  @override
  InvoiceSettings get settings => _settings;
  @override
  set settings(InvoiceSettings value) => _settings = value;

  @override
  InvoicesRepository get repository => ref.read(invoicesRepositoryProvider);

  @override
  FutureOr<List<Invoice>> build() => reloadItems();

  @override
  Invoice createNewInstance() => const Invoice();

  Future<void> setMethodFilter(PaymentMethod? value) =>
      applyFilter(() => settings.filter.method = value);

  Future<void> setStatusFilter(InvoiceStatus? value) =>
      applyFilter(() => settings.filter.status = value);

  Future<void> setDateRangeFilter(DateTime? startDate, DateTime? endDate) =>
      applyFilter(() {
        settings.filter.fromDate = startDate;
        settings.filter.toDate = endDate;
      });
}
