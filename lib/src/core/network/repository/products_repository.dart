import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/support/products/application/settings/product_settings.dart';

part 'products_repository.g.dart';

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(Ref ref) =>
    ProductsRepository(ref.watch(serverApiProvider));

class ProductsRepository extends CrudRepository<Product, int, ProductSettings> {
  ProductsRepository(super.api);
  @override
  Future<RequestResult<List<Product>>> listAll([ProductSettings? filter]) =>
      sendRequest<List<Product>>(
        () => api.listProducts(
          filter?.filter.activeOnly,
          filter?.offset,
          filter?.limit,
        ),
      );

  @override
  Future<RequestResult<Product>> create(Product product) =>
      sendRequest<Product>(() => api.createProduct(product));

  @override
  Future<RequestResult<Product>> getById(int id) =>
      sendRequest<Product>(() => api.getProduct(id));

  @override
  Future<RequestResult<Product>> update(int id, Product product) =>
      sendRequest<Product>(() => api.updateProduct(id, product));

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteProduct(id));
}
