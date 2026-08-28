import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

import 'token_transaction_filter_settings.dart';
import 'token_transaction_sort_settings.dart';

export 'token_transaction_filter_settings.dart';
export 'token_transaction_sort_settings.dart';

/// Настройки для списка транзакций токенов.
/// Объединяет параметры серверной фильтрации, пагинации и клиентской сортировки.
class TokenTransactionSettings
    extends BaseListSettings<TokenTransaction, TokenTransactionSettings>
    with FilterWithPagination {
  @override
  final TokenTransactionFilterSettings filter;

  @override
  final TokenTransactionSortSettings sort;

  TokenTransactionSettings({
    String? search,
    int? certificateId,
    int? certificateItemId,
    TokenTransactionType? transactionType,
    DateTime? fromDate,
    DateTime? toDate,
    DateFixedPeriodType? periodType,
    SortField<TokenTransaction>? sortingBy,
    bool sortingReverse = true,
  }) : filter = TokenTransactionFilterSettings(
         search: search,
         certificateId: certificateId,
         certificateItemId: certificateItemId,
         transactionType: transactionType,
         fromDate: fromDate,
         toDate: toDate,
         periodType: periodType,
       ),
       sort = TokenTransactionSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  TokenTransactionSettings createCopy({
    SortSettings<TokenTransaction>? sort,
    GroupSettings<TokenTransaction>? group,
  }) => TokenTransactionSettings(
    search: filter.search,
    certificateId: filter.certificateId,
    certificateItemId: filter.certificateItemId,
    transactionType: filter.transactionType,
    fromDate: filter.fromDate,
    toDate: filter.toDate,
    periodType: filter.periodType,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
