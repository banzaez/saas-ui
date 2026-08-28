import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/features/support/logs/application/settings/log_settings.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';

part 'logs_repository.g.dart';

@Riverpod(keepAlive: true)
LogsRepository logsRepository(Ref ref) =>
    LogsRepository(ref.watch(serverApiProvider));

class LogsRepository extends ReadOnlyRepository<Log, int, LogSettings> {
  LogsRepository(super.api);
  @override
  Future<RequestResult<List<Log>>> listAll([LogSettings? filter]) =>
      sendRequest<List<Log>>(
        () => api.getProxyLogs(
          filter?.filter.productId,
          filter?.filter.certificateId,
          filter?.filter.errorType,
          filter?.filter.ipAddress,
          filter?.filter.requestPath,
          filter?.filter.fromDate?.toUtc(),
          filter?.filter.toDate?.toUtc(),
          filter?.filter.tokenUsage,
          filter?.offset,
          filter?.limit,
          filter?.filter.externalServiceRequestSize,
          filter?.filter.externalServiceResponseSize,
        ),
      );

  @override
  Future<RequestResult<Log>> getById(int id) =>
      sendRequest<Log>(() => api.getProxyLog(id));

  Future<RequestResult<List<String>>> getRequestPaths() =>
      sendRequest<List<String>>(() => api.getRequestPaths());
}
