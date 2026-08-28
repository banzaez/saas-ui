// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyReferral {

 int get id;@JsonKey(name: 'display_name') String get displayName; String? get guid;
/// Create a copy of CompanyReferral
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyReferralCopyWith<CompanyReferral> get copyWith => _$CompanyReferralCopyWithImpl<CompanyReferral>(this as CompanyReferral, _$identity);

  /// Serializes this CompanyReferral to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyReferral&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.guid, guid) || other.guid == guid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,guid);

@override
String toString() {
  return 'CompanyReferral(id: $id, displayName: $displayName, guid: $guid)';
}


}

/// @nodoc
abstract mixin class $CompanyReferralCopyWith<$Res>  {
  factory $CompanyReferralCopyWith(CompanyReferral value, $Res Function(CompanyReferral) _then) = _$CompanyReferralCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'display_name') String displayName, String? guid
});




}
/// @nodoc
class _$CompanyReferralCopyWithImpl<$Res>
    implements $CompanyReferralCopyWith<$Res> {
  _$CompanyReferralCopyWithImpl(this._self, this._then);

  final CompanyReferral _self;
  final $Res Function(CompanyReferral) _then;

/// Create a copy of CompanyReferral
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? displayName = null,Object? guid = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyReferral].
extension CompanyReferralPatterns on CompanyReferral {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyReferral value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyReferral() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyReferral value)  $default,){
final _that = this;
switch (_that) {
case _CompanyReferral():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyReferral value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyReferral() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'display_name')  String displayName,  String? guid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyReferral() when $default != null:
return $default(_that.id,_that.displayName,_that.guid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'display_name')  String displayName,  String? guid)  $default,) {final _that = this;
switch (_that) {
case _CompanyReferral():
return $default(_that.id,_that.displayName,_that.guid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'display_name')  String displayName,  String? guid)?  $default,) {final _that = this;
switch (_that) {
case _CompanyReferral() when $default != null:
return $default(_that.id,_that.displayName,_that.guid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyReferral implements CompanyReferral {
  const _CompanyReferral({required this.id, @JsonKey(name: 'display_name') required this.displayName, this.guid});
  factory _CompanyReferral.fromJson(Map<String, dynamic> json) => _$CompanyReferralFromJson(json);

@override final  int id;
@override@JsonKey(name: 'display_name') final  String displayName;
@override final  String? guid;

/// Create a copy of CompanyReferral
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyReferralCopyWith<_CompanyReferral> get copyWith => __$CompanyReferralCopyWithImpl<_CompanyReferral>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyReferralToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyReferral&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.guid, guid) || other.guid == guid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,displayName,guid);

@override
String toString() {
  return 'CompanyReferral(id: $id, displayName: $displayName, guid: $guid)';
}


}

/// @nodoc
abstract mixin class _$CompanyReferralCopyWith<$Res> implements $CompanyReferralCopyWith<$Res> {
  factory _$CompanyReferralCopyWith(_CompanyReferral value, $Res Function(_CompanyReferral) _then) = __$CompanyReferralCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'display_name') String displayName, String? guid
});




}
/// @nodoc
class __$CompanyReferralCopyWithImpl<$Res>
    implements _$CompanyReferralCopyWith<$Res> {
  __$CompanyReferralCopyWithImpl(this._self, this._then);

  final _CompanyReferral _self;
  final $Res Function(_CompanyReferral) _then;

/// Create a copy of CompanyReferral
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? displayName = null,Object? guid = freezed,}) {
  return _then(_CompanyReferral(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,guid: freezed == guid ? _self.guid : guid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
