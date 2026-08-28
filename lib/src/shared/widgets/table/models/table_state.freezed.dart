// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TableState<T> {

 List<T> get items; List<AppTableColumn<T>> get availableColumns; Set<String> get hiddenColumnIds; Map<String, bool> get collapsedGroups; List<TableRowItem<T>> get groupedItems; int get visibleItemsCount; bool get isLoading; SortField<T>? get sortBy; bool get sortReverse;
/// Create a copy of TableState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableStateCopyWith<T, TableState<T>> get copyWith => _$TableStateCopyWithImpl<T, TableState<T>>(this as TableState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableState<T>&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.availableColumns, availableColumns)&&const DeepCollectionEquality().equals(other.hiddenColumnIds, hiddenColumnIds)&&const DeepCollectionEquality().equals(other.collapsedGroups, collapsedGroups)&&const DeepCollectionEquality().equals(other.groupedItems, groupedItems)&&(identical(other.visibleItemsCount, visibleItemsCount) || other.visibleItemsCount == visibleItemsCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortReverse, sortReverse) || other.sortReverse == sortReverse));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(availableColumns),const DeepCollectionEquality().hash(hiddenColumnIds),const DeepCollectionEquality().hash(collapsedGroups),const DeepCollectionEquality().hash(groupedItems),visibleItemsCount,isLoading,sortBy,sortReverse);

@override
String toString() {
  return 'TableState<$T>(items: $items, availableColumns: $availableColumns, hiddenColumnIds: $hiddenColumnIds, collapsedGroups: $collapsedGroups, groupedItems: $groupedItems, visibleItemsCount: $visibleItemsCount, isLoading: $isLoading, sortBy: $sortBy, sortReverse: $sortReverse)';
}


}

/// @nodoc
abstract mixin class $TableStateCopyWith<T,$Res>  {
  factory $TableStateCopyWith(TableState<T> value, $Res Function(TableState<T>) _then) = _$TableStateCopyWithImpl;
@useResult
$Res call({
 List<T> items, List<AppTableColumn<T>> availableColumns, Set<String> hiddenColumnIds, Map<String, bool> collapsedGroups, List<TableRowItem<T>> groupedItems, int visibleItemsCount, bool isLoading, SortField<T>? sortBy, bool sortReverse
});




}
/// @nodoc
class _$TableStateCopyWithImpl<T,$Res>
    implements $TableStateCopyWith<T, $Res> {
  _$TableStateCopyWithImpl(this._self, this._then);

  final TableState<T> _self;
  final $Res Function(TableState<T>) _then;

/// Create a copy of TableState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? availableColumns = null,Object? hiddenColumnIds = null,Object? collapsedGroups = null,Object? groupedItems = null,Object? visibleItemsCount = null,Object? isLoading = null,Object? sortBy = freezed,Object? sortReverse = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,availableColumns: null == availableColumns ? _self.availableColumns : availableColumns // ignore: cast_nullable_to_non_nullable
as List<AppTableColumn<T>>,hiddenColumnIds: null == hiddenColumnIds ? _self.hiddenColumnIds : hiddenColumnIds // ignore: cast_nullable_to_non_nullable
as Set<String>,collapsedGroups: null == collapsedGroups ? _self.collapsedGroups : collapsedGroups // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,groupedItems: null == groupedItems ? _self.groupedItems : groupedItems // ignore: cast_nullable_to_non_nullable
as List<TableRowItem<T>>,visibleItemsCount: null == visibleItemsCount ? _self.visibleItemsCount : visibleItemsCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortField<T>?,sortReverse: null == sortReverse ? _self.sortReverse : sortReverse // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TableState].
extension TableStatePatterns<T> on TableState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableState<T> value)  $default,){
final _that = this;
switch (_that) {
case _TableState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _TableState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<T> items,  List<AppTableColumn<T>> availableColumns,  Set<String> hiddenColumnIds,  Map<String, bool> collapsedGroups,  List<TableRowItem<T>> groupedItems,  int visibleItemsCount,  bool isLoading,  SortField<T>? sortBy,  bool sortReverse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableState() when $default != null:
return $default(_that.items,_that.availableColumns,_that.hiddenColumnIds,_that.collapsedGroups,_that.groupedItems,_that.visibleItemsCount,_that.isLoading,_that.sortBy,_that.sortReverse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<T> items,  List<AppTableColumn<T>> availableColumns,  Set<String> hiddenColumnIds,  Map<String, bool> collapsedGroups,  List<TableRowItem<T>> groupedItems,  int visibleItemsCount,  bool isLoading,  SortField<T>? sortBy,  bool sortReverse)  $default,) {final _that = this;
switch (_that) {
case _TableState():
return $default(_that.items,_that.availableColumns,_that.hiddenColumnIds,_that.collapsedGroups,_that.groupedItems,_that.visibleItemsCount,_that.isLoading,_that.sortBy,_that.sortReverse);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<T> items,  List<AppTableColumn<T>> availableColumns,  Set<String> hiddenColumnIds,  Map<String, bool> collapsedGroups,  List<TableRowItem<T>> groupedItems,  int visibleItemsCount,  bool isLoading,  SortField<T>? sortBy,  bool sortReverse)?  $default,) {final _that = this;
switch (_that) {
case _TableState() when $default != null:
return $default(_that.items,_that.availableColumns,_that.hiddenColumnIds,_that.collapsedGroups,_that.groupedItems,_that.visibleItemsCount,_that.isLoading,_that.sortBy,_that.sortReverse);case _:
  return null;

}
}

}

/// @nodoc


class _TableState<T> implements TableState<T> {
  const _TableState({final  List<T> items = const [], final  List<AppTableColumn<T>> availableColumns = const [], final  Set<String> hiddenColumnIds = const {}, final  Map<String, bool> collapsedGroups = const {}, final  List<TableRowItem<T>> groupedItems = const [], this.visibleItemsCount = 0, this.isLoading = false, this.sortBy, this.sortReverse = false}): _items = items,_availableColumns = availableColumns,_hiddenColumnIds = hiddenColumnIds,_collapsedGroups = collapsedGroups,_groupedItems = groupedItems;
  

 final  List<T> _items;
@override@JsonKey() List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<AppTableColumn<T>> _availableColumns;
@override@JsonKey() List<AppTableColumn<T>> get availableColumns {
  if (_availableColumns is EqualUnmodifiableListView) return _availableColumns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableColumns);
}

 final  Set<String> _hiddenColumnIds;
@override@JsonKey() Set<String> get hiddenColumnIds {
  if (_hiddenColumnIds is EqualUnmodifiableSetView) return _hiddenColumnIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_hiddenColumnIds);
}

 final  Map<String, bool> _collapsedGroups;
@override@JsonKey() Map<String, bool> get collapsedGroups {
  if (_collapsedGroups is EqualUnmodifiableMapView) return _collapsedGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_collapsedGroups);
}

 final  List<TableRowItem<T>> _groupedItems;
@override@JsonKey() List<TableRowItem<T>> get groupedItems {
  if (_groupedItems is EqualUnmodifiableListView) return _groupedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groupedItems);
}

@override@JsonKey() final  int visibleItemsCount;
@override@JsonKey() final  bool isLoading;
@override final  SortField<T>? sortBy;
@override@JsonKey() final  bool sortReverse;

/// Create a copy of TableState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableStateCopyWith<T, _TableState<T>> get copyWith => __$TableStateCopyWithImpl<T, _TableState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableState<T>&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._availableColumns, _availableColumns)&&const DeepCollectionEquality().equals(other._hiddenColumnIds, _hiddenColumnIds)&&const DeepCollectionEquality().equals(other._collapsedGroups, _collapsedGroups)&&const DeepCollectionEquality().equals(other._groupedItems, _groupedItems)&&(identical(other.visibleItemsCount, visibleItemsCount) || other.visibleItemsCount == visibleItemsCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortReverse, sortReverse) || other.sortReverse == sortReverse));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_availableColumns),const DeepCollectionEquality().hash(_hiddenColumnIds),const DeepCollectionEquality().hash(_collapsedGroups),const DeepCollectionEquality().hash(_groupedItems),visibleItemsCount,isLoading,sortBy,sortReverse);

@override
String toString() {
  return 'TableState<$T>(items: $items, availableColumns: $availableColumns, hiddenColumnIds: $hiddenColumnIds, collapsedGroups: $collapsedGroups, groupedItems: $groupedItems, visibleItemsCount: $visibleItemsCount, isLoading: $isLoading, sortBy: $sortBy, sortReverse: $sortReverse)';
}


}

/// @nodoc
abstract mixin class _$TableStateCopyWith<T,$Res> implements $TableStateCopyWith<T, $Res> {
  factory _$TableStateCopyWith(_TableState<T> value, $Res Function(_TableState<T>) _then) = __$TableStateCopyWithImpl;
@override @useResult
$Res call({
 List<T> items, List<AppTableColumn<T>> availableColumns, Set<String> hiddenColumnIds, Map<String, bool> collapsedGroups, List<TableRowItem<T>> groupedItems, int visibleItemsCount, bool isLoading, SortField<T>? sortBy, bool sortReverse
});




}
/// @nodoc
class __$TableStateCopyWithImpl<T,$Res>
    implements _$TableStateCopyWith<T, $Res> {
  __$TableStateCopyWithImpl(this._self, this._then);

  final _TableState<T> _self;
  final $Res Function(_TableState<T>) _then;

/// Create a copy of TableState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? availableColumns = null,Object? hiddenColumnIds = null,Object? collapsedGroups = null,Object? groupedItems = null,Object? visibleItemsCount = null,Object? isLoading = null,Object? sortBy = freezed,Object? sortReverse = null,}) {
  return _then(_TableState<T>(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,availableColumns: null == availableColumns ? _self._availableColumns : availableColumns // ignore: cast_nullable_to_non_nullable
as List<AppTableColumn<T>>,hiddenColumnIds: null == hiddenColumnIds ? _self._hiddenColumnIds : hiddenColumnIds // ignore: cast_nullable_to_non_nullable
as Set<String>,collapsedGroups: null == collapsedGroups ? _self._collapsedGroups : collapsedGroups // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,groupedItems: null == groupedItems ? _self._groupedItems : groupedItems // ignore: cast_nullable_to_non_nullable
as List<TableRowItem<T>>,visibleItemsCount: null == visibleItemsCount ? _self.visibleItemsCount : visibleItemsCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortField<T>?,sortReverse: null == sortReverse ? _self.sortReverse : sortReverse // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
