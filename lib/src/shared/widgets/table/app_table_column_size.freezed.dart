// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_table_column_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppTableColumnSize {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppTableColumnSize);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTableColumnSize()';
}


}

/// @nodoc
class $AppTableColumnSizeCopyWith<$Res>  {
$AppTableColumnSizeCopyWith(AppTableColumnSize _, $Res Function(AppTableColumnSize) __);
}


/// Adds pattern-matching-related methods to [AppTableColumnSize].
extension AppTableColumnSizePatterns on AppTableColumnSize {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Fixed value)?  fixed,TResult Function( _Flex value)?  flex,TResult Function( _Content value)?  content,TResult Function( _Id value)?  id,TResult Function( _Date value)?  date,TResult Function( _Actions value)?  actions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fixed() when fixed != null:
return fixed(_that);case _Flex() when flex != null:
return flex(_that);case _Content() when content != null:
return content(_that);case _Id() when id != null:
return id(_that);case _Date() when date != null:
return date(_that);case _Actions() when actions != null:
return actions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Fixed value)  fixed,required TResult Function( _Flex value)  flex,required TResult Function( _Content value)  content,required TResult Function( _Id value)  id,required TResult Function( _Date value)  date,required TResult Function( _Actions value)  actions,}){
final _that = this;
switch (_that) {
case _Fixed():
return fixed(_that);case _Flex():
return flex(_that);case _Content():
return content(_that);case _Id():
return id(_that);case _Date():
return date(_that);case _Actions():
return actions(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Fixed value)?  fixed,TResult? Function( _Flex value)?  flex,TResult? Function( _Content value)?  content,TResult? Function( _Id value)?  id,TResult? Function( _Date value)?  date,TResult? Function( _Actions value)?  actions,}){
final _that = this;
switch (_that) {
case _Fixed() when fixed != null:
return fixed(_that);case _Flex() when flex != null:
return flex(_that);case _Content() when content != null:
return content(_that);case _Id() when id != null:
return id(_that);case _Date() when date != null:
return date(_that);case _Actions() when actions != null:
return actions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double width)?  fixed,TResult Function( int value)?  flex,TResult Function()?  content,TResult Function()?  id,TResult Function()?  date,TResult Function()?  actions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fixed() when fixed != null:
return fixed(_that.width);case _Flex() when flex != null:
return flex(_that.value);case _Content() when content != null:
return content();case _Id() when id != null:
return id();case _Date() when date != null:
return date();case _Actions() when actions != null:
return actions();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double width)  fixed,required TResult Function( int value)  flex,required TResult Function()  content,required TResult Function()  id,required TResult Function()  date,required TResult Function()  actions,}) {final _that = this;
switch (_that) {
case _Fixed():
return fixed(_that.width);case _Flex():
return flex(_that.value);case _Content():
return content();case _Id():
return id();case _Date():
return date();case _Actions():
return actions();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double width)?  fixed,TResult? Function( int value)?  flex,TResult? Function()?  content,TResult? Function()?  id,TResult? Function()?  date,TResult? Function()?  actions,}) {final _that = this;
switch (_that) {
case _Fixed() when fixed != null:
return fixed(_that.width);case _Flex() when flex != null:
return flex(_that.value);case _Content() when content != null:
return content();case _Id() when id != null:
return id();case _Date() when date != null:
return date();case _Actions() when actions != null:
return actions();case _:
  return null;

}
}

}

/// @nodoc


class _Fixed implements AppTableColumnSize {
  const _Fixed(this.width);
  

 final  double width;

/// Create a copy of AppTableColumnSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FixedCopyWith<_Fixed> get copyWith => __$FixedCopyWithImpl<_Fixed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fixed&&(identical(other.width, width) || other.width == width));
}


@override
int get hashCode => Object.hash(runtimeType,width);

@override
String toString() {
  return 'AppTableColumnSize.fixed(width: $width)';
}


}

/// @nodoc
abstract mixin class _$FixedCopyWith<$Res> implements $AppTableColumnSizeCopyWith<$Res> {
  factory _$FixedCopyWith(_Fixed value, $Res Function(_Fixed) _then) = __$FixedCopyWithImpl;
@useResult
$Res call({
 double width
});




}
/// @nodoc
class __$FixedCopyWithImpl<$Res>
    implements _$FixedCopyWith<$Res> {
  __$FixedCopyWithImpl(this._self, this._then);

  final _Fixed _self;
  final $Res Function(_Fixed) _then;

/// Create a copy of AppTableColumnSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? width = null,}) {
  return _then(_Fixed(
null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Flex implements AppTableColumnSize {
  const _Flex([this.value = 1]);
  

@JsonKey() final  int value;

/// Create a copy of AppTableColumnSize
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlexCopyWith<_Flex> get copyWith => __$FlexCopyWithImpl<_Flex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flex&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'AppTableColumnSize.flex(value: $value)';
}


}

/// @nodoc
abstract mixin class _$FlexCopyWith<$Res> implements $AppTableColumnSizeCopyWith<$Res> {
  factory _$FlexCopyWith(_Flex value, $Res Function(_Flex) _then) = __$FlexCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class __$FlexCopyWithImpl<$Res>
    implements _$FlexCopyWith<$Res> {
  __$FlexCopyWithImpl(this._self, this._then);

  final _Flex _self;
  final $Res Function(_Flex) _then;

/// Create a copy of AppTableColumnSize
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_Flex(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Content implements AppTableColumnSize {
  const _Content();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Content);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTableColumnSize.content()';
}


}




/// @nodoc


class _Id implements AppTableColumnSize {
  const _Id();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Id);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTableColumnSize.id()';
}


}




/// @nodoc


class _Date implements AppTableColumnSize {
  const _Date();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Date);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTableColumnSize.date()';
}


}




/// @nodoc


class _Actions implements AppTableColumnSize {
  const _Actions();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Actions);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppTableColumnSize.actions()';
}


}




// dart format on
