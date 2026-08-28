import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/admin/token-transactions";

mixin TokenTransactionsApiMixin {
  @GET(_path)
  Future<ServerResponse<List<TokenTransaction>>> getTokenTransactions(
    @Query("certificate_id") int? certificateId,
    @Query("certificate_item_id") int? certificateItemId,
    @Query("transaction_type") TokenTransactionType? transactionType,
    @Query("from_date") DateTime? fromDate,
    @Query("to_date") DateTime? toDate,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  );

  @GET("$_path/{transaction_id}")
  Future<ServerResponse<TokenTransaction>> getTokenTransaction(
    @Path("transaction_id") int transactionId,
  );

  @POST("$_path/manual")
  Future<ServerResponse<TokenTransaction>> createManualTokenTransaction(
    @Query("certificate_item_id") int certificateItemId,
    @Query("tokens_change") int tokensChange,
    @Query("note") String note,
  );
}
