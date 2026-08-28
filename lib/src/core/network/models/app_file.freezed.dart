// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppFile {

 int? get id;@JsonKey(name: 'filename') String get filename;@JsonKey(name: 'uuid', includeToJson: false) String get uuid;@JsonKey(name: 'url', includeToJson: false) String get url;@JsonKey(name: 'company_id') int? get companyId;@JsonKey(name: 'company_name', includeToJson: false) String? get companyName;@JsonKey(name: 'product_id') int? get productId;@JsonKey(name: 'product_name', includeToJson: false) String? get productName;@JsonKey(name: 'mimetype') String? get mimetype;
/// Create a copy of AppFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppFileCopyWith<AppFile> get copyWith => _$AppFileCopyWithImpl<AppFile>(this as AppFile, _$identity);

  /// Serializes this AppFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppFile&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.url, url) || other.url == url)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filename,uuid,url,companyId,companyName,productId,productName,mimetype);

@override
String toString() {
  return 'AppFile(id: $id, filename: $filename, uuid: $uuid, url: $url, companyId: $companyId, companyName: $companyName, productId: $productId, productName: $productName, mimetype: $mimetype)';
}


}

/// @nodoc
abstract mixin class $AppFileCopyWith<$Res>  {
  factory $AppFileCopyWith(AppFile value, $Res Function(AppFile) _then) = _$AppFileCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'filename') String filename,@JsonKey(name: 'uuid', includeToJson: false) String uuid,@JsonKey(name: 'url', includeToJson: false) String url,@JsonKey(name: 'company_id') int? companyId,@JsonKey(name: 'company_name', includeToJson: false) String? companyName,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'product_name', includeToJson: false) String? productName,@JsonKey(name: 'mimetype') String? mimetype
});




}
/// @nodoc
class _$AppFileCopyWithImpl<$Res>
    implements $AppFileCopyWith<$Res> {
  _$AppFileCopyWithImpl(this._self, this._then);

  final AppFile _self;
  final $Res Function(AppFile) _then;

/// Create a copy of AppFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? filename = null,Object? uuid = null,Object? url = null,Object? companyId = freezed,Object? companyName = freezed,Object? productId = freezed,Object? productName = freezed,Object? mimetype = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppFile].
extension AppFilePatterns on AppFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppFile value)  $default,){
final _that = this;
switch (_that) {
case _AppFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppFile value)?  $default,){
final _that = this;
switch (_that) {
case _AppFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'filename')  String filename, @JsonKey(name: 'uuid', includeToJson: false)  String uuid, @JsonKey(name: 'url', includeToJson: false)  String url, @JsonKey(name: 'company_id')  int? companyId, @JsonKey(name: 'company_name', includeToJson: false)  String? companyName, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String? productName, @JsonKey(name: 'mimetype')  String? mimetype)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppFile() when $default != null:
return $default(_that.id,_that.filename,_that.uuid,_that.url,_that.companyId,_that.companyName,_that.productId,_that.productName,_that.mimetype);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'filename')  String filename, @JsonKey(name: 'uuid', includeToJson: false)  String uuid, @JsonKey(name: 'url', includeToJson: false)  String url, @JsonKey(name: 'company_id')  int? companyId, @JsonKey(name: 'company_name', includeToJson: false)  String? companyName, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String? productName, @JsonKey(name: 'mimetype')  String? mimetype)  $default,) {final _that = this;
switch (_that) {
case _AppFile():
return $default(_that.id,_that.filename,_that.uuid,_that.url,_that.companyId,_that.companyName,_that.productId,_that.productName,_that.mimetype);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'filename')  String filename, @JsonKey(name: 'uuid', includeToJson: false)  String uuid, @JsonKey(name: 'url', includeToJson: false)  String url, @JsonKey(name: 'company_id')  int? companyId, @JsonKey(name: 'company_name', includeToJson: false)  String? companyName, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String? productName, @JsonKey(name: 'mimetype')  String? mimetype)?  $default,) {final _that = this;
switch (_that) {
case _AppFile() when $default != null:
return $default(_that.id,_that.filename,_that.uuid,_that.url,_that.companyId,_that.companyName,_that.productId,_that.productName,_that.mimetype);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppFile extends AppFile {
  const _AppFile({this.id, @JsonKey(name: 'filename') required this.filename, @JsonKey(name: 'uuid', includeToJson: false) required this.uuid, @JsonKey(name: 'url', includeToJson: false) required this.url, @JsonKey(name: 'company_id') this.companyId, @JsonKey(name: 'company_name', includeToJson: false) this.companyName, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_name', includeToJson: false) this.productName, @JsonKey(name: 'mimetype') this.mimetype}): super._();
  factory _AppFile.fromJson(Map<String, dynamic> json) => _$AppFileFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'filename') final  String filename;
@override@JsonKey(name: 'uuid', includeToJson: false) final  String uuid;
@override@JsonKey(name: 'url', includeToJson: false) final  String url;
@override@JsonKey(name: 'company_id') final  int? companyId;
@override@JsonKey(name: 'company_name', includeToJson: false) final  String? companyName;
@override@JsonKey(name: 'product_id') final  int? productId;
@override@JsonKey(name: 'product_name', includeToJson: false) final  String? productName;
@override@JsonKey(name: 'mimetype') final  String? mimetype;

/// Create a copy of AppFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppFileCopyWith<_AppFile> get copyWith => __$AppFileCopyWithImpl<_AppFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppFile&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.url, url) || other.url == url)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.mimetype, mimetype) || other.mimetype == mimetype));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filename,uuid,url,companyId,companyName,productId,productName,mimetype);

@override
String toString() {
  return 'AppFile(id: $id, filename: $filename, uuid: $uuid, url: $url, companyId: $companyId, companyName: $companyName, productId: $productId, productName: $productName, mimetype: $mimetype)';
}


}

/// @nodoc
abstract mixin class _$AppFileCopyWith<$Res> implements $AppFileCopyWith<$Res> {
  factory _$AppFileCopyWith(_AppFile value, $Res Function(_AppFile) _then) = __$AppFileCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'filename') String filename,@JsonKey(name: 'uuid', includeToJson: false) String uuid,@JsonKey(name: 'url', includeToJson: false) String url,@JsonKey(name: 'company_id') int? companyId,@JsonKey(name: 'company_name', includeToJson: false) String? companyName,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'product_name', includeToJson: false) String? productName,@JsonKey(name: 'mimetype') String? mimetype
});




}
/// @nodoc
class __$AppFileCopyWithImpl<$Res>
    implements _$AppFileCopyWith<$Res> {
  __$AppFileCopyWithImpl(this._self, this._then);

  final _AppFile _self;
  final $Res Function(_AppFile) _then;

/// Create a copy of AppFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? filename = null,Object? uuid = null,Object? url = null,Object? companyId = freezed,Object? companyName = freezed,Object? productId = freezed,Object? productName = freezed,Object? mimetype = freezed,}) {
  return _then(_AppFile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,mimetype: freezed == mimetype ? _self.mimetype : mimetype // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
