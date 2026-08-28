import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/admin";

mixin StatisticsApiMixin {
  @GET("$_path/token-transactions-statistic")
  Future<ServerResponse<List<Statistic>>> getStatistic(
    @Query("company_id") int? companyId,
    @Query("certificate_id") int? certificateId,
    @Query("transaction_type") TokenTransactionType? transactionType,
    @Query("from_date") DateTime? fromDate,
    @Query("to_date") DateTime? toDate,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  );
}
