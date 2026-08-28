import 'package:flutter/material.dart' show Color, Colors;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';

part 'log.freezed.dart';
part 'log.g.dart';

@freezed
sealed class Log with _$Log implements BaseModel {
  const Log._();

  const factory Log({
    int? id,
    @JsonKey(name: 'certificate_id') int? certificateId,
    @JsonKey(name: 'certificate_name', includeToJson: false)
    @Default("")
    String certificateName,
    @JsonKey(name: 'base_id') int? baseId,
    @JsonKey(name: 'base_dbname', includeToJson: false)
    @Default("")
    String baseName,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name', includeToJson: false)
    @Default("")
    String productName,
    @JsonKey(name: 'ip_address') @Default("") String ipAddress,
    @JsonKey(name: 'request_method') @Default("") String requestMethod,
    @JsonKey(name: 'request_path') @Default("") String requestPath,
    @JsonKey(name: 'request_body') @Default("") String requestBody,
    @JsonKey(name: 'response_status_code') @Default(0) int responseStatusCode,
    @JsonKey(name: 'response_body') @Default("") String responseBody,
    @JsonKey(name: 'external_service_url')
    @Default("")
    String externalServiceUrl,
    @JsonKey(name: 'external_service_request_body')
    @Default("")
    String externalServiceRequestBody,
    @JsonKey(name: 'external_service_response_body')
    @Default("")
    String externalServiceResponseBody,
    @JsonKey(name: 'external_service_response_status')
    @Default(0)
    int externalServiceResponseStatus,
    @JsonKey(name: 'external_service_response_time_ms')
    @Default(0)
    int externalServiceResponseTime,
    @JsonKey(name: 'tokens_actually_charged')
    @Default(0)
    int tokensActuallyCharged,
    @JsonKey(name: 'tokens_reported_by_service')
    @Default(0)
    int tokensReportedByService,
    @JsonKey(name: 'error_type')
    @Default(LogErrorType.none)
    LogErrorType errorType,
    @JsonKey(name: 'error_message') @Default("") String errorMessage,
    @JsonKey(name: 'duration_ms') @Default(0) int duration,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'external_service_request_size')
    @Default(0)
    int externalServiceRequestSize,
    @JsonKey(name: 'external_service_response_size')
    @Default(0)
    int externalServiceResponseSize,
  }) = _Log;

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

  @override
  String get getName => ipAddress;

  String get simplePath => requestPath.split("/").last;
}

enum LogErrorType with EnumWithText {
  @JsonValue("none")
  none,
  @JsonValue("validation")
  validation,
  @JsonValue("external_service")
  externalService,
  @JsonValue("external_error")
  externalError,
  @JsonValue("external_http_error")
  externalHttpError,
  @JsonValue("internal")
  internal,
  @JsonValue("timeout")
  timeout,
  @JsonValue("proxy_timeout")
  proxyTimeout,
  @JsonValue("insufficient_tokens")
  insufficientTokens;

  @override
  String toString() => switch (this) {
    none => 'none',
    validation => 'validation',
    externalService => 'external_service',
    externalError => 'external_error',
    externalHttpError => 'external_http_error',
    internal => 'internal',
    timeout => 'timeout',
    proxyTimeout => 'proxy_timeout',
    insufficientTokens => 'insufficient_tokens',
  };

  @override
  String text() => switch (this) {
    none => 'Успешно',
    validation => 'Ошибка валидации',
    externalService => 'Ошибка внешнего сервиса',
    externalError => 'Ошибка внешнего API',
    externalHttpError => 'Ошибка внешнего HTTP',
    internal => 'Ошибка внутренняя',
    timeout => 'Таймаут',
    proxyTimeout => 'Таймаут прокси',
    insufficientTokens => 'Недостаточно токенов',
  };

  Color get color => switch (this) {
    none => Colors.green,
    validation => Colors.red,
    externalService => Colors.red,
    externalError => Colors.red,
    externalHttpError => Colors.red,
    internal => Colors.red,
    timeout => Colors.red,
    proxyTimeout => Colors.red,
    insufficientTokens => Colors.red,
  };
}
