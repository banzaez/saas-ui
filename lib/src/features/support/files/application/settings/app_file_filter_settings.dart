import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';

/// Настройки фильтрации для списка файлов.
class AppFileFilterSettings extends FilterSettings<AppFile> {
  int? companyId;
  int? productId;

  AppFileFilterSettings({super.search, this.companyId, this.productId});

  @override
  List<AppFile> filterItems(List<AppFile> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [
        if (companyId != null) (item) => item.companyId == companyId,
        if (productId != null) (item) => item.productId == productId,
      ],
      searchExtractors: [
        (item) => item.filename,
        (item) => item.productName ?? '',
        (item) => item.id.toString(),
      ],
    );
  }
}
