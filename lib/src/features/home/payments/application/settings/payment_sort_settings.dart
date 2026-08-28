import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

/// Настройки сортировки платежей.
class PaymentSortSettings extends SortSettings<Payment> {
  @override
  final List<SortField<Payment>> availableSortFields = [
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
      id: 'company',
      name: 'По компании',
      compareTo: (a, b) => a.companyName.compareTo(b.companyName),
    ),
  ];

  @override
  String? get initialSortFieldId => 'date';

  PaymentSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  PaymentSortSettings createCopy({
    SortField<Payment>? sortingBy,
    bool? sortReverse,
  }) => PaymentSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
