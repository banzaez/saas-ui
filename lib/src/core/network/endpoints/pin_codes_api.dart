import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/pincodes";

mixin PinCodesApiMixin {
  @POST("$_path/")
  Future<ServerResponse<PinCode>> createPinCode(@Body() PinCode pinCode);

  @GET("$_path/")
  Future<ServerResponse<List<PinCode>>> getPinCodes(
    @Query("certificate_id") int certificateId,
  );

  @GET("$_path/{id}")
  Future<ServerResponse<PinCode>> getPinCode(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<PinCode>> updatePinCode(
    @Path("id") int id,
    @Body() PinCode pinCode,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deletePinCode(@Path("id") int id);

  @GET("$_path/validate")
  Future<ServerResponse<bool>> validatePinCode(@Query("pin") String pin);
}
