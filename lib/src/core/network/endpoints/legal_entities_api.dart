import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/legal_entities";

mixin LegalEntitiesApiMixin {
  @POST("$_path/")
  Future<ServerResponse<LegalEntity>> createLegalEntity(
    @Body() LegalEntity legalEntity,
  );

  @GET("$_path/")
  Future<ServerResponse<List<LegalEntity>>> getLegalEntities(
    @Query("skip") int? offset,
    @Query("limit") int? limit,
  );

  @GET("$_path/sellers")
  Future<ServerResponse<List<LegalEntity>>> getLegalEntitiesSellersOnly();

  @GET("$_path/{id}")
  Future<ServerResponse<LegalEntity>> getLegalEntity(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<LegalEntity>> updateLegalEntity(
    @Path("id") int id,
    @Body() LegalEntity legalEntity,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteLegalEntity(
    @Path("id") int id,
  );
}
