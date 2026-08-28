import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_crud_notifier.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/repository/companies_repository.dart';
import 'package:saas_ui/src/features/home/companies/application/settings/company_settings.dart';

part 'companies_notifier.g.dart';

@riverpod
class Companies extends _$Companies
    with
        AsyncReadOnlyNotifierMixin<Company, int, CompanySettings>,
        AsyncCrudNotifierMixin<Company, int, CompanySettings>,
        AppTableSourceMixin<Company, CompanySettings> {
  CompanySettings _settings = CompanySettings();
  @override
  CompanySettings get settings => _settings;
  @override
  set settings(CompanySettings value) => _settings = value;

  @override
  CompaniesRepository get repository => ref.read(companiesRepositoryProvider);

  @override
  FutureOr<List<Company>> build() => reloadItems();

  @override
  Company createNewInstance() => const Company();

  Future<void> setStatus(CompanyStatus? status) =>
      applyFilter(() => settings.filter.status = status);
}
