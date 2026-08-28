import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';

/// Настройки сортировки сертификатов.
class CertificateSortSettings extends SortSettings<Certificate> {
  @override
  final List<SortField<Certificate>> availableSortFields = [
    SortField(
      id: 'id',
      name: 'По ID',
      compareTo: (a, b) => (a.id ?? 0).compareTo(b.id ?? 0),
    ),
    SortField(
      id: 'company',
      name: 'По компании',
      compareTo: (a, b) => a.companyName.compareTo(b.companyName),
    ),
    SortField(
      id: 'product',
      name: 'По продукту',
      compareTo: (a, b) => a.productName.compareTo(b.productName),
    ),
  ];

  @override
  String? get initialSortFieldId => 'id';

  CertificateSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  CertificateSortSettings createCopy({
    SortField<Certificate>? sortingBy,
    bool? sortReverse,
  }) => CertificateSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
