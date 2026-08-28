import 'dart:typed_data';

import 'package:dio/dio.dart'
    show ResponseType, MultipartFile, ProgressCallback, CancelToken;
import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/network/models/response/app_file_upload_response.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/file";

mixin AppFilesApiMixin {
  @POST(_path)
  @MultiPart()
  Future<ServerResponse<AppFileUploadResponse>> uploadFile(
    @Part() MultipartFile file,
    @Query("product_id") int? productId,
    @Query("uuid") String? uuid, {
    @SendProgress() ProgressCallback? onSendProgress,
    @CancelRequest() CancelToken? cancelToken,
  });

  @GET("$_path/{file_id}/download")
  @DioResponseType(ResponseType.bytes)
  Future<Uint8List> downloadFile(
    @Header("Accept") String? mimetype,
    @Path("file_id") int fileId,
  );

  @GET("$_path/list")
  Future<ServerResponse<List<AppFile>>> listFiles(
    @Query("company_id") int? companyId,
    @Query("product_id") int? productId,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  );

  @DELETE("$_path/{file_id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteFiles(
    @Path("file_id") int fileId,
  );
}
