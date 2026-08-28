import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/network/models/requests/product_offer_buy_request.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/features/support/packages/application/settings/product_offer_settings.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/core/network/models/response/product_offer_buy_response.dart';
import 'package:saas_ui/src/core/network/models/response/total_sum_response.dart';

part 'product_offers_repository.g.dart';

@Riverpod(keepAlive: true)
ProductOffersRepository productOffersRepository(Ref ref) =>
    ProductOffersRepository(ref.watch(serverApiProvider));

class ProductOffersRepository
    extends CrudRepository<ProductOffer, int, ProductOfferSettings> {
  ProductOffersRepository(super.api);
  @override
  Future<RequestResult<List<ProductOffer>>> listAll([
    ProductOfferSettings? settings,
  ]) {
    // Фильтрация и сортировка API-параметрами, локальная сортировка в контроллере
    return sendRequest<List<ProductOffer>>(
      () => api.getProductOffers(
        settings?.filter.productId,
        settings?.filter.activeOnly,
        settings?.sort.sortingApiBy?.value,
        settings?.sort.sortingReverse,
      ),
    );
  }

  @override
  Future<RequestResult<ProductOffer>> getById(int id) =>
      sendRequest<ProductOffer>(() => api.getProductOffer(id));

  @override
  Future<RequestResult<ProductOffer>> create(ProductOffer package) =>
      sendRequest<ProductOffer>(() => api.createProductOffer(package));

  @override
  Future<RequestResult<ProductOffer>> update(int id, ProductOffer package) =>
      sendRequest<ProductOffer>(() => api.updateProductOffer(id, package));

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteProductOffer(id));

  Future<RequestResult<ProductOfferBuyResponse>> createProductOfferBuy({
    required int offerId,
    int? certificateId,
  }) => sendRequest<ProductOfferBuyResponse>(
    () => api.createProductOfferBuy(
      offerId,
      ProductOfferBuyRequest(certificateId: certificateId),
    ),
  );

  Future<RequestResult<TotalSumResponse>> calcTotalSum(ProductOffer package) =>
      sendRequest<TotalSumResponse>(
        () => api.calcTotalSum(
          package.price,
          package.periodCount,
          package.discount,
        ),
      );
}
