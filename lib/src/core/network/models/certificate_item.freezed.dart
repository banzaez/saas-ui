// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CertificateItem {

 int? get id;@JsonKey(name: 'certificate_id') int get certificateId;@JsonKey(name: 'product_offer_id') int get productOfferId;@JsonKey(name: 'product_offer_name', includeToJson: false) String get productOfferName; double get amount; String get currency;@JsonKey(name: 'tokens_total') int get tokensTotal;@JsonKey(name: 'tokens_initial') int get tokensInitial;@JsonKey(name: 'tokens_used') int get tokensUsed;@JsonKey(name: 'tokens_remaining') int get tokensRemaining; CertificateItemStatus get status;@JsonKey(name: 'activated_at') DateTime? get activatedAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'invoice_ids', includeToJson: false) List<int> get invoiceIds;@JsonKey(name: 'invoices', includeToJson: false) List<Invoice> get invoices;
/// Create a copy of CertificateItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificateItemCopyWith<CertificateItem> get copyWith => _$CertificateItemCopyWithImpl<CertificateItem>(this as CertificateItem, _$identity);

  /// Serializes this CertificateItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificateItem&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.productOfferId, productOfferId) || other.productOfferId == productOfferId)&&(identical(other.productOfferName, productOfferName) || other.productOfferName == productOfferName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.tokensTotal, tokensTotal) || other.tokensTotal == tokensTotal)&&(identical(other.tokensInitial, tokensInitial) || other.tokensInitial == tokensInitial)&&(identical(other.tokensUsed, tokensUsed) || other.tokensUsed == tokensUsed)&&(identical(other.tokensRemaining, tokensRemaining) || other.tokensRemaining == tokensRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.activatedAt, activatedAt) || other.activatedAt == activatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.invoiceIds, invoiceIds)&&const DeepCollectionEquality().equals(other.invoices, invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,certificateId,productOfferId,productOfferName,amount,currency,tokensTotal,tokensInitial,tokensUsed,tokensRemaining,status,activatedAt,expiresAt,createdAt,const DeepCollectionEquality().hash(invoiceIds),const DeepCollectionEquality().hash(invoices));

@override
String toString() {
  return 'CertificateItem(id: $id, certificateId: $certificateId, productOfferId: $productOfferId, productOfferName: $productOfferName, amount: $amount, currency: $currency, tokensTotal: $tokensTotal, tokensInitial: $tokensInitial, tokensUsed: $tokensUsed, tokensRemaining: $tokensRemaining, status: $status, activatedAt: $activatedAt, expiresAt: $expiresAt, createdAt: $createdAt, invoiceIds: $invoiceIds, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class $CertificateItemCopyWith<$Res>  {
  factory $CertificateItemCopyWith(CertificateItem value, $Res Function(CertificateItem) _then) = _$CertificateItemCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_id') int certificateId,@JsonKey(name: 'product_offer_id') int productOfferId,@JsonKey(name: 'product_offer_name', includeToJson: false) String productOfferName, double amount, String currency,@JsonKey(name: 'tokens_total') int tokensTotal,@JsonKey(name: 'tokens_initial') int tokensInitial,@JsonKey(name: 'tokens_used') int tokensUsed,@JsonKey(name: 'tokens_remaining') int tokensRemaining, CertificateItemStatus status,@JsonKey(name: 'activated_at') DateTime? activatedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'invoice_ids', includeToJson: false) List<int> invoiceIds,@JsonKey(name: 'invoices', includeToJson: false) List<Invoice> invoices
});




}
/// @nodoc
class _$CertificateItemCopyWithImpl<$Res>
    implements $CertificateItemCopyWith<$Res> {
  _$CertificateItemCopyWithImpl(this._self, this._then);

  final CertificateItem _self;
  final $Res Function(CertificateItem) _then;

/// Create a copy of CertificateItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? certificateId = null,Object? productOfferId = null,Object? productOfferName = null,Object? amount = null,Object? currency = null,Object? tokensTotal = null,Object? tokensInitial = null,Object? tokensUsed = null,Object? tokensRemaining = null,Object? status = null,Object? activatedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,Object? invoiceIds = null,Object? invoices = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateId: null == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int,productOfferId: null == productOfferId ? _self.productOfferId : productOfferId // ignore: cast_nullable_to_non_nullable
as int,productOfferName: null == productOfferName ? _self.productOfferName : productOfferName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,tokensTotal: null == tokensTotal ? _self.tokensTotal : tokensTotal // ignore: cast_nullable_to_non_nullable
as int,tokensInitial: null == tokensInitial ? _self.tokensInitial : tokensInitial // ignore: cast_nullable_to_non_nullable
as int,tokensUsed: null == tokensUsed ? _self.tokensUsed : tokensUsed // ignore: cast_nullable_to_non_nullable
as int,tokensRemaining: null == tokensRemaining ? _self.tokensRemaining : tokensRemaining // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CertificateItemStatus,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceIds: null == invoiceIds ? _self.invoiceIds : invoiceIds // ignore: cast_nullable_to_non_nullable
as List<int>,invoices: null == invoices ? _self.invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificateItem].
extension CertificateItemPatterns on CertificateItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CertificateItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificateItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CertificateItem value)  $default,){
final _that = this;
switch (_that) {
case _CertificateItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CertificateItem value)?  $default,){
final _that = this;
switch (_that) {
case _CertificateItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'product_offer_id')  int productOfferId, @JsonKey(name: 'product_offer_name', includeToJson: false)  String productOfferName,  double amount,  String currency, @JsonKey(name: 'tokens_total')  int tokensTotal, @JsonKey(name: 'tokens_initial')  int tokensInitial, @JsonKey(name: 'tokens_used')  int tokensUsed, @JsonKey(name: 'tokens_remaining')  int tokensRemaining,  CertificateItemStatus status, @JsonKey(name: 'activated_at')  DateTime? activatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'invoice_ids', includeToJson: false)  List<int> invoiceIds, @JsonKey(name: 'invoices', includeToJson: false)  List<Invoice> invoices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificateItem() when $default != null:
return $default(_that.id,_that.certificateId,_that.productOfferId,_that.productOfferName,_that.amount,_that.currency,_that.tokensTotal,_that.tokensInitial,_that.tokensUsed,_that.tokensRemaining,_that.status,_that.activatedAt,_that.expiresAt,_that.createdAt,_that.invoiceIds,_that.invoices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'product_offer_id')  int productOfferId, @JsonKey(name: 'product_offer_name', includeToJson: false)  String productOfferName,  double amount,  String currency, @JsonKey(name: 'tokens_total')  int tokensTotal, @JsonKey(name: 'tokens_initial')  int tokensInitial, @JsonKey(name: 'tokens_used')  int tokensUsed, @JsonKey(name: 'tokens_remaining')  int tokensRemaining,  CertificateItemStatus status, @JsonKey(name: 'activated_at')  DateTime? activatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'invoice_ids', includeToJson: false)  List<int> invoiceIds, @JsonKey(name: 'invoices', includeToJson: false)  List<Invoice> invoices)  $default,) {final _that = this;
switch (_that) {
case _CertificateItem():
return $default(_that.id,_that.certificateId,_that.productOfferId,_that.productOfferName,_that.amount,_that.currency,_that.tokensTotal,_that.tokensInitial,_that.tokensUsed,_that.tokensRemaining,_that.status,_that.activatedAt,_that.expiresAt,_that.createdAt,_that.invoiceIds,_that.invoices);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'product_offer_id')  int productOfferId, @JsonKey(name: 'product_offer_name', includeToJson: false)  String productOfferName,  double amount,  String currency, @JsonKey(name: 'tokens_total')  int tokensTotal, @JsonKey(name: 'tokens_initial')  int tokensInitial, @JsonKey(name: 'tokens_used')  int tokensUsed, @JsonKey(name: 'tokens_remaining')  int tokensRemaining,  CertificateItemStatus status, @JsonKey(name: 'activated_at')  DateTime? activatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'invoice_ids', includeToJson: false)  List<int> invoiceIds, @JsonKey(name: 'invoices', includeToJson: false)  List<Invoice> invoices)?  $default,) {final _that = this;
switch (_that) {
case _CertificateItem() when $default != null:
return $default(_that.id,_that.certificateId,_that.productOfferId,_that.productOfferName,_that.amount,_that.currency,_that.tokensTotal,_that.tokensInitial,_that.tokensUsed,_that.tokensRemaining,_that.status,_that.activatedAt,_that.expiresAt,_that.createdAt,_that.invoiceIds,_that.invoices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CertificateItem extends CertificateItem {
  const _CertificateItem({this.id, @JsonKey(name: 'certificate_id') this.certificateId = 0, @JsonKey(name: 'product_offer_id') this.productOfferId = 0, @JsonKey(name: 'product_offer_name', includeToJson: false) this.productOfferName = "", this.amount = 0, this.currency = 'RUB', @JsonKey(name: 'tokens_total') this.tokensTotal = 0, @JsonKey(name: 'tokens_initial') this.tokensInitial = 0, @JsonKey(name: 'tokens_used') this.tokensUsed = 0, @JsonKey(name: 'tokens_remaining') this.tokensRemaining = 0, this.status = CertificateItemStatus.created, @JsonKey(name: 'activated_at') this.activatedAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'invoice_ids', includeToJson: false) final  List<int> invoiceIds = const [], @JsonKey(name: 'invoices', includeToJson: false) final  List<Invoice> invoices = const []}): _invoiceIds = invoiceIds,_invoices = invoices,super._();
  factory _CertificateItem.fromJson(Map<String, dynamic> json) => _$CertificateItemFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'certificate_id') final  int certificateId;
@override@JsonKey(name: 'product_offer_id') final  int productOfferId;
@override@JsonKey(name: 'product_offer_name', includeToJson: false) final  String productOfferName;
@override@JsonKey() final  double amount;
@override@JsonKey() final  String currency;
@override@JsonKey(name: 'tokens_total') final  int tokensTotal;
@override@JsonKey(name: 'tokens_initial') final  int tokensInitial;
@override@JsonKey(name: 'tokens_used') final  int tokensUsed;
@override@JsonKey(name: 'tokens_remaining') final  int tokensRemaining;
@override@JsonKey() final  CertificateItemStatus status;
@override@JsonKey(name: 'activated_at') final  DateTime? activatedAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
 final  List<int> _invoiceIds;
@override@JsonKey(name: 'invoice_ids', includeToJson: false) List<int> get invoiceIds {
  if (_invoiceIds is EqualUnmodifiableListView) return _invoiceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoiceIds);
}

 final  List<Invoice> _invoices;
@override@JsonKey(name: 'invoices', includeToJson: false) List<Invoice> get invoices {
  if (_invoices is EqualUnmodifiableListView) return _invoices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoices);
}


/// Create a copy of CertificateItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificateItemCopyWith<_CertificateItem> get copyWith => __$CertificateItemCopyWithImpl<_CertificateItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificateItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificateItem&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.productOfferId, productOfferId) || other.productOfferId == productOfferId)&&(identical(other.productOfferName, productOfferName) || other.productOfferName == productOfferName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.tokensTotal, tokensTotal) || other.tokensTotal == tokensTotal)&&(identical(other.tokensInitial, tokensInitial) || other.tokensInitial == tokensInitial)&&(identical(other.tokensUsed, tokensUsed) || other.tokensUsed == tokensUsed)&&(identical(other.tokensRemaining, tokensRemaining) || other.tokensRemaining == tokensRemaining)&&(identical(other.status, status) || other.status == status)&&(identical(other.activatedAt, activatedAt) || other.activatedAt == activatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._invoiceIds, _invoiceIds)&&const DeepCollectionEquality().equals(other._invoices, _invoices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,certificateId,productOfferId,productOfferName,amount,currency,tokensTotal,tokensInitial,tokensUsed,tokensRemaining,status,activatedAt,expiresAt,createdAt,const DeepCollectionEquality().hash(_invoiceIds),const DeepCollectionEquality().hash(_invoices));

@override
String toString() {
  return 'CertificateItem(id: $id, certificateId: $certificateId, productOfferId: $productOfferId, productOfferName: $productOfferName, amount: $amount, currency: $currency, tokensTotal: $tokensTotal, tokensInitial: $tokensInitial, tokensUsed: $tokensUsed, tokensRemaining: $tokensRemaining, status: $status, activatedAt: $activatedAt, expiresAt: $expiresAt, createdAt: $createdAt, invoiceIds: $invoiceIds, invoices: $invoices)';
}


}

/// @nodoc
abstract mixin class _$CertificateItemCopyWith<$Res> implements $CertificateItemCopyWith<$Res> {
  factory _$CertificateItemCopyWith(_CertificateItem value, $Res Function(_CertificateItem) _then) = __$CertificateItemCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_id') int certificateId,@JsonKey(name: 'product_offer_id') int productOfferId,@JsonKey(name: 'product_offer_name', includeToJson: false) String productOfferName, double amount, String currency,@JsonKey(name: 'tokens_total') int tokensTotal,@JsonKey(name: 'tokens_initial') int tokensInitial,@JsonKey(name: 'tokens_used') int tokensUsed,@JsonKey(name: 'tokens_remaining') int tokensRemaining, CertificateItemStatus status,@JsonKey(name: 'activated_at') DateTime? activatedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'invoice_ids', includeToJson: false) List<int> invoiceIds,@JsonKey(name: 'invoices', includeToJson: false) List<Invoice> invoices
});




}
/// @nodoc
class __$CertificateItemCopyWithImpl<$Res>
    implements _$CertificateItemCopyWith<$Res> {
  __$CertificateItemCopyWithImpl(this._self, this._then);

  final _CertificateItem _self;
  final $Res Function(_CertificateItem) _then;

/// Create a copy of CertificateItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? certificateId = null,Object? productOfferId = null,Object? productOfferName = null,Object? amount = null,Object? currency = null,Object? tokensTotal = null,Object? tokensInitial = null,Object? tokensUsed = null,Object? tokensRemaining = null,Object? status = null,Object? activatedAt = freezed,Object? expiresAt = freezed,Object? createdAt = freezed,Object? invoiceIds = null,Object? invoices = null,}) {
  return _then(_CertificateItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateId: null == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int,productOfferId: null == productOfferId ? _self.productOfferId : productOfferId // ignore: cast_nullable_to_non_nullable
as int,productOfferName: null == productOfferName ? _self.productOfferName : productOfferName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,tokensTotal: null == tokensTotal ? _self.tokensTotal : tokensTotal // ignore: cast_nullable_to_non_nullable
as int,tokensInitial: null == tokensInitial ? _self.tokensInitial : tokensInitial // ignore: cast_nullable_to_non_nullable
as int,tokensUsed: null == tokensUsed ? _self.tokensUsed : tokensUsed // ignore: cast_nullable_to_non_nullable
as int,tokensRemaining: null == tokensRemaining ? _self.tokensRemaining : tokensRemaining // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CertificateItemStatus,activatedAt: freezed == activatedAt ? _self.activatedAt : activatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,invoiceIds: null == invoiceIds ? _self._invoiceIds : invoiceIds // ignore: cast_nullable_to_non_nullable
as List<int>,invoices: null == invoices ? _self._invoices : invoices // ignore: cast_nullable_to_non_nullable
as List<Invoice>,
  ));
}


}

// dart format on
