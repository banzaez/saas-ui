import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/users";

mixin UsersApiMixin {
  @POST("$_path/")
  Future<ServerResponse<User>> createUser(@Body() User user);

  @GET("$_path/")
  Future<ServerResponse<List<User>>> getUsers(
    @Query("skip") int? offset,
    @Query("limit") int? limit,
  );

  @GET("$_path/{id}")
  Future<ServerResponse<User>> getUser(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<User>> updateUser(
    @Path("id") int id,
    @Body() User user,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteUser(@Path("id") int id);
}
