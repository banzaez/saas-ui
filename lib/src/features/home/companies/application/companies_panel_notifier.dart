import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/features/home/companies/application/companies_notifier.dart';

part 'companies_panel_notifier.g.dart';

@riverpod
class CompaniesPanel extends _$CompaniesPanel with PanelActions<Company> {
  @override
  Company? build() => null;

  void openCreate() {
    state = ref.read(companiesProvider.notifier).createNewInstance();
  }
}
