import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';

/// Настройки фильтрации для списка сертификатов.
class CertificateFilterSettings extends FilterSettings<Certificate> {
  CertificateFilterSettings({super.search});

  @override
  List<Certificate> filterItems(List<Certificate> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      searchExtractors: [
        (item) => item.companyName,
        (item) => item.productName,
        (item) => item.legalEntityName,
        (item) => item.id.toString(),
      ],
    );
  }
}
