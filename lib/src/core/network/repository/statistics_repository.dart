import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/features/home/statistics/application/settings/statistic_settings.dart';

part 'statistics_repository.g.dart';

@Riverpod(keepAlive: true)
StatisticsRepository statisticsRepository(Ref ref) =>
    StatisticsRepository(ref.watch(serverApiProvider));

class StatisticsRepository
    extends ReadOnlyRepository<Statistic, int, StatisticSettings> {
  StatisticsRepository(super.api);
  @override
  Future<RequestResult<Statistic>> getById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<List<Statistic>>> listAll([StatisticSettings? filter]) =>
      sendRequest<List<Statistic>>(
        () => api.getStatistic(
          filter?.filter.companyId,
          filter?.filter.certificateId,
          filter?.filter.transactionType,
          filter?.filter.fromDate,
          filter?.filter.toDate,
          filter?.offset,
          filter?.limit,
        ),
      );
}
