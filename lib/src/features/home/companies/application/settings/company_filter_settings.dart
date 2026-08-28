import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/company.dart';

/// Настройки фильтрации для списка компаний.
class CompanyFilterSettings extends FilterSettings<Company> {
  /// Серверный фильтр: передаётся в API как query-параметр `is_seller`.
  /// Не применяется в [filterItems] — клиентская фильтрация не нужна.
  bool? isSeller;

  /// Клиентский фильтр по статусу компании.
  CompanyStatus? status;

  CompanyFilterSettings({super.search, this.isSeller, this.status});

  @override
  List<Company> filterItems(List<Company> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [if (status != null) (item) => item.status == status],
      searchExtractors: [
        (item) => item.displayName,
        (item) => item.id.toString(),
      ],
    );
  }
}
