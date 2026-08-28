import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

import 'statistic_filter_settings.dart';
import 'statistic_sort_settings.dart';

export 'statistic_filter_settings.dart';
export 'statistic_sort_settings.dart';

/// Настройки для списка статистики.
/// Объединяет параметры серверной фильтрации и пагинации.
class StatisticSettings extends BaseListSettings<Statistic, StatisticSettings>
    with FilterWithPagination {
  @override
  final StatisticFilterSettings filter;

  @override
  final StatisticSortSettings sort;

  StatisticSettings({
    String? search,
    int? companyId,
    int? certificateId,
    TokenTransactionType? transactionType,
    DateTime? fromDate,
    DateTime? toDate,
    SortField<Statistic>? sortingBy,
    bool sortingReverse = false,
  }) : filter = StatisticFilterSettings(
         search: search,
         companyId: companyId,
         certificateId: certificateId,
         transactionType: transactionType,
         fromDate: fromDate,
         toDate: toDate,
       ),
       sort = StatisticSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  StatisticSettings createCopy({
    SortSettings<Statistic>? sort,
    GroupSettings<Statistic>? group,
  }) => StatisticSettings(
    search: filter.search,
    companyId: filter.companyId,
    certificateId: filter.certificateId,
    transactionType: filter.transactionType,
    fromDate: filter.fromDate,
    toDate: filter.toDate,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
