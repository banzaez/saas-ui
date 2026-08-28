import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/certificates";

mixin CertificatesApiMixin {
  @POST("$_path/")
  Future<ServerResponse<Certificate>> createCertificate(
    @Body() Certificate request,
  );

  @GET("$_path/")
  Future<ServerResponse<List<Certificate>>> listCertificates();

  @GET("$_path/{id}")
  Future<ServerResponse<Certificate>> getCertificate(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<Certificate>> updateCertificate(
    @Path("id") int id,
    @Query("note") String? note,
    @Query("ip_whitelist") List<String>? ipWhitelist,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteCertificate(
    @Path("id") int id,
  );

  @POST("$_path/{id}/activate")
  Future<ServerResponse<bool>> activateCertificate(@Path("id") int id);

  @GET("$_path/validate")
  Future<ServerResponse<bool>> validateCertificate(@Query("pin") String pin);
}
