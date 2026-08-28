import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/support/token_transactions/application/settings/token_transaction_settings.dart';

part 'token_transaction_repository.g.dart';

@Riverpod(keepAlive: true)
TokenTransactionsRepository tokenTransactionsRepository(Ref ref) =>
    TokenTransactionsRepository(ref.watch(serverApiProvider));

class TokenTransactionsRepository
    extends
        ReadOnlyRepository<TokenTransaction, int, TokenTransactionSettings> {
  TokenTransactionsRepository(super.api);
  @override
  Future<RequestResult<TokenTransaction>> getById(int id) =>
      sendRequest<TokenTransaction>(() => api.getTokenTransaction(id));

  @override
  Future<RequestResult<List<TokenTransaction>>> listAll([
    TokenTransactionSettings? filter,
  ]) => sendRequest<List<TokenTransaction>>(
    () => api.getTokenTransactions(
      filter?.filter.certificateId,
      filter?.filter.certificateItemId,
      filter?.filter.transactionType,
      filter?.filter.fromDate?.toUtc(),
      filter?.filter.toDate?.toUtc(),
      filter?.offset,
      filter?.limit,
    ),
  );

  Future<RequestResult<TokenTransaction>> createManualTokenTransaction(
    int certificateItemId,
    int tokensChange,
    String note,
  ) => sendRequest<TokenTransaction>(
    () =>
        api.createManualTokenTransaction(certificateItemId, tokensChange, note),
  );
}
