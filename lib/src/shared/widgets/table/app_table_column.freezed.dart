// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_table_column.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppTableColumn<T> implements DiagnosticableTreeMixin {

 String? get id; AppTableCell Function(T item) get cellBuilder; String? get title; IconData? get icon; AppTableColumnSize get size; bool get isVisible; bool get isPinned; List<UserRole> get visibleFor; List<UserRole> get invisibleFor;
/// Create a copy of AppTableColumn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppTableColumnCopyWith<T, AppTableColumn<T>> get copyWith => _$AppTableColumnCopyWithImpl<T, AppTableColumn<T>>(this as AppTableColumn<T>, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppTableColumn<$T>'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('cellBuilder', cellBuilder))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('size', size))..add(DiagnosticsProperty('isVisible', isVisible))..add(DiagnosticsProperty('isPinned', isPinned))..add(DiagnosticsProperty('visibleFor', visibleFor))..add(DiagnosticsProperty('invisibleFor', invisibleFor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppTableColumn<T>&&(identical(other.id, id) || other.id == id)&&(identical(other.cellBuilder, cellBuilder) || other.cellBuilder == cellBuilder)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.size, size) || other.size == size)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&const DeepCollectionEquality().equals(other.visibleFor, visibleFor)&&const DeepCollectionEquality().equals(other.invisibleFor, invisibleFor));
}


@override
int get hashCode => Object.hash(runtimeType,id,cellBuilder,title,icon,size,isVisible,isPinned,const DeepCollectionEquality().hash(visibleFor),const DeepCollectionEquality().hash(invisibleFor));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppTableColumn<$T>(id: $id, cellBuilder: $cellBuilder, title: $title, icon: $icon, size: $size, isVisible: $isVisible, isPinned: $isPinned, visibleFor: $visibleFor, invisibleFor: $invisibleFor)';
}


}

/// @nodoc
abstract mixin class $AppTableColumnCopyWith<T,$Res>  {
  factory $AppTableColumnCopyWith(AppTableColumn<T> value, $Res Function(AppTableColumn<T>) _then) = _$AppTableColumnCopyWithImpl;
@useResult
$Res call({
 String? id, AppTableCell Function(T item) cellBuilder, String? title, IconData? icon, AppTableColumnSize size, bool isVisible, bool isPinned, List<UserRole> visibleFor, List<UserRole> invisibleFor
});


$AppTableColumnSizeCopyWith<$Res> get size;

}
/// @nodoc
class _$AppTableColumnCopyWithImpl<T,$Res>
    implements $AppTableColumnCopyWith<T, $Res> {
  _$AppTableColumnCopyWithImpl(this._self, this._then);

  final AppTableColumn<T> _self;
  final $Res Function(AppTableColumn<T>) _then;

/// Create a copy of AppTableColumn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? cellBuilder = null,Object? title = freezed,Object? icon = freezed,Object? size = null,Object? isVisible = null,Object? isPinned = null,Object? visibleFor = null,Object? invisibleFor = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,cellBuilder: null == cellBuilder ? _self.cellBuilder : cellBuilder // ignore: cast_nullable_to_non_nullable
as AppTableCell Function(T item),title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as AppTableColumnSize,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,visibleFor: null == visibleFor ? _self.visibleFor : visibleFor // ignore: cast_nullable_to_non_nullable
as List<UserRole>,invisibleFor: null == invisibleFor ? _self.invisibleFor : invisibleFor // ignore: cast_nullable_to_non_nullable
as List<UserRole>,
  ));
}
/// Create a copy of AppTableColumn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppTableColumnSizeCopyWith<$Res> get size {
  
  return $AppTableColumnSizeCopyWith<$Res>(_self.size, (value) {
    return _then(_self.copyWith(size: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppTableColumn].
extension AppTableColumnPatterns<T> on AppTableColumn<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppTableColumn<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppTableColumn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppTableColumn<T> value)  $default,){
final _that = this;
switch (_that) {
case _AppTableColumn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppTableColumn<T> value)?  $default,){
final _that = this;
switch (_that) {
case _AppTableColumn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  AppTableCell Function(T item) cellBuilder,  String? title,  IconData? icon,  AppTableColumnSize size,  bool isVisible,  bool isPinned,  List<UserRole> visibleFor,  List<UserRole> invisibleFor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppTableColumn() when $default != null:
return $default(_that.id,_that.cellBuilder,_that.title,_that.icon,_that.size,_that.isVisible,_that.isPinned,_that.visibleFor,_that.invisibleFor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  AppTableCell Function(T item) cellBuilder,  String? title,  IconData? icon,  AppTableColumnSize size,  bool isVisible,  bool isPinned,  List<UserRole> visibleFor,  List<UserRole> invisibleFor)  $default,) {final _that = this;
switch (_that) {
case _AppTableColumn():
return $default(_that.id,_that.cellBuilder,_that.title,_that.icon,_that.size,_that.isVisible,_that.isPinned,_that.visibleFor,_that.invisibleFor);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  AppTableCell Function(T item) cellBuilder,  String? title,  IconData? icon,  AppTableColumnSize size,  bool isVisible,  bool isPinned,  List<UserRole> visibleFor,  List<UserRole> invisibleFor)?  $default,) {final _that = this;
switch (_that) {
case _AppTableColumn() when $default != null:
return $default(_that.id,_that.cellBuilder,_that.title,_that.icon,_that.size,_that.isVisible,_that.isPinned,_that.visibleFor,_that.invisibleFor);case _:
  return null;

}
}

}

/// @nodoc


class _AppTableColumn<T> extends AppTableColumn<T> with DiagnosticableTreeMixin {
  const _AppTableColumn({this.id, required this.cellBuilder, this.title, this.icon, this.size = const AppTableColumnSize.flex(1), this.isVisible = true, this.isPinned = false, final  List<UserRole> visibleFor = const [], final  List<UserRole> invisibleFor = const []}): _visibleFor = visibleFor,_invisibleFor = invisibleFor,super._();
  

@override final  String? id;
@override final  AppTableCell Function(T item) cellBuilder;
@override final  String? title;
@override final  IconData? icon;
@override@JsonKey() final  AppTableColumnSize size;
@override@JsonKey() final  bool isVisible;
@override@JsonKey() final  bool isPinned;
 final  List<UserRole> _visibleFor;
@override@JsonKey() List<UserRole> get visibleFor {
  if (_visibleFor is EqualUnmodifiableListView) return _visibleFor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_visibleFor);
}

 final  List<UserRole> _invisibleFor;
@override@JsonKey() List<UserRole> get invisibleFor {
  if (_invisibleFor is EqualUnmodifiableListView) return _invisibleFor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invisibleFor);
}


/// Create a copy of AppTableColumn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppTableColumnCopyWith<T, _AppTableColumn<T>> get copyWith => __$AppTableColumnCopyWithImpl<T, _AppTableColumn<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AppTableColumn<$T>'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('cellBuilder', cellBuilder))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('size', size))..add(DiagnosticsProperty('isVisible', isVisible))..add(DiagnosticsProperty('isPinned', isPinned))..add(DiagnosticsProperty('visibleFor', visibleFor))..add(DiagnosticsProperty('invisibleFor', invisibleFor));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppTableColumn<T>&&(identical(other.id, id) || other.id == id)&&(identical(other.cellBuilder, cellBuilder) || other.cellBuilder == cellBuilder)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.size, size) || other.size == size)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&const DeepCollectionEquality().equals(other._visibleFor, _visibleFor)&&const DeepCollectionEquality().equals(other._invisibleFor, _invisibleFor));
}


@override
int get hashCode => Object.hash(runtimeType,id,cellBuilder,title,icon,size,isVisible,isPinned,const DeepCollectionEquality().hash(_visibleFor),const DeepCollectionEquality().hash(_invisibleFor));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AppTableColumn<$T>(id: $id, cellBuilder: $cellBuilder, title: $title, icon: $icon, size: $size, isVisible: $isVisible, isPinned: $isPinned, visibleFor: $visibleFor, invisibleFor: $invisibleFor)';
}


}

/// @nodoc
abstract mixin class _$AppTableColumnCopyWith<T,$Res> implements $AppTableColumnCopyWith<T, $Res> {
  factory _$AppTableColumnCopyWith(_AppTableColumn<T> value, $Res Function(_AppTableColumn<T>) _then) = __$AppTableColumnCopyWithImpl;
@override @useResult
$Res call({
 String? id, AppTableCell Function(T item) cellBuilder, String? title, IconData? icon, AppTableColumnSize size, bool isVisible, bool isPinned, List<UserRole> visibleFor, List<UserRole> invisibleFor
});


@override $AppTableColumnSizeCopyWith<$Res> get size;

}
/// @nodoc
class __$AppTableColumnCopyWithImpl<T,$Res>
    implements _$AppTableColumnCopyWith<T, $Res> {
  __$AppTableColumnCopyWithImpl(this._self, this._then);

  final _AppTableColumn<T> _self;
  final $Res Function(_AppTableColumn<T>) _then;

/// Create a copy of AppTableColumn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? cellBuilder = null,Object? title = freezed,Object? icon = freezed,Object? size = null,Object? isVisible = null,Object? isPinned = null,Object? visibleFor = null,Object? invisibleFor = null,}) {
  return _then(_AppTableColumn<T>(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,cellBuilder: null == cellBuilder ? _self.cellBuilder : cellBuilder // ignore: cast_nullable_to_non_nullable
as AppTableCell Function(T item),title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as AppTableColumnSize,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,visibleFor: null == visibleFor ? _self._visibleFor : visibleFor // ignore: cast_nullable_to_non_nullable
as List<UserRole>,invisibleFor: null == invisibleFor ? _self._invisibleFor : invisibleFor // ignore: cast_nullable_to_non_nullable
as List<UserRole>,
  ));
}

/// Create a copy of AppTableColumn
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppTableColumnSizeCopyWith<$Res> get size {
  
  return $AppTableColumnSizeCopyWith<$Res>(_self.size, (value) {
    return _then(_self.copyWith(size: value));
  });
}
}

// dart format on
