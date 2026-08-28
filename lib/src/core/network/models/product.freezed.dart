// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int? get id; String get name; String get description;@JsonKey(name: 'seller_id') int? get sellerId;@JsonKey(name: 'seller_name', includeToJson: false) String get sellerName;@JsonKey(name: 'external_api_url') String get url;@JsonKey(name: 'key_name') String get keyName;@JsonKey(name: 'demo_product_offer_id') int? get demoProductOfferId;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'use_proxy') bool get useProxy;@JsonKey(name: 'proxy_parameters', includeIfNull: false) ProxyParameters? get proxyParameters;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.url, url) || other.url == url)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.demoProductOfferId, demoProductOfferId) || other.demoProductOfferId == demoProductOfferId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.useProxy, useProxy) || other.useProxy == useProxy)&&(identical(other.proxyParameters, proxyParameters) || other.proxyParameters == proxyParameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,sellerId,sellerName,url,keyName,demoProductOfferId,isActive,useProxy,proxyParameters);

@override
String toString() {
  return 'Product(id: $id, name: $name, description: $description, sellerId: $sellerId, sellerName: $sellerName, url: $url, keyName: $keyName, demoProductOfferId: $demoProductOfferId, isActive: $isActive, useProxy: $useProxy, proxyParameters: $proxyParameters)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int? id, String name, String description,@JsonKey(name: 'seller_id') int? sellerId,@JsonKey(name: 'seller_name', includeToJson: false) String sellerName,@JsonKey(name: 'external_api_url') String url,@JsonKey(name: 'key_name') String keyName,@JsonKey(name: 'demo_product_offer_id') int? demoProductOfferId,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'use_proxy') bool useProxy,@JsonKey(name: 'proxy_parameters', includeIfNull: false) ProxyParameters? proxyParameters
});


$ProxyParametersCopyWith<$Res>? get proxyParameters;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? sellerId = freezed,Object? sellerName = null,Object? url = null,Object? keyName = null,Object? demoProductOfferId = freezed,Object? isActive = null,Object? useProxy = null,Object? proxyParameters = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int?,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,keyName: null == keyName ? _self.keyName : keyName // ignore: cast_nullable_to_non_nullable
as String,demoProductOfferId: freezed == demoProductOfferId ? _self.demoProductOfferId : demoProductOfferId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,useProxy: null == useProxy ? _self.useProxy : useProxy // ignore: cast_nullable_to_non_nullable
as bool,proxyParameters: freezed == proxyParameters ? _self.proxyParameters : proxyParameters // ignore: cast_nullable_to_non_nullable
as ProxyParameters?,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProxyParametersCopyWith<$Res>? get proxyParameters {
    if (_self.proxyParameters == null) {
    return null;
  }

  return $ProxyParametersCopyWith<$Res>(_self.proxyParameters!, (value) {
    return _then(_self.copyWith(proxyParameters: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  String description, @JsonKey(name: 'seller_id')  int? sellerId, @JsonKey(name: 'seller_name', includeToJson: false)  String sellerName, @JsonKey(name: 'external_api_url')  String url, @JsonKey(name: 'key_name')  String keyName, @JsonKey(name: 'demo_product_offer_id')  int? demoProductOfferId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'use_proxy')  bool useProxy, @JsonKey(name: 'proxy_parameters', includeIfNull: false)  ProxyParameters? proxyParameters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.sellerId,_that.sellerName,_that.url,_that.keyName,_that.demoProductOfferId,_that.isActive,_that.useProxy,_that.proxyParameters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  String description, @JsonKey(name: 'seller_id')  int? sellerId, @JsonKey(name: 'seller_name', includeToJson: false)  String sellerName, @JsonKey(name: 'external_api_url')  String url, @JsonKey(name: 'key_name')  String keyName, @JsonKey(name: 'demo_product_offer_id')  int? demoProductOfferId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'use_proxy')  bool useProxy, @JsonKey(name: 'proxy_parameters', includeIfNull: false)  ProxyParameters? proxyParameters)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.name,_that.description,_that.sellerId,_that.sellerName,_that.url,_that.keyName,_that.demoProductOfferId,_that.isActive,_that.useProxy,_that.proxyParameters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  String description, @JsonKey(name: 'seller_id')  int? sellerId, @JsonKey(name: 'seller_name', includeToJson: false)  String sellerName, @JsonKey(name: 'external_api_url')  String url, @JsonKey(name: 'key_name')  String keyName, @JsonKey(name: 'demo_product_offer_id')  int? demoProductOfferId, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'use_proxy')  bool useProxy, @JsonKey(name: 'proxy_parameters', includeIfNull: false)  ProxyParameters? proxyParameters)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.sellerId,_that.sellerName,_that.url,_that.keyName,_that.demoProductOfferId,_that.isActive,_that.useProxy,_that.proxyParameters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product extends Product {
  const _Product({this.id, this.name = '', this.description = '', @JsonKey(name: 'seller_id') this.sellerId, @JsonKey(name: 'seller_name', includeToJson: false) this.sellerName = "", @JsonKey(name: 'external_api_url') this.url = "", @JsonKey(name: 'key_name') this.keyName = "", @JsonKey(name: 'demo_product_offer_id') this.demoProductOfferId, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'use_proxy') this.useProxy = false, @JsonKey(name: 'proxy_parameters', includeIfNull: false) this.proxyParameters}): super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int? id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey(name: 'seller_id') final  int? sellerId;
@override@JsonKey(name: 'seller_name', includeToJson: false) final  String sellerName;
@override@JsonKey(name: 'external_api_url') final  String url;
@override@JsonKey(name: 'key_name') final  String keyName;
@override@JsonKey(name: 'demo_product_offer_id') final  int? demoProductOfferId;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'use_proxy') final  bool useProxy;
@override@JsonKey(name: 'proxy_parameters', includeIfNull: false) final  ProxyParameters? proxyParameters;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.url, url) || other.url == url)&&(identical(other.keyName, keyName) || other.keyName == keyName)&&(identical(other.demoProductOfferId, demoProductOfferId) || other.demoProductOfferId == demoProductOfferId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.useProxy, useProxy) || other.useProxy == useProxy)&&(identical(other.proxyParameters, proxyParameters) || other.proxyParameters == proxyParameters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,sellerId,sellerName,url,keyName,demoProductOfferId,isActive,useProxy,proxyParameters);

@override
String toString() {
  return 'Product(id: $id, name: $name, description: $description, sellerId: $sellerId, sellerName: $sellerName, url: $url, keyName: $keyName, demoProductOfferId: $demoProductOfferId, isActive: $isActive, useProxy: $useProxy, proxyParameters: $proxyParameters)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, String description,@JsonKey(name: 'seller_id') int? sellerId,@JsonKey(name: 'seller_name', includeToJson: false) String sellerName,@JsonKey(name: 'external_api_url') String url,@JsonKey(name: 'key_name') String keyName,@JsonKey(name: 'demo_product_offer_id') int? demoProductOfferId,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'use_proxy') bool useProxy,@JsonKey(name: 'proxy_parameters', includeIfNull: false) ProxyParameters? proxyParameters
});


@override $ProxyParametersCopyWith<$Res>? get proxyParameters;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? sellerId = freezed,Object? sellerName = null,Object? url = null,Object? keyName = null,Object? demoProductOfferId = freezed,Object? isActive = null,Object? useProxy = null,Object? proxyParameters = freezed,}) {
  return _then(_Product(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int?,sellerName: null == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,keyName: null == keyName ? _self.keyName : keyName // ignore: cast_nullable_to_non_nullable
as String,demoProductOfferId: freezed == demoProductOfferId ? _self.demoProductOfferId : demoProductOfferId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,useProxy: null == useProxy ? _self.useProxy : useProxy // ignore: cast_nullable_to_non_nullable
as bool,proxyParameters: freezed == proxyParameters ? _self.proxyParameters : proxyParameters // ignore: cast_nullable_to_non_nullable
as ProxyParameters?,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProxyParametersCopyWith<$Res>? get proxyParameters {
    if (_self.proxyParameters == null) {
    return null;
  }

  return $ProxyParametersCopyWith<$Res>(_self.proxyParameters!, (value) {
    return _then(_self.copyWith(proxyParameters: value));
  });
}
}


/// @nodoc
mixin _$ProxyParameters {

@JsonKey(includeIfNull: false) String? get host;@JsonKey(includeIfNull: false) String? get port;@JsonKey(includeIfNull: false) String? get user;@JsonKey(includeIfNull: false) String? get password;
/// Create a copy of ProxyParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProxyParametersCopyWith<ProxyParameters> get copyWith => _$ProxyParametersCopyWithImpl<ProxyParameters>(this as ProxyParameters, _$identity);

  /// Serializes this ProxyParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProxyParameters&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.user, user) || other.user == user)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,port,user,password);

@override
String toString() {
  return 'ProxyParameters(host: $host, port: $port, user: $user, password: $password)';
}


}

/// @nodoc
abstract mixin class $ProxyParametersCopyWith<$Res>  {
  factory $ProxyParametersCopyWith(ProxyParameters value, $Res Function(ProxyParameters) _then) = _$ProxyParametersCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? host,@JsonKey(includeIfNull: false) String? port,@JsonKey(includeIfNull: false) String? user,@JsonKey(includeIfNull: false) String? password
});




}
/// @nodoc
class _$ProxyParametersCopyWithImpl<$Res>
    implements $ProxyParametersCopyWith<$Res> {
  _$ProxyParametersCopyWithImpl(this._self, this._then);

  final ProxyParameters _self;
  final $Res Function(ProxyParameters) _then;

/// Create a copy of ProxyParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = freezed,Object? port = freezed,Object? user = freezed,Object? password = freezed,}) {
  return _then(_self.copyWith(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProxyParameters].
extension ProxyParametersPatterns on ProxyParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProxyParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProxyParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProxyParameters value)  $default,){
final _that = this;
switch (_that) {
case _ProxyParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProxyParameters value)?  $default,){
final _that = this;
switch (_that) {
case _ProxyParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? host, @JsonKey(includeIfNull: false)  String? port, @JsonKey(includeIfNull: false)  String? user, @JsonKey(includeIfNull: false)  String? password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProxyParameters() when $default != null:
return $default(_that.host,_that.port,_that.user,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? host, @JsonKey(includeIfNull: false)  String? port, @JsonKey(includeIfNull: false)  String? user, @JsonKey(includeIfNull: false)  String? password)  $default,) {final _that = this;
switch (_that) {
case _ProxyParameters():
return $default(_that.host,_that.port,_that.user,_that.password);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? host, @JsonKey(includeIfNull: false)  String? port, @JsonKey(includeIfNull: false)  String? user, @JsonKey(includeIfNull: false)  String? password)?  $default,) {final _that = this;
switch (_that) {
case _ProxyParameters() when $default != null:
return $default(_that.host,_that.port,_that.user,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProxyParameters extends ProxyParameters {
  const _ProxyParameters({@JsonKey(includeIfNull: false) this.host, @JsonKey(includeIfNull: false) this.port, @JsonKey(includeIfNull: false) this.user, @JsonKey(includeIfNull: false) this.password}): super._();
  factory _ProxyParameters.fromJson(Map<String, dynamic> json) => _$ProxyParametersFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? host;
@override@JsonKey(includeIfNull: false) final  String? port;
@override@JsonKey(includeIfNull: false) final  String? user;
@override@JsonKey(includeIfNull: false) final  String? password;

/// Create a copy of ProxyParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProxyParametersCopyWith<_ProxyParameters> get copyWith => __$ProxyParametersCopyWithImpl<_ProxyParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProxyParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProxyParameters&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.user, user) || other.user == user)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,port,user,password);

@override
String toString() {
  return 'ProxyParameters(host: $host, port: $port, user: $user, password: $password)';
}


}

/// @nodoc
abstract mixin class _$ProxyParametersCopyWith<$Res> implements $ProxyParametersCopyWith<$Res> {
  factory _$ProxyParametersCopyWith(_ProxyParameters value, $Res Function(_ProxyParameters) _then) = __$ProxyParametersCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? host,@JsonKey(includeIfNull: false) String? port,@JsonKey(includeIfNull: false) String? user,@JsonKey(includeIfNull: false) String? password
});




}
/// @nodoc
class __$ProxyParametersCopyWithImpl<$Res>
    implements _$ProxyParametersCopyWith<$Res> {
  __$ProxyParametersCopyWithImpl(this._self, this._then);

  final _ProxyParameters _self;
  final $Res Function(_ProxyParameters) _then;

/// Create a copy of ProxyParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = freezed,Object? port = freezed,Object? user = freezed,Object? password = freezed,}) {
  return _then(_ProxyParameters(
host: freezed == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String?,port: freezed == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
