import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/product.dart';

/// Подкласс для управления логикой сортировки продуктов.
class ProductSortSettings extends SortSettings<Product> {
  @override
  final List<SortField<Product>> availableSortFields = [
    SortField(
      id: 'name',
      name: 'По наименованию',
      compareTo: (a, b) {
        // Приоритет активным продуктам
        if (a.isActive != b.isActive) {
          return a.isActive ? -1 : 1;
        }
        return a.name.compareTo(b.name);
      },
    ),
    SortField(
      id: 'seller',
      name: 'По продавцу',
      compareTo: (a, b) {
        // Приоритет активным продуктам
        if (a.isActive != b.isActive) {
          return a.isActive ? -1 : 1;
        }
        return a.sellerName.compareTo(b.sellerName);
      },
    ),
  ];

  @override
  String? get initialSortFieldId => 'name';

  ProductSortSettings({super.sortingBy, super.sortingReverse});

  @override
  ProductSortSettings createCopy({
    SortField<Product>? sortingBy,
    bool? sortReverse,
  }) => ProductSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
