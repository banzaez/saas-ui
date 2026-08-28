// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Log {

 int? get id;@JsonKey(name: 'certificate_id') int? get certificateId;@JsonKey(name: 'certificate_name', includeToJson: false) String get certificateName;@JsonKey(name: 'base_id') int? get baseId;@JsonKey(name: 'base_dbname', includeToJson: false) String get baseName;@JsonKey(name: 'product_id') int? get productId;@JsonKey(name: 'product_name', includeToJson: false) String get productName;@JsonKey(name: 'ip_address') String get ipAddress;@JsonKey(name: 'request_method') String get requestMethod;@JsonKey(name: 'request_path') String get requestPath;@JsonKey(name: 'request_body') String get requestBody;@JsonKey(name: 'response_status_code') int get responseStatusCode;@JsonKey(name: 'response_body') String get responseBody;@JsonKey(name: 'external_service_url') String get externalServiceUrl;@JsonKey(name: 'external_service_request_body') String get externalServiceRequestBody;@JsonKey(name: 'external_service_response_body') String get externalServiceResponseBody;@JsonKey(name: 'external_service_response_status') int get externalServiceResponseStatus;@JsonKey(name: 'external_service_response_time_ms') int get externalServiceResponseTime;@JsonKey(name: 'tokens_actually_charged') int get tokensActuallyCharged;@JsonKey(name: 'tokens_reported_by_service') int get tokensReportedByService;@JsonKey(name: 'error_type') LogErrorType get errorType;@JsonKey(name: 'error_message') String get errorMessage;@JsonKey(name: 'duration_ms') int get duration;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'external_service_request_size') int get externalServiceRequestSize;@JsonKey(name: 'external_service_response_size') int get externalServiceResponseSize;
/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogCopyWith<Log> get copyWith => _$LogCopyWithImpl<Log>(this as Log, _$identity);

  /// Serializes this Log to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Log&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.certificateName, certificateName) || other.certificateName == certificateName)&&(identical(other.baseId, baseId) || other.baseId == baseId)&&(identical(other.baseName, baseName) || other.baseName == baseName)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.requestMethod, requestMethod) || other.requestMethod == requestMethod)&&(identical(other.requestPath, requestPath) || other.requestPath == requestPath)&&(identical(other.requestBody, requestBody) || other.requestBody == requestBody)&&(identical(other.responseStatusCode, responseStatusCode) || other.responseStatusCode == responseStatusCode)&&(identical(other.responseBody, responseBody) || other.responseBody == responseBody)&&(identical(other.externalServiceUrl, externalServiceUrl) || other.externalServiceUrl == externalServiceUrl)&&(identical(other.externalServiceRequestBody, externalServiceRequestBody) || other.externalServiceRequestBody == externalServiceRequestBody)&&(identical(other.externalServiceResponseBody, externalServiceResponseBody) || other.externalServiceResponseBody == externalServiceResponseBody)&&(identical(other.externalServiceResponseStatus, externalServiceResponseStatus) || other.externalServiceResponseStatus == externalServiceResponseStatus)&&(identical(other.externalServiceResponseTime, externalServiceResponseTime) || other.externalServiceResponseTime == externalServiceResponseTime)&&(identical(other.tokensActuallyCharged, tokensActuallyCharged) || other.tokensActuallyCharged == tokensActuallyCharged)&&(identical(other.tokensReportedByService, tokensReportedByService) || other.tokensReportedByService == tokensReportedByService)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.externalServiceRequestSize, externalServiceRequestSize) || other.externalServiceRequestSize == externalServiceRequestSize)&&(identical(other.externalServiceResponseSize, externalServiceResponseSize) || other.externalServiceResponseSize == externalServiceResponseSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,certificateId,certificateName,baseId,baseName,productId,productName,ipAddress,requestMethod,requestPath,requestBody,responseStatusCode,responseBody,externalServiceUrl,externalServiceRequestBody,externalServiceResponseBody,externalServiceResponseStatus,externalServiceResponseTime,tokensActuallyCharged,tokensReportedByService,errorType,errorMessage,duration,createdAt,completedAt,externalServiceRequestSize,externalServiceResponseSize]);

@override
String toString() {
  return 'Log(id: $id, certificateId: $certificateId, certificateName: $certificateName, baseId: $baseId, baseName: $baseName, productId: $productId, productName: $productName, ipAddress: $ipAddress, requestMethod: $requestMethod, requestPath: $requestPath, requestBody: $requestBody, responseStatusCode: $responseStatusCode, responseBody: $responseBody, externalServiceUrl: $externalServiceUrl, externalServiceRequestBody: $externalServiceRequestBody, externalServiceResponseBody: $externalServiceResponseBody, externalServiceResponseStatus: $externalServiceResponseStatus, externalServiceResponseTime: $externalServiceResponseTime, tokensActuallyCharged: $tokensActuallyCharged, tokensReportedByService: $tokensReportedByService, errorType: $errorType, errorMessage: $errorMessage, duration: $duration, createdAt: $createdAt, completedAt: $completedAt, externalServiceRequestSize: $externalServiceRequestSize, externalServiceResponseSize: $externalServiceResponseSize)';
}


}

/// @nodoc
abstract mixin class $LogCopyWith<$Res>  {
  factory $LogCopyWith(Log value, $Res Function(Log) _then) = _$LogCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_id') int? certificateId,@JsonKey(name: 'certificate_name', includeToJson: false) String certificateName,@JsonKey(name: 'base_id') int? baseId,@JsonKey(name: 'base_dbname', includeToJson: false) String baseName,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'product_name', includeToJson: false) String productName,@JsonKey(name: 'ip_address') String ipAddress,@JsonKey(name: 'request_method') String requestMethod,@JsonKey(name: 'request_path') String requestPath,@JsonKey(name: 'request_body') String requestBody,@JsonKey(name: 'response_status_code') int responseStatusCode,@JsonKey(name: 'response_body') String responseBody,@JsonKey(name: 'external_service_url') String externalServiceUrl,@JsonKey(name: 'external_service_request_body') String externalServiceRequestBody,@JsonKey(name: 'external_service_response_body') String externalServiceResponseBody,@JsonKey(name: 'external_service_response_status') int externalServiceResponseStatus,@JsonKey(name: 'external_service_response_time_ms') int externalServiceResponseTime,@JsonKey(name: 'tokens_actually_charged') int tokensActuallyCharged,@JsonKey(name: 'tokens_reported_by_service') int tokensReportedByService,@JsonKey(name: 'error_type') LogErrorType errorType,@JsonKey(name: 'error_message') String errorMessage,@JsonKey(name: 'duration_ms') int duration,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'external_service_request_size') int externalServiceRequestSize,@JsonKey(name: 'external_service_response_size') int externalServiceResponseSize
});




}
/// @nodoc
class _$LogCopyWithImpl<$Res>
    implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._self, this._then);

  final Log _self;
  final $Res Function(Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? certificateId = freezed,Object? certificateName = null,Object? baseId = freezed,Object? baseName = null,Object? productId = freezed,Object? productName = null,Object? ipAddress = null,Object? requestMethod = null,Object? requestPath = null,Object? requestBody = null,Object? responseStatusCode = null,Object? responseBody = null,Object? externalServiceUrl = null,Object? externalServiceRequestBody = null,Object? externalServiceResponseBody = null,Object? externalServiceResponseStatus = null,Object? externalServiceResponseTime = null,Object? tokensActuallyCharged = null,Object? tokensReportedByService = null,Object? errorType = null,Object? errorMessage = null,Object? duration = null,Object? createdAt = null,Object? completedAt = freezed,Object? externalServiceRequestSize = null,Object? externalServiceResponseSize = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateId: freezed == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int?,certificateName: null == certificateName ? _self.certificateName : certificateName // ignore: cast_nullable_to_non_nullable
as String,baseId: freezed == baseId ? _self.baseId : baseId // ignore: cast_nullable_to_non_nullable
as int?,baseName: null == baseName ? _self.baseName : baseName // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,requestMethod: null == requestMethod ? _self.requestMethod : requestMethod // ignore: cast_nullable_to_non_nullable
as String,requestPath: null == requestPath ? _self.requestPath : requestPath // ignore: cast_nullable_to_non_nullable
as String,requestBody: null == requestBody ? _self.requestBody : requestBody // ignore: cast_nullable_to_non_nullable
as String,responseStatusCode: null == responseStatusCode ? _self.responseStatusCode : responseStatusCode // ignore: cast_nullable_to_non_nullable
as int,responseBody: null == responseBody ? _self.responseBody : responseBody // ignore: cast_nullable_to_non_nullable
as String,externalServiceUrl: null == externalServiceUrl ? _self.externalServiceUrl : externalServiceUrl // ignore: cast_nullable_to_non_nullable
as String,externalServiceRequestBody: null == externalServiceRequestBody ? _self.externalServiceRequestBody : externalServiceRequestBody // ignore: cast_nullable_to_non_nullable
as String,externalServiceResponseBody: null == externalServiceResponseBody ? _self.externalServiceResponseBody : externalServiceResponseBody // ignore: cast_nullable_to_non_nullable
as String,externalServiceResponseStatus: null == externalServiceResponseStatus ? _self.externalServiceResponseStatus : externalServiceResponseStatus // ignore: cast_nullable_to_non_nullable
as int,externalServiceResponseTime: null == externalServiceResponseTime ? _self.externalServiceResponseTime : externalServiceResponseTime // ignore: cast_nullable_to_non_nullable
as int,tokensActuallyCharged: null == tokensActuallyCharged ? _self.tokensActuallyCharged : tokensActuallyCharged // ignore: cast_nullable_to_non_nullable
as int,tokensReportedByService: null == tokensReportedByService ? _self.tokensReportedByService : tokensReportedByService // ignore: cast_nullable_to_non_nullable
as int,errorType: null == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as LogErrorType,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,externalServiceRequestSize: null == externalServiceRequestSize ? _self.externalServiceRequestSize : externalServiceRequestSize // ignore: cast_nullable_to_non_nullable
as int,externalServiceResponseSize: null == externalServiceResponseSize ? _self.externalServiceResponseSize : externalServiceResponseSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Log].
extension LogPatterns on Log {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Log value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Log value)  $default,){
final _that = this;
switch (_that) {
case _Log():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Log value)?  $default,){
final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_id')  int? certificateId, @JsonKey(name: 'certificate_name', includeToJson: false)  String certificateName, @JsonKey(name: 'base_id')  int? baseId, @JsonKey(name: 'base_dbname', includeToJson: false)  String baseName, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName, @JsonKey(name: 'ip_address')  String ipAddress, @JsonKey(name: 'request_method')  String requestMethod, @JsonKey(name: 'request_path')  String requestPath, @JsonKey(name: 'request_body')  String requestBody, @JsonKey(name: 'response_status_code')  int responseStatusCode, @JsonKey(name: 'response_body')  String responseBody, @JsonKey(name: 'external_service_url')  String externalServiceUrl, @JsonKey(name: 'external_service_request_body')  String externalServiceRequestBody, @JsonKey(name: 'external_service_response_body')  String externalServiceResponseBody, @JsonKey(name: 'external_service_response_status')  int externalServiceResponseStatus, @JsonKey(name: 'external_service_response_time_ms')  int externalServiceResponseTime, @JsonKey(name: 'tokens_actually_charged')  int tokensActuallyCharged, @JsonKey(name: 'tokens_reported_by_service')  int tokensReportedByService, @JsonKey(name: 'error_type')  LogErrorType errorType, @JsonKey(name: 'error_message')  String errorMessage, @JsonKey(name: 'duration_ms')  int duration, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'external_service_request_size')  int externalServiceRequestSize, @JsonKey(name: 'external_service_response_size')  int externalServiceResponseSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.id,_that.certificateId,_that.certificateName,_that.baseId,_that.baseName,_that.productId,_that.productName,_that.ipAddress,_that.requestMethod,_that.requestPath,_that.requestBody,_that.responseStatusCode,_that.responseBody,_that.externalServiceUrl,_that.externalServiceRequestBody,_that.externalServiceResponseBody,_that.externalServiceResponseStatus,_that.externalServiceResponseTime,_that.tokensActuallyCharged,_that.tokensReportedByService,_that.errorType,_that.errorMessage,_that.duration,_that.createdAt,_that.completedAt,_that.externalServiceRequestSize,_that.externalServiceResponseSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_id')  int? certificateId, @JsonKey(name: 'certificate_name', includeToJson: false)  String certificateName, @JsonKey(name: 'base_id')  int? baseId, @JsonKey(name: 'base_dbname', includeToJson: false)  String baseName, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName, @JsonKey(name: 'ip_address')  String ipAddress, @JsonKey(name: 'request_method')  String requestMethod, @JsonKey(name: 'request_path')  String requestPath, @JsonKey(name: 'request_body')  String requestBody, @JsonKey(name: 'response_status_code')  int responseStatusCode, @JsonKey(name: 'response_body')  String responseBody, @JsonKey(name: 'external_service_url')  String externalServiceUrl, @JsonKey(name: 'external_service_request_body')  String externalServiceRequestBody, @JsonKey(name: 'external_service_response_body')  String externalServiceResponseBody, @JsonKey(name: 'external_service_response_status')  int externalServiceResponseStatus, @JsonKey(name: 'external_service_response_time_ms')  int externalServiceResponseTime, @JsonKey(name: 'tokens_actually_charged')  int tokensActuallyCharged, @JsonKey(name: 'tokens_reported_by_service')  int tokensReportedByService, @JsonKey(name: 'error_type')  LogErrorType errorType, @JsonKey(name: 'error_message')  String errorMessage, @JsonKey(name: 'duration_ms')  int duration, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'external_service_request_size')  int externalServiceRequestSize, @JsonKey(name: 'external_service_response_size')  int externalServiceResponseSize)  $default,) {final _that = this;
switch (_that) {
case _Log():
return $default(_that.id,_that.certificateId,_that.certificateName,_that.baseId,_that.baseName,_that.productId,_that.productName,_that.ipAddress,_that.requestMethod,_that.requestPath,_that.requestBody,_that.responseStatusCode,_that.responseBody,_that.externalServiceUrl,_that.externalServiceRequestBody,_that.externalServiceResponseBody,_that.externalServiceResponseStatus,_that.externalServiceResponseTime,_that.tokensActuallyCharged,_that.tokensReportedByService,_that.errorType,_that.errorMessage,_that.duration,_that.createdAt,_that.completedAt,_that.externalServiceRequestSize,_that.externalServiceResponseSize);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'certificate_id')  int? certificateId, @JsonKey(name: 'certificate_name', includeToJson: false)  String certificateName, @JsonKey(name: 'base_id')  int? baseId, @JsonKey(name: 'base_dbname', includeToJson: false)  String baseName, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName, @JsonKey(name: 'ip_address')  String ipAddress, @JsonKey(name: 'request_method')  String requestMethod, @JsonKey(name: 'request_path')  String requestPath, @JsonKey(name: 'request_body')  String requestBody, @JsonKey(name: 'response_status_code')  int responseStatusCode, @JsonKey(name: 'response_body')  String responseBody, @JsonKey(name: 'external_service_url')  String externalServiceUrl, @JsonKey(name: 'external_service_request_body')  String externalServiceRequestBody, @JsonKey(name: 'external_service_response_body')  String externalServiceResponseBody, @JsonKey(name: 'external_service_response_status')  int externalServiceResponseStatus, @JsonKey(name: 'external_service_response_time_ms')  int externalServiceResponseTime, @JsonKey(name: 'tokens_actually_charged')  int tokensActuallyCharged, @JsonKey(name: 'tokens_reported_by_service')  int tokensReportedByService, @JsonKey(name: 'error_type')  LogErrorType errorType, @JsonKey(name: 'error_message')  String errorMessage, @JsonKey(name: 'duration_ms')  int duration, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'external_service_request_size')  int externalServiceRequestSize, @JsonKey(name: 'external_service_response_size')  int externalServiceResponseSize)?  $default,) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.id,_that.certificateId,_that.certificateName,_that.baseId,_that.baseName,_that.productId,_that.productName,_that.ipAddress,_that.requestMethod,_that.requestPath,_that.requestBody,_that.responseStatusCode,_that.responseBody,_that.externalServiceUrl,_that.externalServiceRequestBody,_that.externalServiceResponseBody,_that.externalServiceResponseStatus,_that.externalServiceResponseTime,_that.tokensActuallyCharged,_that.tokensReportedByService,_that.errorType,_that.errorMessage,_that.duration,_that.createdAt,_that.completedAt,_that.externalServiceRequestSize,_that.externalServiceResponseSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Log extends Log {
  const _Log({this.id, @JsonKey(name: 'certificate_id') this.certificateId, @JsonKey(name: 'certificate_name', includeToJson: false) this.certificateName = "", @JsonKey(name: 'base_id') this.baseId, @JsonKey(name: 'base_dbname', includeToJson: false) this.baseName = "", @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_name', includeToJson: false) this.productName = "", @JsonKey(name: 'ip_address') this.ipAddress = "", @JsonKey(name: 'request_method') this.requestMethod = "", @JsonKey(name: 'request_path') this.requestPath = "", @JsonKey(name: 'request_body') this.requestBody = "", @JsonKey(name: 'response_status_code') this.responseStatusCode = 0, @JsonKey(name: 'response_body') this.responseBody = "", @JsonKey(name: 'external_service_url') this.externalServiceUrl = "", @JsonKey(name: 'external_service_request_body') this.externalServiceRequestBody = "", @JsonKey(name: 'external_service_response_body') this.externalServiceResponseBody = "", @JsonKey(name: 'external_service_response_status') this.externalServiceResponseStatus = 0, @JsonKey(name: 'external_service_response_time_ms') this.externalServiceResponseTime = 0, @JsonKey(name: 'tokens_actually_charged') this.tokensActuallyCharged = 0, @JsonKey(name: 'tokens_reported_by_service') this.tokensReportedByService = 0, @JsonKey(name: 'error_type') this.errorType = LogErrorType.none, @JsonKey(name: 'error_message') this.errorMessage = "", @JsonKey(name: 'duration_ms') this.duration = 0, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'external_service_request_size') this.externalServiceRequestSize = 0, @JsonKey(name: 'external_service_response_size') this.externalServiceResponseSize = 0}): super._();
  factory _Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'certificate_id') final  int? certificateId;
@override@JsonKey(name: 'certificate_name', includeToJson: false) final  String certificateName;
@override@JsonKey(name: 'base_id') final  int? baseId;
@override@JsonKey(name: 'base_dbname', includeToJson: false) final  String baseName;
@override@JsonKey(name: 'product_id') final  int? productId;
@override@JsonKey(name: 'product_name', includeToJson: false) final  String productName;
@override@JsonKey(name: 'ip_address') final  String ipAddress;
@override@JsonKey(name: 'request_method') final  String requestMethod;
@override@JsonKey(name: 'request_path') final  String requestPath;
@override@JsonKey(name: 'request_body') final  String requestBody;
@override@JsonKey(name: 'response_status_code') final  int responseStatusCode;
@override@JsonKey(name: 'response_body') final  String responseBody;
@override@JsonKey(name: 'external_service_url') final  String externalServiceUrl;
@override@JsonKey(name: 'external_service_request_body') final  String externalServiceRequestBody;
@override@JsonKey(name: 'external_service_response_body') final  String externalServiceResponseBody;
@override@JsonKey(name: 'external_service_response_status') final  int externalServiceResponseStatus;
@override@JsonKey(name: 'external_service_response_time_ms') final  int externalServiceResponseTime;
@override@JsonKey(name: 'tokens_actually_charged') final  int tokensActuallyCharged;
@override@JsonKey(name: 'tokens_reported_by_service') final  int tokensReportedByService;
@override@JsonKey(name: 'error_type') final  LogErrorType errorType;
@override@JsonKey(name: 'error_message') final  String errorMessage;
@override@JsonKey(name: 'duration_ms') final  int duration;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'external_service_request_size') final  int externalServiceRequestSize;
@override@JsonKey(name: 'external_service_response_size') final  int externalServiceResponseSize;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogCopyWith<_Log> get copyWith => __$LogCopyWithImpl<_Log>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Log&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.certificateName, certificateName) || other.certificateName == certificateName)&&(identical(other.baseId, baseId) || other.baseId == baseId)&&(identical(other.baseName, baseName) || other.baseName == baseName)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.requestMethod, requestMethod) || other.requestMethod == requestMethod)&&(identical(other.requestPath, requestPath) || other.requestPath == requestPath)&&(identical(other.requestBody, requestBody) || other.requestBody == requestBody)&&(identical(other.responseStatusCode, responseStatusCode) || other.responseStatusCode == responseStatusCode)&&(identical(other.responseBody, responseBody) || other.responseBody == responseBody)&&(identical(other.externalServiceUrl, externalServiceUrl) || other.externalServiceUrl == externalServiceUrl)&&(identical(other.externalServiceRequestBody, externalServiceRequestBody) || other.externalServiceRequestBody == externalServiceRequestBody)&&(identical(other.externalServiceResponseBody, externalServiceResponseBody) || other.externalServiceResponseBody == externalServiceResponseBody)&&(identical(other.externalServiceResponseStatus, externalServiceResponseStatus) || other.externalServiceResponseStatus == externalServiceResponseStatus)&&(identical(other.externalServiceResponseTime, externalServiceResponseTime) || other.externalServiceResponseTime == externalServiceResponseTime)&&(identical(other.tokensActuallyCharged, tokensActuallyCharged) || other.tokensActuallyCharged == tokensActuallyCharged)&&(identical(other.tokensReportedByService, tokensReportedByService) || other.tokensReportedByService == tokensReportedByService)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.externalServiceRequestSize, externalServiceRequestSize) || other.externalServiceRequestSize == externalServiceRequestSize)&&(identical(other.externalServiceResponseSize, externalServiceResponseSize) || other.externalServiceResponseSize == externalServiceResponseSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,certificateId,certificateName,baseId,baseName,productId,productName,ipAddress,requestMethod,requestPath,requestBody,responseStatusCode,responseBody,externalServiceUrl,externalServiceRequestBody,externalServiceResponseBody,externalServiceResponseStatus,externalServiceResponseTime,tokensActuallyCharged,tokensReportedByService,errorType,errorMessage,duration,createdAt,completedAt,externalServiceRequestSize,externalServiceResponseSize]);

@override
String toString() {
  return 'Log(id: $id, certificateId: $certificateId, certificateName: $certificateName, baseId: $baseId, baseName: $baseName, productId: $productId, productName: $productName, ipAddress: $ipAddress, requestMethod: $requestMethod, requestPath: $requestPath, requestBody: $requestBody, responseStatusCode: $responseStatusCode, responseBody: $responseBody, externalServiceUrl: $externalServiceUrl, externalServiceRequestBody: $externalServiceRequestBody, externalServiceResponseBody: $externalServiceResponseBody, externalServiceResponseStatus: $externalServiceResponseStatus, externalServiceResponseTime: $externalServiceResponseTime, tokensActuallyCharged: $tokensActuallyCharged, tokensReportedByService: $tokensReportedByService, errorType: $errorType, errorMessage: $errorMessage, duration: $duration, createdAt: $createdAt, completedAt: $completedAt, externalServiceRequestSize: $externalServiceRequestSize, externalServiceResponseSize: $externalServiceResponseSize)';
}


}

/// @nodoc
abstract mixin class _$LogCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$LogCopyWith(_Log value, $Res Function(_Log) _then) = __$LogCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_id') int? certificateId,@JsonKey(name: 'certificate_name', includeToJson: false) String certificateName,@JsonKey(name: 'base_id') int? baseId,@JsonKey(name: 'base_dbname', includeToJson: false) String baseName,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'product_name', includeToJson: false) String productName,@JsonKey(name: 'ip_address') String ipAddress,@JsonKey(name: 'request_method') String requestMethod,@JsonKey(name: 'request_path') String requestPath,@JsonKey(name: 'request_body') String requestBody,@JsonKey(name: 'response_status_code') int responseStatusCode,@JsonKey(name: 'response_body') String responseBody,@JsonKey(name: 'external_service_url') String externalServiceUrl,@JsonKey(name: 'external_service_request_body') String externalServiceRequestBody,@JsonKey(name: 'external_service_response_body') String externalServiceResponseBody,@JsonKey(name: 'external_service_response_status') int externalServiceResponseStatus,@JsonKey(name: 'external_service_response_time_ms') int externalServiceResponseTime,@JsonKey(name: 'tokens_actually_charged') int tokensActuallyCharged,@JsonKey(name: 'tokens_reported_by_service') int tokensReportedByService,@JsonKey(name: 'error_type') LogErrorType errorType,@JsonKey(name: 'error_message') String errorMessage,@JsonKey(name: 'duration_ms') int duration,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'external_service_request_size') int externalServiceRequestSize,@JsonKey(name: 'external_service_response_size') int externalServiceResponseSize
});




}
/// @nodoc
class __$LogCopyWithImpl<$Res>
    implements _$LogCopyWith<$Res> {
  __$LogCopyWithImpl(this._self, this._then);

  final _Log _self;
  final $Res Function(_Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? certificateId = freezed,Object? certificateName = null,Object? baseId = freezed,Object? baseName = null,Object? productId = freezed,Object? productName = null,Object? ipAddress = null,Object? requestMethod = null,Object? requestPath = null,Object? requestBody = null,Object? responseStatusCode = null,Object? responseBody = null,Object? externalServiceUrl = null,Object? externalServiceRequestBody = null,Object? externalServiceResponseBody = null,Object? externalServiceResponseStatus = null,Object? externalServiceResponseTime = null,Object? tokensActuallyCharged = null,Object? tokensReportedByService = null,Object? errorType = null,Object? errorMessage = null,Object? duration = null,Object? createdAt = null,Object? completedAt = freezed,Object? externalServiceRequestSize = null,Object? externalServiceResponseSize = null,}) {
  return _then(_Log(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateId: freezed == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int?,certificateName: null == certificateName ? _self.certificateName : certificateName // ignore: cast_nullable_to_non_nullable
as String,baseId: freezed == baseId ? _self.baseId : baseId // ignore: cast_nullable_to_non_nullable
as int?,baseName: null == baseName ? _self.baseName : baseName // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,requestMethod: null == requestMethod ? _self.requestMethod : requestMethod // ignore: cast_nullable_to_non_nullable
as String,requestPath: null == requestPath ? _self.requestPath : requestPath // ignore: cast_nullable_to_non_nullable
as String,requestBody: null == requestBody ? _self.requestBody : requestBody // ignore: cast_nullable_to_non_nullable
as String,responseStatusCode: null == responseStatusCode ? _self.responseStatusCode : responseStatusCode // ignore: cast_nullable_to_non_nullable
as int,responseBody: null == responseBody ? _self.responseBody : responseBody // ignore: cast_nullable_to_non_nullable
as String,externalServiceUrl: null == externalServiceUrl ? _self.externalServiceUrl : externalServiceUrl // ignore: cast_nullable_to_non_nullable
as String,externalServiceRequestBody: null == externalServiceRequestBody ? _self.externalServiceRequestBody : externalServiceRequestBody // ignore: cast_nullable_to_non_nullable
as String,externalServiceResponseBody: null == externalServiceResponseBody ? _self.externalServiceResponseBody : externalServiceResponseBody // ignore: cast_nullable_to_non_nullable
as String,externalServiceResponseStatus: null == externalServiceResponseStatus ? _self.externalServiceResponseStatus : externalServiceResponseStatus // ignore: cast_nullable_to_non_nullable
as int,externalServiceResponseTime: null == externalServiceResponseTime ? _self.externalServiceResponseTime : externalServiceResponseTime // ignore: cast_nullable_to_non_nullable
as int,tokensActuallyCharged: null == tokensActuallyCharged ? _self.tokensActuallyCharged : tokensActuallyCharged // ignore: cast_nullable_to_non_nullable
as int,tokensReportedByService: null == tokensReportedByService ? _self.tokensReportedByService : tokensReportedByService // ignore: cast_nullable_to_non_nullable
as int,errorType: null == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as LogErrorType,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,externalServiceRequestSize: null == externalServiceRequestSize ? _self.externalServiceRequestSize : externalServiceRequestSize // ignore: cast_nullable_to_non_nullable
as int,externalServiceResponseSize: null == externalServiceResponseSize ? _self.externalServiceResponseSize : externalServiceResponseSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
