import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/product.dart';

/// Настройки фильтрации для списка продуктов.
class ProductFilterSettings extends FilterSettings<Product> {
  bool activeOnly = true;

  ProductFilterSettings({super.search, this.activeOnly = true});

  @override
  List<Product> filterItems(List<Product> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [if (activeOnly) (item) => item.isActive],
      searchExtractors: [
        (item) => item.name,
        (item) => item.description,
        (item) => item.id.toString(),
      ],
    );
  }
}
