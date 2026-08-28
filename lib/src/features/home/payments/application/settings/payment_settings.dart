import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

import 'payment_filter_settings.dart';
import 'payment_group_settings.dart';
import 'payment_sort_settings.dart';

export 'payment_filter_settings.dart';
export 'payment_group_settings.dart';
export 'payment_sort_settings.dart';

/// Настройки для списка платежей.
/// Объединяет параметры фильтрации, сортировки и группировки.
class PaymentSettings extends BaseListSettings<Payment, PaymentSettings>
    with FilterWithPagination {
  @override
  final PaymentFilterSettings filter;

  @override
  final PaymentSortSettings sort;

  final PaymentGroupSettings _group;

  @override
  PaymentGroupSettings get group => _group;

  PaymentSettings({
    String? search,
    DateTime? fromDate,
    DateTime? toDate,
    int? companyId,
    List<PaymentMethod>? methods,
    List<PaymentStatus>? statuses,
    SortField<Payment>? sortingBy,
    bool sortingReverse = true,
    PaymentGroupSettings? group,
  }) : filter = PaymentFilterSettings(
         search: search,
         fromDate: fromDate,
         toDate: toDate,
         companyId: companyId,
         methods: methods,
         statuses: statuses,
       ),
       sort = PaymentSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       ),
       _group = group ?? PaymentGroupSettings();

  @override
  PaymentSettings createCopy({
    SortSettings<Payment>? sort,
    GroupSettings<Payment>? group,
  }) => PaymentSettings(
    search: filter.search,
    fromDate: filter.fromDate,
    toDate: filter.toDate,
    companyId: filter.companyId,
    methods: filter.methods,
    statuses: filter.statuses,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
    group: group as PaymentGroupSettings? ?? _group,
  );
}
