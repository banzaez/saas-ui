import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

/// Настройки фильтрации для списка транзакций токенов.
/// Все поля передаются в API — клиентская фильтрация не применяется.
class TokenTransactionFilterSettings extends FilterSettings<TokenTransaction> {
  int? certificateId;
  int? certificateItemId;
  TokenTransactionType? transactionType;
  DateTime? fromDate;
  DateTime? toDate;
  DateFixedPeriodType? periodType;

  TokenTransactionFilterSettings({
    super.search,
    this.certificateId,
    this.certificateItemId,
    this.transactionType,
    this.fromDate,
    this.toDate,
    this.periodType,
  });
}
