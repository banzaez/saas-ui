import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/log.dart';

import 'log_filter_settings.dart';
import 'log_sort_settings.dart';

export 'log_filter_settings.dart';
export 'log_sort_settings.dart';

/// Настройки для списка логов.
/// Объединяет параметры серверной фильтрации и пагинации.
class LogSettings extends BaseListSettings<Log, LogSettings>
    with FilterWithPagination {
  @override
  final LogFilterSettings filter;

  @override
  final LogSortSettings sort;

  LogSettings({
    String? search,
    DateTime? fromDate,
    DateTime? toDate,
    DateFixedPeriodType? periodType,
    int? productId,
    int? certificateId,
    LogErrorType? errorType,
    String? ipAddress,
    int? tokenUsage,
    String? requestPath,
    String? externalServiceRequestSize,
    String? externalServiceResponseSize,
    SortField<Log>? sortingBy,
    bool sortingReverse = true,
  }) : filter = LogFilterSettings(
         search: search,
         fromDate: fromDate,
         toDate: toDate,
         periodType: periodType,
         productId: productId,
         certificateId: certificateId,
         errorType: errorType,
         ipAddress: ipAddress,
         tokenUsage: tokenUsage,
         requestPath: requestPath,
         externalServiceRequestSize: externalServiceRequestSize,
         externalServiceResponseSize: externalServiceResponseSize,
       ),
       sort = LogSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  LogSettings createCopy({
    SortSettings<Log>? sort,
    GroupSettings<Log>? group,
  }) => LogSettings(
    search: filter.search,
    fromDate: filter.fromDate,
    toDate: filter.toDate,
    periodType: filter.periodType,
    productId: filter.productId,
    certificateId: filter.certificateId,
    errorType: filter.errorType,
    ipAddress: filter.ipAddress,
    tokenUsage: filter.tokenUsage,
    requestPath: filter.requestPath,
    externalServiceRequestSize: filter.externalServiceRequestSize,
    externalServiceResponseSize: filter.externalServiceResponseSize,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
