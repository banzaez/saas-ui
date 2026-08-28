import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

/// Настройки фильтрации для списка платежей.
class PaymentFilterSettings extends FilterSettings<Payment> {
  DateTime? fromDate;
  DateTime? toDate;
  int? companyId;
  List<PaymentMethod>? methods;
  List<PaymentStatus>? statuses;

  PaymentFilterSettings({
    super.search,
    this.fromDate,
    this.toDate,
    this.companyId,
    this.methods,
    this.statuses,
  });

  @override
  List<Payment> filterItems(List<Payment> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [
        if (companyId != null) (item) => item.companyId == companyId,
        if (fromDate != null)
          (item) => item.createdAt?.isAfter(fromDate!) ?? false,
        if (toDate != null)
          (item) => item.createdAt?.isBefore(toDate!) ?? false,
        if (methods != null && methods!.isNotEmpty)
          (item) => methods!.contains(item.method),
        if (statuses != null && statuses!.isNotEmpty)
          (item) => statuses!.contains(item.status),
      ],
      searchExtractors: [
        (item) => item.companyName,
        (item) => item.legalEntityName,
        (item) => item.id.toString(),
      ],
    );
  }
}
