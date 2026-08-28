import 'package:saas_ui/src/core/models/date_fixed_period_type.dart';
import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/log.dart';

/// Настройки фильтрации для списка логов.
/// Все поля передаются в API — клиентская фильтрация не применяется.
class LogFilterSettings extends FilterSettings<Log> {
  int? productId;
  int? certificateId;
  LogErrorType? errorType;
  String? ipAddress;
  int? tokenUsage;
  String? requestPath;
  DateTime? fromDate;
  DateTime? toDate;
  DateFixedPeriodType? periodType;
  String? externalServiceRequestSize;
  String? externalServiceResponseSize;

  LogFilterSettings({
    super.search,
    this.productId,
    this.certificateId,
    this.errorType,
    this.ipAddress,
    this.tokenUsage,
    this.requestPath,
    this.fromDate,
    this.toDate,
    this.periodType,
    this.externalServiceRequestSize,
    this.externalServiceResponseSize,
  });
}
