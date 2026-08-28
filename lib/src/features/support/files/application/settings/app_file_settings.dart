import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';

import 'app_file_filter_settings.dart';
import 'app_file_group_settings.dart';
import 'app_file_sort_settings.dart';

export 'app_file_filter_settings.dart';
export 'app_file_group_settings.dart';
export 'app_file_sort_settings.dart';

/// Настройки для списка файлов.
/// Объединяет параметры фильтрации, сортировки и группировки.
class AppFileSettings extends BaseListSettings<AppFile, AppFileSettings>
    with FilterWithPagination {
  @override
  final AppFileFilterSettings filter;

  @override
  final AppFileSortSettings sort;

  final AppFileGroupSettings _group;

  @override
  AppFileGroupSettings get group => _group;

  AppFileSettings({
    String? search,
    int? companyId,
    int? productId,
    SortField<AppFile>? sortingBy,
    bool sortingReverse = false,
    AppFileGroupSettings? group,
  }) : filter = AppFileFilterSettings(
         search: search,
         companyId: companyId,
         productId: productId,
       ),
       sort = AppFileSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       ),
       _group = group ?? AppFileGroupSettings();

  @override
  AppFileSettings createCopy({
    SortSettings<AppFile>? sort,
    GroupSettings<AppFile>? group,
  }) => AppFileSettings(
    search: filter.search,
    companyId: filter.companyId,
    productId: filter.productId,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
    group: group as AppFileGroupSettings? ?? _group,
  );
}
