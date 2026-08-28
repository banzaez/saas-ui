// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Log _$LogFromJson(Map<String, dynamic> json) => _Log(
  id: (json['id'] as num?)?.toInt(),
  certificateId: (json['certificate_id'] as num?)?.toInt(),
  certificateName: json['certificate_name'] as String? ?? "",
  baseId: (json['base_id'] as num?)?.toInt(),
  baseName: json['base_dbname'] as String? ?? "",
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String? ?? "",
  ipAddress: json['ip_address'] as String? ?? "",
  requestMethod: json['request_method'] as String? ?? "",
  requestPath: json['request_path'] as String? ?? "",
  requestBody: json['request_body'] as String? ?? "",
  responseStatusCode: (json['response_status_code'] as num?)?.toInt() ?? 0,
  responseBody: json['response_body'] as String? ?? "",
  externalServiceUrl: json['external_service_url'] as String? ?? "",
  externalServiceRequestBody:
      json['external_service_request_body'] as String? ?? "",
  externalServiceResponseBody:
      json['external_service_response_body'] as String? ?? "",
  externalServiceResponseStatus:
      (json['external_service_response_status'] as num?)?.toInt() ?? 0,
  externalServiceResponseTime:
      (json['external_service_response_time_ms'] as num?)?.toInt() ?? 0,
  tokensActuallyCharged:
      (json['tokens_actually_charged'] as num?)?.toInt() ?? 0,
  tokensReportedByService:
      (json['tokens_reported_by_service'] as num?)?.toInt() ?? 0,
  errorType:
      $enumDecodeNullable(_$LogErrorTypeEnumMap, json['error_type']) ??
      LogErrorType.none,
  errorMessage: json['error_message'] as String? ?? "",
  duration: (json['duration_ms'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['created_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  externalServiceRequestSize:
      (json['external_service_request_size'] as num?)?.toInt() ?? 0,
  externalServiceResponseSize:
      (json['external_service_response_size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$LogToJson(_Log instance) => <String, dynamic>{
  'id': instance.id,
  'certificate_id': instance.certificateId,
  'base_id': instance.baseId,
  'product_id': instance.productId,
  'ip_address': instance.ipAddress,
  'request_method': instance.requestMethod,
  'request_path': instance.requestPath,
  'request_body': instance.requestBody,
  'response_status_code': instance.responseStatusCode,
  'response_body': instance.responseBody,
  'external_service_url': instance.externalServiceUrl,
  'external_service_request_body': instance.externalServiceRequestBody,
  'external_service_response_body': instance.externalServiceResponseBody,
  'external_service_response_status': instance.externalServiceResponseStatus,
  'external_service_response_time_ms': instance.externalServiceResponseTime,
  'tokens_actually_charged': instance.tokensActuallyCharged,
  'tokens_reported_by_service': instance.tokensReportedByService,
  'error_type': _$LogErrorTypeEnumMap[instance.errorType]!,
  'error_message': instance.errorMessage,
  'duration_ms': instance.duration,
  'created_at': instance.createdAt.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'external_service_request_size': instance.externalServiceRequestSize,
  'external_service_response_size': instance.externalServiceResponseSize,
};

const _$LogErrorTypeEnumMap = {
  LogErrorType.none: 'none',
  LogErrorType.validation: 'validation',
  LogErrorType.externalService: 'external_service',
  LogErrorType.externalError: 'external_error',
  LogErrorType.externalHttpError: 'external_http_error',
  LogErrorType.internal: 'internal',
  LogErrorType.timeout: 'timeout',
  LogErrorType.proxyTimeout: 'proxy_timeout',
  LogErrorType.insufficientTokens: 'insufficient_tokens',
};
