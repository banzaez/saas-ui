import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/company.dart';

import 'company_filter_settings.dart';
import 'company_sort_settings.dart';

export 'company_filter_settings.dart';
export 'company_sort_settings.dart';

/// Класс настроек для списка компаний.
/// Объединяет в себе параметры фильтрации и сортировки.
class CompanySettings extends BaseListSettings<Company, CompanySettings>
    with FilterWithPagination {
  @override
  final CompanyFilterSettings filter;

  @override
  final CompanySortSettings sort;

  CompanySettings({
    String? search,
    bool? isSeller,
    CompanyStatus? status,
    SortField<Company>? sortingBy,
    bool sortingReverse = false,
  }) : filter = CompanyFilterSettings(
         search: search,
         isSeller: isSeller,
         status: status,
       ),
       sort = CompanySortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  CompanySettings createCopy({
    SortSettings<Company>? sort,
    GroupSettings<Company>? group,
  }) => CompanySettings(
    search: filter.search,
    isSeller: filter.isSeller,
    status: filter.status,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
