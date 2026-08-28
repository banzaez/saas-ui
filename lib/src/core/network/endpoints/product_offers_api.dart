import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/requests/product_offer_buy_request.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/product_offer_buy_response.dart';
import 'package:saas_ui/src/core/network/models/response/total_sum_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/product-offers";

mixin ProductOffersApiMixin {
  @POST("$_path/")
  Future<ServerResponse<ProductOffer>> createProductOffer(
    @Body() ProductOffer request,
  );

  @GET("$_path/")
  Future<ServerResponse<List<ProductOffer>>> getProductOffers(
    @Query("product_id") int? productId,
    @Query("active_only") bool? activeOnly,
    @Query("sorting_by") String? sortingBy,
    @Query("sorting_reverse") bool? sortingReverse,
  );

  @GET("$_path/{id}")
  Future<ServerResponse<ProductOffer>> getProductOffer(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<ProductOffer>> updateProductOffer(
    @Path("id") int id,
    @Body() ProductOffer request,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteProductOffer(
    @Path("id") int id,
  );

  @POST("$_path/{id}/buy")
  Future<ServerResponse<ProductOfferBuyResponse>> createProductOfferBuy(
    @Path("id") int offerId,
    @Body() ProductOfferBuyRequest request,
  );

  @GET("$_path/total_sum")
  Future<ServerResponse<TotalSumResponse>> calcTotalSum(
    @Query("price") double price,
    @Query("period_count") int periodCount,
    @Query("discount") double discount,
  );
}
