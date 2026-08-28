import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';

/// Настройки фильтрации для списка юридических лиц.
class LegalEntityFilterSettings extends FilterSettings<LegalEntity> {
  LegalEntityFilterSettings({super.search});

  @override
  List<LegalEntity> filterItems(List<LegalEntity> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      searchExtractors: [
        (item) => item.fullName,
        (item) => item.inn,
        (item) => item.companyName,
        (item) => item.id.toString(),
      ],
    );
  }
}
