// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Company {

 int? get id;@JsonKey(name: 'display_name') String get displayName; CompanyStatus get status;@JsonKey(name: 'package_id') int? get packageId; String get guid;@JsonKey(name: 'referral_code') String? get referralCode;@JsonKey(name: 'referrals') List<CompanyReferral>? get referrals;@JsonKey(name: 'sdelkabiz_id') int? get sdelkabizId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'mystock_account_id') String? get mystockAccountId;
/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCopyWith<Company> get copyWith => _$CompanyCopyWithImpl<Company>(this as Company, _$identity);

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Company&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.status, status) || other.status == status)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other.referrals, referrals)&&(identical(other.sdelkabizId, sdelkabizId) || other.sdelkabizId == sdelkabizId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.mystockAccountId, mystockAccountId) || other.mystockAccountId == mystockAccountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,status,packageId,guid,referralCode,const DeepCollectionEquality().hash(referrals),sdelkabizId,createdAt,mystockAccountId);

@override
String toString() {
  return 'Company(id: $id, displayName: $displayName, status: $status, packageId: $packageId, guid: $guid, referralCode: $referralCode, referrals: $referrals, sdelkabizId: $sdelkabizId, createdAt: $createdAt, mystockAccountId: $mystockAccountId)';
}


}

/// @nodoc
abstract mixin class $CompanyCopyWith<$Res>  {
  factory $CompanyCopyWith(Company value, $Res Function(Company) _then) = _$CompanyCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'display_name') String displayName, CompanyStatus status,@JsonKey(name: 'package_id') int? packageId, String guid,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'referrals') List<CompanyReferral>? referrals,@JsonKey(name: 'sdelkabiz_id') int? sdelkabizId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'mystock_account_id') String? mystockAccountId
});




}
/// @nodoc
class _$CompanyCopyWithImpl<$Res>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._self, this._then);

  final Company _self;
  final $Res Function(Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? displayName = null,Object? status = null,Object? packageId = freezed,Object? guid = null,Object? referralCode = freezed,Object? referrals = freezed,Object? sdelkabizId = freezed,Object? createdAt = freezed,Object? mystockAccountId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CompanyStatus,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,guid: null == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,referrals: freezed == referrals ? _self.referrals : referrals // ignore: cast_nullable_to_non_nullable
as List<CompanyReferral>?,sdelkabizId: freezed == sdelkabizId ? _self.sdelkabizId : sdelkabizId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,mystockAccountId: freezed == mystockAccountId ? _self.mystockAccountId : mystockAccountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Company].
extension CompanyPatterns on Company {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Company value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Company value)  $default,){
final _that = this;
switch (_that) {
case _Company():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Company value)?  $default,){
final _that = this;
switch (_that) {
case _Company() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'display_name')  String displayName,  CompanyStatus status, @JsonKey(name: 'package_id')  int? packageId,  String guid, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'referrals')  List<CompanyReferral>? referrals, @JsonKey(name: 'sdelkabiz_id')  int? sdelkabizId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'mystock_account_id')  String? mystockAccountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.displayName,_that.status,_that.packageId,_that.guid,_that.referralCode,_that.referrals,_that.sdelkabizId,_that.createdAt,_that.mystockAccountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'display_name')  String displayName,  CompanyStatus status, @JsonKey(name: 'package_id')  int? packageId,  String guid, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'referrals')  List<CompanyReferral>? referrals, @JsonKey(name: 'sdelkabiz_id')  int? sdelkabizId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'mystock_account_id')  String? mystockAccountId)  $default,) {final _that = this;
switch (_that) {
case _Company():
return $default(_that.id,_that.displayName,_that.status,_that.packageId,_that.guid,_that.referralCode,_that.referrals,_that.sdelkabizId,_that.createdAt,_that.mystockAccountId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'display_name')  String displayName,  CompanyStatus status, @JsonKey(name: 'package_id')  int? packageId,  String guid, @JsonKey(name: 'referral_code')  String? referralCode, @JsonKey(name: 'referrals')  List<CompanyReferral>? referrals, @JsonKey(name: 'sdelkabiz_id')  int? sdelkabizId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'mystock_account_id')  String? mystockAccountId)?  $default,) {final _that = this;
switch (_that) {
case _Company() when $default != null:
return $default(_that.id,_that.displayName,_that.status,_that.packageId,_that.guid,_that.referralCode,_that.referrals,_that.sdelkabizId,_that.createdAt,_that.mystockAccountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Company extends Company {
  const _Company({this.id, @JsonKey(name: 'display_name') this.displayName = "", this.status = CompanyStatus.active, @JsonKey(name: 'package_id') this.packageId, this.guid = "", @JsonKey(name: 'referral_code') this.referralCode, @JsonKey(name: 'referrals') final  List<CompanyReferral>? referrals, @JsonKey(name: 'sdelkabiz_id') this.sdelkabizId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'mystock_account_id') this.mystockAccountId}): _referrals = referrals,super._();
  factory _Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'display_name') final  String displayName;
@override@JsonKey() final  CompanyStatus status;
@override@JsonKey(name: 'package_id') final  int? packageId;
@override@JsonKey() final  String guid;
@override@JsonKey(name: 'referral_code') final  String? referralCode;
 final  List<CompanyReferral>? _referrals;
@override@JsonKey(name: 'referrals') List<CompanyReferral>? get referrals {
  final value = _referrals;
  if (value == null) return null;
  if (_referrals is EqualUnmodifiableListView) return _referrals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'sdelkabiz_id') final  int? sdelkabizId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'mystock_account_id') final  String? mystockAccountId;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCopyWith<_Company> get copyWith => __$CompanyCopyWithImpl<_Company>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Company&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.status, status) || other.status == status)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.guid, guid) || other.guid == guid)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other._referrals, _referrals)&&(identical(other.sdelkabizId, sdelkabizId) || other.sdelkabizId == sdelkabizId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.mystockAccountId, mystockAccountId) || other.mystockAccountId == mystockAccountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,status,packageId,guid,referralCode,const DeepCollectionEquality().hash(_referrals),sdelkabizId,createdAt,mystockAccountId);

@override
String toString() {
  return 'Company(id: $id, displayName: $displayName, status: $status, packageId: $packageId, guid: $guid, referralCode: $referralCode, referrals: $referrals, sdelkabizId: $sdelkabizId, createdAt: $createdAt, mystockAccountId: $mystockAccountId)';
}


}

/// @nodoc
abstract mixin class _$CompanyCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$CompanyCopyWith(_Company value, $Res Function(_Company) _then) = __$CompanyCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'display_name') String displayName, CompanyStatus status,@JsonKey(name: 'package_id') int? packageId, String guid,@JsonKey(name: 'referral_code') String? referralCode,@JsonKey(name: 'referrals') List<CompanyReferral>? referrals,@JsonKey(name: 'sdelkabiz_id') int? sdelkabizId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'mystock_account_id') String? mystockAccountId
});




}
/// @nodoc
class __$CompanyCopyWithImpl<$Res>
    implements _$CompanyCopyWith<$Res> {
  __$CompanyCopyWithImpl(this._self, this._then);

  final _Company _self;
  final $Res Function(_Company) _then;

/// Create a copy of Company
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? displayName = null,Object? status = null,Object? packageId = freezed,Object? guid = null,Object? referralCode = freezed,Object? referrals = freezed,Object? sdelkabizId = freezed,Object? createdAt = freezed,Object? mystockAccountId = freezed,}) {
  return _then(_Company(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CompanyStatus,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,guid: null == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String,referralCode: freezed == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String?,referrals: freezed == referrals ? _self._referrals : referrals // ignore: cast_nullable_to_non_nullable
as List<CompanyReferral>?,sdelkabizId: freezed == sdelkabizId ? _self.sdelkabizId : sdelkabizId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,mystockAccountId: freezed == mystockAccountId ? _self.mystockAccountId : mystockAccountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
