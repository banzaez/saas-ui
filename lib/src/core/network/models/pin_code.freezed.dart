// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PinCode {

 int? get id;@JsonKey(name: 'company_id') int get companyId;@JsonKey(name: 'certificate_id') int get certificateId;@JsonKey(name: 'certificate_item_id') int get certificateItemId; String get code; PinCodeStatus get status; String get key;@JsonKey(name: 'activated_at') DateTime? get activatedAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of PinCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinCodeCopyWith<PinCode> get copyWith => _$PinCodeCopyWithImpl<PinCode>(this as PinCode, _$identity);

  /// Serializes this PinCode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinCode&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.key, key) || other.key == key)&&(identical(other.activatedAt, activatedAt) || other.activatedAt == activatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,certificateId,certificateItemId,code,status,key,activatedAt,expiresAt,createdAt);

@override
String toString() {
  return 'PinCode(id: $id, companyId: $companyId, certificateId: $certificateId, certificateItemId: $certificateItemId, code: $code, status: $status, key: $key, activatedAt: $activatedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PinCodeCopyWith<$Res>  {
  factory $PinCodeCopyWith(PinCode value, $Res Function(PinCode) _then) = _$PinCodeCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'certificate_id') int certificateId,@JsonKey(name: 'certificate_item_id') int certificateItemId, String code, PinCodeStatus status, String key,@JsonKey(name: 'activated_at') DateTime? activatedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$PinCodeCopyWithImpl<$Res>
    implements $PinCodeCopyWith<$Res> {
  _$PinCodeCopyWithImpl(this._self, this._then);

  final PinCode _self;
  final $Res Function(PinCode) _then;

/// Create a copy of PinCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyId = null,Object? certificateId = null,Object? certificateItemId = null,Object? code = null,Object? status = null,Object? key = null,Object? activatedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,certificateId: null == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PinCodeStatus,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PinCode].
extension PinCodePatterns on PinCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinCode value)  $default,){
final _that = this;
switch (_that) {
case _PinCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinCode value)?  $default,){
final _that = this;
switch (_that) {
case _PinCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'certificate_item_id')  int certificateItemId,  String code,  PinCodeStatus status,  String key, @JsonKey(name: 'activated_at')  DateTime? activatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinCode() when $default != null:
return $default(_that.id,_that.companyId,_that.certificateId,_that.certificateItemId,_that.code,_that.status,_that.key,_that.activatedAt,_that.expiresAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'certificate_item_id')  int certificateItemId,  String code,  PinCodeStatus status,  String key, @JsonKey(name: 'activated_at')  DateTime? activatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PinCode():
return $default(_that.id,_that.companyId,_that.certificateId,_that.certificateItemId,_that.code,_that.status,_that.key,_that.activatedAt,_that.expiresAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'certificate_item_id')  int certificateItemId,  String code,  PinCodeStatus status,  String key, @JsonKey(name: 'activated_at')  DateTime? activatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PinCode() when $default != null:
return $default(_that.id,_that.companyId,_that.certificateId,_that.certificateItemId,_that.code,_that.status,_that.key,_that.activatedAt,_that.expiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PinCode extends PinCode {
  const _PinCode({this.id, @JsonKey(name: 'company_id') this.companyId = 0, @JsonKey(name: 'certificate_id') this.certificateId = 0, @JsonKey(name: 'certificate_item_id') this.certificateItemId = 0, this.code = "", this.status = PinCodeStatus.created, this.key = "", @JsonKey(name: 'activated_at') this.activatedAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _PinCode.fromJson(Map<String, dynamic> json) => _$PinCodeFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'company_id') final  int companyId;
@override@JsonKey(name: 'certificate_id') final  int certificateId;
@override@JsonKey(name: 'certificate_item_id') final  int certificateItemId;
@override@JsonKey() final  String code;
@override@JsonKey() final  PinCodeStatus status;
@override@JsonKey() final  String key;
@override@JsonKey(name: 'activated_at') final  DateTime? activatedAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of PinCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinCodeCopyWith<_PinCode> get copyWith => __$PinCodeCopyWithImpl<_PinCode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PinCodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinCode&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.key, key) || other.key == key)&&(identical(other.activatedAt, activatedAt) || other.activatedAt == activatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,certificateId,certificateItemId,code,status,key,activatedAt,expiresAt,createdAt);

@override
String toString() {
  return 'PinCode(id: $id, companyId: $companyId, certificateId: $certificateId, certificateItemId: $certificateItemId, code: $code, status: $status, key: $key, activatedAt: $activatedAt, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PinCodeCopyWith<$Res> implements $PinCodeCopyWith<$Res> {
  factory _$PinCodeCopyWith(_PinCode value, $Res Function(_PinCode) _then) = __$PinCodeCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'certificate_id') int certificateId,@JsonKey(name: 'certificate_item_id') int certificateItemId, String code, PinCodeStatus status, String key,@JsonKey(name: 'activated_at') DateTime? activatedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$PinCodeCopyWithImpl<$Res>
    implements _$PinCodeCopyWith<$Res> {
  __$PinCodeCopyWithImpl(this._self, this._then);

  final _PinCode _self;
  final $Res Function(_PinCode) _then;

/// Create a copy of PinCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyId = null,Object? certificateId = null,Object? certificateItemId = null,Object? code = null,Object? status = null,Object? key = null,Object? activatedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,}) {
  return _then(_PinCode(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,certificateId: null == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PinCodeStatus,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
