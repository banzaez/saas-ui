import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';

/// Настройки сортировки счетов.
class InvoiceSortSettings extends SortSettings<Invoice> {
  @override
  final List<SortField<Invoice>> availableSortFields = [
    SortField(
      id: 'date',
      name: 'По дате',
      compareTo: (a, b) =>
          (a.createdAt ?? DateTime(0)).compareTo(b.createdAt ?? DateTime(0)),
    ),
    SortField(
      id: 'amount',
      name: 'По сумме',
      compareTo: (a, b) => a.amount.compareTo(b.amount),
    ),
    SortField(
      id: 'number',
      name: 'По номеру',
      compareTo: (a, b) => a.invoiceNumber.compareTo(b.invoiceNumber),
    ),
  ];

  @override
  String? get initialSortFieldId => 'date';

  InvoiceSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  InvoiceSortSettings createCopy({
    SortField<Invoice>? sortingBy,
    bool? sortReverse,
  }) => InvoiceSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
