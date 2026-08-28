import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

/// Настройки фильтрации для списка счетов.
class InvoiceFilterSettings extends FilterSettings<Invoice> {
  PaymentMethod? method;
  InvoiceStatus? status;
  DateTime? fromDate;
  DateTime? toDate;

  InvoiceFilterSettings({
    super.search,
    this.method,
    this.status,
    this.fromDate,
    this.toDate,
  });

  @override
  List<Invoice> filterItems(List<Invoice> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [
        if (method != null) (item) => item.method == method,
        if (status != null) (item) => item.status == status,
        if (fromDate != null)
          (item) => item.createdAt?.isAfter(fromDate!) ?? false,
        if (toDate != null)
          (item) => item.createdAt?.isBefore(toDate!) ?? false,
      ],
      searchExtractors: [
        (item) => item.invoiceNumber,
        (item) => item.id.toString(),
      ],
    );
  }
}
