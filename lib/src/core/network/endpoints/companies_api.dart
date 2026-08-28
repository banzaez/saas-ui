import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/requests/attach_partner_request.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/companies";

mixin CompaniesApiMixin {
  @POST("$_path/")
  Future<ServerResponse<Company>> createCompany(@Body() Company request);

  @GET("$_path/")
  Future<ServerResponse<List<Company>>> getCompanies(
    @Query("is_seller") bool? isSeller,
    @Query("skip") int? offset,
    @Query("limit") int? limit,
  );

  @GET("$_path/{id}")
  Future<ServerResponse<Company>> getCompany(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<Company>> updateCompany(
    @Path("id") int id,
    @Body() Company request,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteCompany(@Path("id") int id);

  @POST("$_path/partner/attach")
  Future<ServerResponse<void>> attachPartner(
    @Body() AttachPartnerRequest request,
  );

  @POST("$_path/xapi/partner/attach")
  Future<ServerResponse<void>> attachPartnerXApi(
    @Header("X-Api-Key") String apiKey,
    @Body() AttachPartnerRequest request,
  );
}
