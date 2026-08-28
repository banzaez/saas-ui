// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthUiState {

 bool get isLogin; bool get isForgotPassword;
/// Create a copy of AuthUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUiStateCopyWith<AuthUiState> get copyWith => _$AuthUiStateCopyWithImpl<AuthUiState>(this as AuthUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUiState&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isForgotPassword, isForgotPassword) || other.isForgotPassword == isForgotPassword));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,isForgotPassword);

@override
String toString() {
  return 'AuthUiState(isLogin: $isLogin, isForgotPassword: $isForgotPassword)';
}


}

/// @nodoc
abstract mixin class $AuthUiStateCopyWith<$Res>  {
  factory $AuthUiStateCopyWith(AuthUiState value, $Res Function(AuthUiState) _then) = _$AuthUiStateCopyWithImpl;
@useResult
$Res call({
 bool isLogin, bool isForgotPassword
});




}
/// @nodoc
class _$AuthUiStateCopyWithImpl<$Res>
    implements $AuthUiStateCopyWith<$Res> {
  _$AuthUiStateCopyWithImpl(this._self, this._then);

  final AuthUiState _self;
  final $Res Function(AuthUiState) _then;

/// Create a copy of AuthUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLogin = null,Object? isForgotPassword = null,}) {
  return _then(_self.copyWith(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isForgotPassword: null == isForgotPassword ? _self.isForgotPassword : isForgotPassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUiState].
extension AuthUiStatePatterns on AuthUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUiState value)  $default,){
final _that = this;
switch (_that) {
case _AuthUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUiState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLogin,  bool isForgotPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUiState() when $default != null:
return $default(_that.isLogin,_that.isForgotPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLogin,  bool isForgotPassword)  $default,) {final _that = this;
switch (_that) {
case _AuthUiState():
return $default(_that.isLogin,_that.isForgotPassword);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLogin,  bool isForgotPassword)?  $default,) {final _that = this;
switch (_that) {
case _AuthUiState() when $default != null:
return $default(_that.isLogin,_that.isForgotPassword);case _:
  return null;

}
}

}

/// @nodoc


class _AuthUiState implements AuthUiState {
  const _AuthUiState({this.isLogin = true, this.isForgotPassword = false});
  

@override@JsonKey() final  bool isLogin;
@override@JsonKey() final  bool isForgotPassword;

/// Create a copy of AuthUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUiStateCopyWith<_AuthUiState> get copyWith => __$AuthUiStateCopyWithImpl<_AuthUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUiState&&(identical(other.isLogin, isLogin) || other.isLogin == isLogin)&&(identical(other.isForgotPassword, isForgotPassword) || other.isForgotPassword == isForgotPassword));
}


@override
int get hashCode => Object.hash(runtimeType,isLogin,isForgotPassword);

@override
String toString() {
  return 'AuthUiState(isLogin: $isLogin, isForgotPassword: $isForgotPassword)';
}


}

/// @nodoc
abstract mixin class _$AuthUiStateCopyWith<$Res> implements $AuthUiStateCopyWith<$Res> {
  factory _$AuthUiStateCopyWith(_AuthUiState value, $Res Function(_AuthUiState) _then) = __$AuthUiStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLogin, bool isForgotPassword
});




}
/// @nodoc
class __$AuthUiStateCopyWithImpl<$Res>
    implements _$AuthUiStateCopyWith<$Res> {
  __$AuthUiStateCopyWithImpl(this._self, this._then);

  final _AuthUiState _self;
  final $Res Function(_AuthUiState) _then;

/// Create a copy of AuthUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLogin = null,Object? isForgotPassword = null,}) {
  return _then(_AuthUiState(
isLogin: null == isLogin ? _self.isLogin : isLogin // ignore: cast_nullable_to_non_nullable
as bool,isForgotPassword: null == isForgotPassword ? _self.isForgotPassword : isForgotPassword // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
