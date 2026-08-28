import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

import 'invoice_filter_settings.dart';
import 'invoice_sort_settings.dart';

export 'invoice_filter_settings.dart';
export 'invoice_sort_settings.dart';

/// Настройки для списка счетов.
/// Объединяет параметры фильтрации и сортировки.
/// Пагинация отсутствует — API возвращает весь список.
class InvoiceSettings extends BaseListSettings<Invoice, InvoiceSettings> {
  @override
  final InvoiceFilterSettings filter;

  @override
  final InvoiceSortSettings sort;

  InvoiceSettings({
    String? search,
    PaymentMethod? method,
    InvoiceStatus? status,
    DateTime? fromDate,
    DateTime? toDate,
    SortField<Invoice>? sortingBy,
    bool sortingReverse = false,
  }) : filter = InvoiceFilterSettings(
         search: search,
         method: method,
         status: status,
         fromDate: fromDate,
         toDate: toDate,
       ),
       sort = InvoiceSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  InvoiceSettings createCopy({
    SortSettings<Invoice>? sort,
    GroupSettings<Invoice>? group,
  }) => InvoiceSettings(
    search: filter.search,
    method: filter.method,
    status: filter.status,
    fromDate: filter.fromDate,
    toDate: filter.toDate,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
