import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

/// Настройки фильтрации для списка статистики.
/// Все поля передаются в API — клиентская фильтрация не применяется.
class StatisticFilterSettings extends FilterSettings<Statistic> {
  int? companyId;
  int? certificateId;
  TokenTransactionType? transactionType;
  DateTime? fromDate;
  DateTime? toDate;

  StatisticFilterSettings({
    super.search,
    this.companyId,
    this.certificateId,
    this.transactionType,
    this.fromDate,
    this.toDate,
  });
}
