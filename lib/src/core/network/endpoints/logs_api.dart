import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/admin/proxy-logs";

mixin LogsApiMixin {
  @GET(_path)
  Future<ServerResponse<List<Log>>> getProxyLogs(
    @Query("product_id") int? productId,
    @Query("certificate_id") int? certificateId,
    @Query("error_type") LogErrorType? errorType,
    @Query("ip_address") String? ipAddress,
    @Query("request_path") String? requestPath,
    @Query("from_date") DateTime? fromDate,
    @Query("to_date") DateTime? toDate,
    @Query("token_usage") int? tokenUsage,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
    @Query("external_service_request_size") String? externalServiceRequestSize,
    @Query("external_service_response_size")
    String? externalServiceResponseSize,
  );

  @GET("$_path/{log_id}")
  Future<ServerResponse<Log>> getProxyLog(@Path("log_id") int logId);

  @GET("$_path/request-paths")
  Future<ServerResponse<List<String>>> getRequestPaths();
}
