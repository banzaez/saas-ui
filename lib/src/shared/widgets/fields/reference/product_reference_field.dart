import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/repository/products_repository.dart';
import 'package:saas_ui/src/features/support/products/application/settings/product_settings.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/base/base_reference_widget.dart';

class ProductReferenceField extends BaseReferenceWidget<Product> {
  const ProductReferenceField({
    super.key,
    super.onChanged,
    super.enabled,
    super.initialValue,
    super.decoration,
    super.validator,
  });

  @override
  Future<List<Product>> getItems(WidgetRef ref) async {
    final repo = ref.read(productsRepositoryProvider);
    final response = await repo.listAll(ProductSettings()..loadAll());
    return response.result ?? <Product>[];
  }
}
