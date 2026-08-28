import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

/// Настройки сортировки транзакций токенов.
class TokenTransactionSortSettings extends SortSettings<TokenTransaction> {
  @override
  final List<SortField<TokenTransaction>> availableSortFields = [
    SortField(
      id: 'date',
      name: 'По дате',
      compareTo: (a, b) => a.createdAt.compareTo(b.createdAt),
    ),
    SortField(
      id: 'change',
      name: 'По изменению',
      compareTo: (a, b) => a.tokensChange.compareTo(b.tokensChange),
    ),
  ];

  TokenTransactionSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  TokenTransactionSortSettings createCopy({
    SortField<TokenTransaction>? sortingBy,
    bool? sortReverse,
  }) => TokenTransactionSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
