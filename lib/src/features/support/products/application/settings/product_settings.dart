import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/product.dart';

import 'product_filter_settings.dart';
import 'product_sort_settings.dart';

export 'product_filter_settings.dart';
export 'product_sort_settings.dart';

/// Класс настроек для списка продуктов.
/// Объединяет в себе параметры фильтрации и сортировки.
class ProductSettings extends BaseListSettings<Product, ProductSettings>
    with FilterWithPagination {
  @override
  final ProductFilterSettings filter;

  @override
  final ProductSortSettings sort;

  ProductSettings({
    String? search,
    bool activeOnly = true,
    SortField<Product>? sortingBy,
    bool sortingReverse = false,
  }) : filter = ProductFilterSettings(search: search, activeOnly: activeOnly),
       sort = ProductSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  ProductSettings createCopy({
    SortSettings<Product>? sort,
    GroupSettings<Product>? group,
  }) => ProductSettings(
    search: filter.search,
    activeOnly: filter.activeOnly,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
