// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_row_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableRowItem<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableRowItem<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TableRowItem<$T>()';
}


}

/// @nodoc
class $TableRowItemCopyWith<T,$Res>  {
$TableRowItemCopyWith(TableRowItem<T> _, $Res Function(TableRowItem<T>) __);
}


/// Adds pattern-matching-related methods to [TableRowItem].
extension TableRowItemPatterns<T> on TableRowItem<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TableRowData<T> value)?  data,TResult Function( TableGroupHeaderItem<T> value)?  groupHeader,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TableRowData() when data != null:
return data(_that);case TableGroupHeaderItem() when groupHeader != null:
return groupHeader(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TableRowData<T> value)  data,required TResult Function( TableGroupHeaderItem<T> value)  groupHeader,}){
final _that = this;
switch (_that) {
case TableRowData():
return data(_that);case TableGroupHeaderItem():
return groupHeader(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TableRowData<T> value)?  data,TResult? Function( TableGroupHeaderItem<T> value)?  groupHeader,}){
final _that = this;
switch (_that) {
case TableRowData() when data != null:
return data(_that);case TableGroupHeaderItem() when groupHeader != null:
return groupHeader(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T item,  int dataIndex)?  data,TResult Function( String groupTitle)?  groupHeader,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TableRowData() when data != null:
return data(_that.item,_that.dataIndex);case TableGroupHeaderItem() when groupHeader != null:
return groupHeader(_that.groupTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T item,  int dataIndex)  data,required TResult Function( String groupTitle)  groupHeader,}) {final _that = this;
switch (_that) {
case TableRowData():
return data(_that.item,_that.dataIndex);case TableGroupHeaderItem():
return groupHeader(_that.groupTitle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T item,  int dataIndex)?  data,TResult? Function( String groupTitle)?  groupHeader,}) {final _that = this;
switch (_that) {
case TableRowData() when data != null:
return data(_that.item,_that.dataIndex);case TableGroupHeaderItem() when groupHeader != null:
return groupHeader(_that.groupTitle);case _:
  return null;

}
}

}

/// @nodoc


class TableRowData<T> implements TableRowItem<T> {
  const TableRowData({required this.item, required this.dataIndex});
  

 final  T item;
 final  int dataIndex;

/// Create a copy of TableRowItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableRowDataCopyWith<T, TableRowData<T>> get copyWith => _$TableRowDataCopyWithImpl<T, TableRowData<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableRowData<T>&&const DeepCollectionEquality().equals(other.item, item)&&(identical(other.dataIndex, dataIndex) || other.dataIndex == dataIndex));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(item),dataIndex);

@override
String toString() {
  return 'TableRowItem<$T>.data(item: $item, dataIndex: $dataIndex)';
}


}

/// @nodoc
abstract mixin class $TableRowDataCopyWith<T,$Res> implements $TableRowItemCopyWith<T, $Res> {
  factory $TableRowDataCopyWith(TableRowData<T> value, $Res Function(TableRowData<T>) _then) = _$TableRowDataCopyWithImpl;
@useResult
$Res call({
 T item, int dataIndex
});




}
/// @nodoc
class _$TableRowDataCopyWithImpl<T,$Res>
    implements $TableRowDataCopyWith<T, $Res> {
  _$TableRowDataCopyWithImpl(this._self, this._then);

  final TableRowData<T> _self;
  final $Res Function(TableRowData<T>) _then;

/// Create a copy of TableRowItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = freezed,Object? dataIndex = null,}) {
  return _then(TableRowData<T>(
item: freezed == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as T,dataIndex: null == dataIndex ? _self.dataIndex : dataIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class TableGroupHeaderItem<T> implements TableRowItem<T> {
  const TableGroupHeaderItem({required this.groupTitle});
  

 final  String groupTitle;

/// Create a copy of TableRowItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableGroupHeaderItemCopyWith<T, TableGroupHeaderItem<T>> get copyWith => _$TableGroupHeaderItemCopyWithImpl<T, TableGroupHeaderItem<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableGroupHeaderItem<T>&&(identical(other.groupTitle, groupTitle) || other.groupTitle == groupTitle));
}


@override
int get hashCode => Object.hash(runtimeType,groupTitle);

@override
String toString() {
  return 'TableRowItem<$T>.groupHeader(groupTitle: $groupTitle)';
}


}

/// @nodoc
abstract mixin class $TableGroupHeaderItemCopyWith<T,$Res> implements $TableRowItemCopyWith<T, $Res> {
  factory $TableGroupHeaderItemCopyWith(TableGroupHeaderItem<T> value, $Res Function(TableGroupHeaderItem<T>) _then) = _$TableGroupHeaderItemCopyWithImpl;
@useResult
$Res call({
 String groupTitle
});




}
/// @nodoc
class _$TableGroupHeaderItemCopyWithImpl<T,$Res>
    implements $TableGroupHeaderItemCopyWith<T, $Res> {
  _$TableGroupHeaderItemCopyWithImpl(this._self, this._then);

  final TableGroupHeaderItem<T> _self;
  final $Res Function(TableGroupHeaderItem<T>) _then;

/// Create a copy of TableRowItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? groupTitle = null,}) {
  return _then(TableGroupHeaderItem<T>(
groupTitle: null == groupTitle ? _self.groupTitle : groupTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
