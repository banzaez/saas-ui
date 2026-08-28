import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/products";

mixin ProductsApiMixin {
  @POST("$_path/")
  Future<ServerResponse<Product>> createProduct(@Body() Product request);

  @GET("$_path/")
  Future<ServerResponse<List<Product>>> listProducts(
    @Query("active_only") bool? activeOnly,
    @Query("skip") int? offset,
    @Query("limit") int? limit,
  );

  @GET("$_path/{id}")
  Future<ServerResponse<Product>> getProduct(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<Product>> updateProduct(
    @Path("id") int id,
    @Body() Product request,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteProduct(@Path("id") int id);
}
