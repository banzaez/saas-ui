// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Certificate {

 int? get id;@JsonKey(name: 'company_id') int get companyId;@JsonKey(name: 'company_name', includeToJson: false) String get companyName;@JsonKey(name: 'legal_entity_id') int get legalEntityId;@JsonKey(name: 'legal_entity_name', includeToJson: false) String get legalEntityName;@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'product_name', includeToJson: false) String get productName; CertificateStatus get status;@JsonKey(name: 'base_id') int get baseId;@JsonKey(name: 'base_name', includeToJson: false) String get baseName;@JsonKey(name: 'note') String get description;@JsonKey(name: 'api_key') String get apiKey;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'certificate_items') List<CertificateItem> get certificateItems;@JsonKey(name: 'pincodes') List<PinCode> get pincodes;@JsonKey(name: 'ip_whitelist') List<String> get ipWhitelist;@JsonKey(name: 'tokens_remaining', includeToJson: false) int get tokensRemaining;
/// Create a copy of Certificate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateCopyWith<Certificate> get copyWith => _$CertificateCopyWithImpl<Certificate>(this as Certificate, _$identity);

  /// Serializes this Certificate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Certificate&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.legalEntityName, legalEntityName) || other.legalEntityName == legalEntityName)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.status, status) || other.status == status)&&(identical(other.baseId, baseId) || other.baseId == baseId)&&(identical(other.baseName, baseName) || other.baseName == baseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.certificateItems, certificateItems)&&const DeepCollectionEquality().equals(other.pincodes, pincodes)&&const DeepCollectionEquality().equals(other.ipWhitelist, ipWhitelist)&&(identical(other.tokensRemaining, tokensRemaining) || other.tokensRemaining == tokensRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,companyName,legalEntityId,legalEntityName,productId,productName,status,baseId,baseName,description,apiKey,createdAt,updatedAt,const DeepCollectionEquality().hash(certificateItems),const DeepCollectionEquality().hash(pincodes),const DeepCollectionEquality().hash(ipWhitelist),tokensRemaining);

@override
String toString() {
  return 'Certificate(id: $id, companyId: $companyId, companyName: $companyName, legalEntityId: $legalEntityId, legalEntityName: $legalEntityName, productId: $productId, productName: $productName, status: $status, baseId: $baseId, baseName: $baseName, description: $description, apiKey: $apiKey, createdAt: $createdAt, updatedAt: $updatedAt, certificateItems: $certificateItems, pincodes: $pincodes, ipWhitelist: $ipWhitelist, tokensRemaining: $tokensRemaining)';
}


}

/// @nodoc
abstract mixin class $CertificateCopyWith<$Res>  {
  factory $CertificateCopyWith(Certificate value, $Res Function(Certificate) _then) = _$CertificateCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName,@JsonKey(name: 'legal_entity_id') int legalEntityId,@JsonKey(name: 'legal_entity_name', includeToJson: false) String legalEntityName,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name', includeToJson: false) String productName, CertificateStatus status,@JsonKey(name: 'base_id') int baseId,@JsonKey(name: 'base_name', includeToJson: false) String baseName,@JsonKey(name: 'note') String description,@JsonKey(name: 'api_key') String apiKey,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'certificate_items') List<CertificateItem> certificateItems,@JsonKey(name: 'pincodes') List<PinCode> pincodes,@JsonKey(name: 'ip_whitelist') List<String> ipWhitelist,@JsonKey(name: 'tokens_remaining', includeToJson: false) int tokensRemaining
});




}
/// @nodoc
class _$CertificateCopyWithImpl<$Res>
    implements $CertificateCopyWith<$Res> {
  _$CertificateCopyWithImpl(this._self, this._then);

  final Certificate _self;
  final $Res Function(Certificate) _then;

/// Create a copy of Certificate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyId = null,Object? companyName = null,Object? legalEntityId = null,Object? legalEntityName = null,Object? productId = null,Object? productName = null,Object? status = null,Object? baseId = null,Object? baseName = null,Object? description = null,Object? apiKey = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? certificateItems = null,Object? pincodes = null,Object? ipWhitelist = null,Object? tokensRemaining = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,legalEntityName: null == legalEntityName ? _self.legalEntityName : legalEntityName // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CertificateStatus,baseId: null == baseId ? _self.baseId : baseId // ignore: cast_nullable_to_non_nullable
as int,baseName: null == baseName ? _self.baseName : baseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,certificateItems: null == certificateItems ? _self.certificateItems : certificateItems // ignore: cast_nullable_to_non_nullable
as List<CertificateItem>,pincodes: null == pincodes ? _self.pincodes : pincodes // ignore: cast_nullable_to_non_nullable
as List<PinCode>,ipWhitelist: null == ipWhitelist ? _self.ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>,tokensRemaining: null == tokensRemaining ? _self.tokensRemaining : tokensRemaining // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Certificate].
extension CertificatePatterns on Certificate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Certificate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Certificate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Certificate value)  $default,){
final _that = this;
switch (_that) {
case _Certificate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Certificate value)?  $default,){
final _that = this;
switch (_that) {
case _Certificate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'legal_entity_name', includeToJson: false)  String legalEntityName, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName,  CertificateStatus status, @JsonKey(name: 'base_id')  int baseId, @JsonKey(name: 'base_name', includeToJson: false)  String baseName, @JsonKey(name: 'note')  String description, @JsonKey(name: 'api_key')  String apiKey, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'certificate_items')  List<CertificateItem> certificateItems, @JsonKey(name: 'pincodes')  List<PinCode> pincodes, @JsonKey(name: 'ip_whitelist')  List<String> ipWhitelist, @JsonKey(name: 'tokens_remaining', includeToJson: false)  int tokensRemaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Certificate() when $default != null:
return $default(_that.id,_that.companyId,_that.companyName,_that.legalEntityId,_that.legalEntityName,_that.productId,_that.productName,_that.status,_that.baseId,_that.baseName,_that.description,_that.apiKey,_that.createdAt,_that.updatedAt,_that.certificateItems,_that.pincodes,_that.ipWhitelist,_that.tokensRemaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'legal_entity_name', includeToJson: false)  String legalEntityName, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName,  CertificateStatus status, @JsonKey(name: 'base_id')  int baseId, @JsonKey(name: 'base_name', includeToJson: false)  String baseName, @JsonKey(name: 'note')  String description, @JsonKey(name: 'api_key')  String apiKey, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'certificate_items')  List<CertificateItem> certificateItems, @JsonKey(name: 'pincodes')  List<PinCode> pincodes, @JsonKey(name: 'ip_whitelist')  List<String> ipWhitelist, @JsonKey(name: 'tokens_remaining', includeToJson: false)  int tokensRemaining)  $default,) {final _that = this;
switch (_that) {
case _Certificate():
return $default(_that.id,_that.companyId,_that.companyName,_that.legalEntityId,_that.legalEntityName,_that.productId,_that.productName,_that.status,_that.baseId,_that.baseName,_that.description,_that.apiKey,_that.createdAt,_that.updatedAt,_that.certificateItems,_that.pincodes,_that.ipWhitelist,_that.tokensRemaining);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'legal_entity_name', includeToJson: false)  String legalEntityName, @JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName,  CertificateStatus status, @JsonKey(name: 'base_id')  int baseId, @JsonKey(name: 'base_name', includeToJson: false)  String baseName, @JsonKey(name: 'note')  String description, @JsonKey(name: 'api_key')  String apiKey, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'certificate_items')  List<CertificateItem> certificateItems, @JsonKey(name: 'pincodes')  List<PinCode> pincodes, @JsonKey(name: 'ip_whitelist')  List<String> ipWhitelist, @JsonKey(name: 'tokens_remaining', includeToJson: false)  int tokensRemaining)?  $default,) {final _that = this;
switch (_that) {
case _Certificate() when $default != null:
return $default(_that.id,_that.companyId,_that.companyName,_that.legalEntityId,_that.legalEntityName,_that.productId,_that.productName,_that.status,_that.baseId,_that.baseName,_that.description,_that.apiKey,_that.createdAt,_that.updatedAt,_that.certificateItems,_that.pincodes,_that.ipWhitelist,_that.tokensRemaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Certificate extends Certificate {
  const _Certificate({this.id, @JsonKey(name: 'company_id') this.companyId = 0, @JsonKey(name: 'company_name', includeToJson: false) this.companyName = "", @JsonKey(name: 'legal_entity_id') this.legalEntityId = 0, @JsonKey(name: 'legal_entity_name', includeToJson: false) this.legalEntityName = "", @JsonKey(name: 'product_id') this.productId = 0, @JsonKey(name: 'product_name', includeToJson: false) this.productName = "", this.status = CertificateStatus.active, @JsonKey(name: 'base_id') this.baseId = 0, @JsonKey(name: 'base_name', includeToJson: false) this.baseName = "", @JsonKey(name: 'note') this.description = "", @JsonKey(name: 'api_key') this.apiKey = "", @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'certificate_items') final  List<CertificateItem> certificateItems = const [], @JsonKey(name: 'pincodes') final  List<PinCode> pincodes = const [], @JsonKey(name: 'ip_whitelist') final  List<String> ipWhitelist = const [], @JsonKey(name: 'tokens_remaining', includeToJson: false) this.tokensRemaining = 0}): _certificateItems = certificateItems,_pincodes = pincodes,_ipWhitelist = ipWhitelist,super._();
  factory _Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'company_id') final  int companyId;
@override@JsonKey(name: 'company_name', includeToJson: false) final  String companyName;
@override@JsonKey(name: 'legal_entity_id') final  int legalEntityId;
@override@JsonKey(name: 'legal_entity_name', includeToJson: false) final  String legalEntityName;
@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'product_name', includeToJson: false) final  String productName;
@override@JsonKey() final  CertificateStatus status;
@override@JsonKey(name: 'base_id') final  int baseId;
@override@JsonKey(name: 'base_name', includeToJson: false) final  String baseName;
@override@JsonKey(name: 'note') final  String description;
@override@JsonKey(name: 'api_key') final  String apiKey;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
 final  List<CertificateItem> _certificateItems;
@override@JsonKey(name: 'certificate_items') List<CertificateItem> get certificateItems {
  if (_certificateItems is EqualUnmodifiableListView) return _certificateItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certificateItems);
}

 final  List<PinCode> _pincodes;
@override@JsonKey(name: 'pincodes') List<PinCode> get pincodes {
  if (_pincodes is EqualUnmodifiableListView) return _pincodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pincodes);
}

 final  List<String> _ipWhitelist;
@override@JsonKey(name: 'ip_whitelist') List<String> get ipWhitelist {
  if (_ipWhitelist is EqualUnmodifiableListView) return _ipWhitelist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ipWhitelist);
}

@override@JsonKey(name: 'tokens_remaining', includeToJson: false) final  int tokensRemaining;

/// Create a copy of Certificate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificateCopyWith<_Certificate> get copyWith => __$CertificateCopyWithImpl<_Certificate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Certificate&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.legalEntityName, legalEntityName) || other.legalEntityName == legalEntityName)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.status, status) || other.status == status)&&(identical(other.baseId, baseId) || other.baseId == baseId)&&(identical(other.baseName, baseName) || other.baseName == baseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._certificateItems, _certificateItems)&&const DeepCollectionEquality().equals(other._pincodes, _pincodes)&&const DeepCollectionEquality().equals(other._ipWhitelist, _ipWhitelist)&&(identical(other.tokensRemaining, tokensRemaining) || other.tokensRemaining == tokensRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,companyName,legalEntityId,legalEntityName,productId,productName,status,baseId,baseName,description,apiKey,createdAt,updatedAt,const DeepCollectionEquality().hash(_certificateItems),const DeepCollectionEquality().hash(_pincodes),const DeepCollectionEquality().hash(_ipWhitelist),tokensRemaining);

@override
String toString() {
  return 'Certificate(id: $id, companyId: $companyId, companyName: $companyName, legalEntityId: $legalEntityId, legalEntityName: $legalEntityName, productId: $productId, productName: $productName, status: $status, baseId: $baseId, baseName: $baseName, description: $description, apiKey: $apiKey, createdAt: $createdAt, updatedAt: $updatedAt, certificateItems: $certificateItems, pincodes: $pincodes, ipWhitelist: $ipWhitelist, tokensRemaining: $tokensRemaining)';
}


}

/// @nodoc
abstract mixin class _$CertificateCopyWith<$Res> implements $CertificateCopyWith<$Res> {
  factory _$CertificateCopyWith(_Certificate value, $Res Function(_Certificate) _then) = __$CertificateCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName,@JsonKey(name: 'legal_entity_id') int legalEntityId,@JsonKey(name: 'legal_entity_name', includeToJson: false) String legalEntityName,@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'product_name', includeToJson: false) String productName, CertificateStatus status,@JsonKey(name: 'base_id') int baseId,@JsonKey(name: 'base_name', includeToJson: false) String baseName,@JsonKey(name: 'note') String description,@JsonKey(name: 'api_key') String apiKey,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'certificate_items') List<CertificateItem> certificateItems,@JsonKey(name: 'pincodes') List<PinCode> pincodes,@JsonKey(name: 'ip_whitelist') List<String> ipWhitelist,@JsonKey(name: 'tokens_remaining', includeToJson: false) int tokensRemaining
});




}
/// @nodoc
class __$CertificateCopyWithImpl<$Res>
    implements _$CertificateCopyWith<$Res> {
  __$CertificateCopyWithImpl(this._self, this._then);

  final _Certificate _self;
  final $Res Function(_Certificate) _then;

/// Create a copy of Certificate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyId = null,Object? companyName = null,Object? legalEntityId = null,Object? legalEntityName = null,Object? productId = null,Object? productName = null,Object? status = null,Object? baseId = null,Object? baseName = null,Object? description = null,Object? apiKey = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? certificateItems = null,Object? pincodes = null,Object? ipWhitelist = null,Object? tokensRemaining = null,}) {
  return _then(_Certificate(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,legalEntityName: null == legalEntityName ? _self.legalEntityName : legalEntityName // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CertificateStatus,baseId: null == baseId ? _self.baseId : baseId // ignore: cast_nullable_to_non_nullable
as int,baseName: null == baseName ? _self.baseName : baseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,certificateItems: null == certificateItems ? _self._certificateItems : certificateItems // ignore: cast_nullable_to_non_nullable
as List<CertificateItem>,pincodes: null == pincodes ? _self._pincodes : pincodes // ignore: cast_nullable_to_non_nullable
as List<PinCode>,ipWhitelist: null == ipWhitelist ? _self._ipWhitelist : ipWhitelist // ignore: cast_nullable_to_non_nullable
as List<String>,tokensRemaining: null == tokensRemaining ? _self.tokensRemaining : tokensRemaining // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
