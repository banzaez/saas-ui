// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Invoice {

 int? get id;@JsonKey(name: 'company_id') int get companyId;@JsonKey(name: 'invoice_number') String get invoiceNumber;@JsonKey(name: 'created_at') DateTime? get createdAt; double get amount; String get currency; InvoiceStatus get status;@JsonKey(name: 'certificate_item_id') int get certificateItemId;@JsonKey(name: 'legal_entity_id') int get legalEntityId;@JsonKey(name: 'transaction_id') String get transactionId; PaymentMethod get method;@JsonKey(name: 'company', includeToJson: false) Company? get company;@JsonKey(name: 'buyer', includeToJson: false) LegalEntity? get buyer;@JsonKey(name: 'seller', includeToJson: false) LegalEntity? get seller;@JsonKey(name: 'product_offers', includeToJson: false) List<ProductOffer> get productOffers;
/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceCopyWith<Invoice> get copyWith => _$InvoiceCopyWithImpl<Invoice>(this as Invoice, _$identity);

  /// Serializes this Invoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.status, status) || other.status == status)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.method, method) || other.method == method)&&(identical(other.company, company) || other.company == company)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other.productOffers, productOffers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,invoiceNumber,createdAt,amount,currency,status,certificateItemId,legalEntityId,transactionId,method,company,buyer,seller,const DeepCollectionEquality().hash(productOffers));

@override
String toString() {
  return 'Invoice(id: $id, companyId: $companyId, invoiceNumber: $invoiceNumber, createdAt: $createdAt, amount: $amount, currency: $currency, status: $status, certificateItemId: $certificateItemId, legalEntityId: $legalEntityId, transactionId: $transactionId, method: $method, company: $company, buyer: $buyer, seller: $seller, productOffers: $productOffers)';
}


}

/// @nodoc
abstract mixin class $InvoiceCopyWith<$Res>  {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) _then) = _$InvoiceCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'invoice_number') String invoiceNumber,@JsonKey(name: 'created_at') DateTime? createdAt, double amount, String currency, InvoiceStatus status,@JsonKey(name: 'certificate_item_id') int certificateItemId,@JsonKey(name: 'legal_entity_id') int legalEntityId,@JsonKey(name: 'transaction_id') String transactionId, PaymentMethod method,@JsonKey(name: 'company', includeToJson: false) Company? company,@JsonKey(name: 'buyer', includeToJson: false) LegalEntity? buyer,@JsonKey(name: 'seller', includeToJson: false) LegalEntity? seller,@JsonKey(name: 'product_offers', includeToJson: false) List<ProductOffer> productOffers
});


$CompanyCopyWith<$Res>? get company;$LegalEntityCopyWith<$Res>? get buyer;$LegalEntityCopyWith<$Res>? get seller;

}
/// @nodoc
class _$InvoiceCopyWithImpl<$Res>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._self, this._then);

  final Invoice _self;
  final $Res Function(Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyId = null,Object? invoiceNumber = null,Object? createdAt = freezed,Object? amount = null,Object? currency = null,Object? status = null,Object? certificateItemId = null,Object? legalEntityId = null,Object? transactionId = null,Object? method = null,Object? company = freezed,Object? buyer = freezed,Object? seller = freezed,Object? productOffers = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company?,buyer: freezed == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as LegalEntity?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as LegalEntity?,productOffers: null == productOffers ? _self.productOffers : productOffers // ignore: cast_nullable_to_non_nullable
as List<ProductOffer>,
  ));
}
/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LegalEntityCopyWith<$Res>? get buyer {
    if (_self.buyer == null) {
    return null;
  }

  return $LegalEntityCopyWith<$Res>(_self.buyer!, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LegalEntityCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $LegalEntityCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// Adds pattern-matching-related methods to [Invoice].
extension InvoicePatterns on Invoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invoice value)  $default,){
final _that = this;
switch (_that) {
case _Invoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invoice value)?  $default,){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'invoice_number')  String invoiceNumber, @JsonKey(name: 'created_at')  DateTime? createdAt,  double amount,  String currency,  InvoiceStatus status, @JsonKey(name: 'certificate_item_id')  int certificateItemId, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'transaction_id')  String transactionId,  PaymentMethod method, @JsonKey(name: 'company', includeToJson: false)  Company? company, @JsonKey(name: 'buyer', includeToJson: false)  LegalEntity? buyer, @JsonKey(name: 'seller', includeToJson: false)  LegalEntity? seller, @JsonKey(name: 'product_offers', includeToJson: false)  List<ProductOffer> productOffers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.companyId,_that.invoiceNumber,_that.createdAt,_that.amount,_that.currency,_that.status,_that.certificateItemId,_that.legalEntityId,_that.transactionId,_that.method,_that.company,_that.buyer,_that.seller,_that.productOffers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'invoice_number')  String invoiceNumber, @JsonKey(name: 'created_at')  DateTime? createdAt,  double amount,  String currency,  InvoiceStatus status, @JsonKey(name: 'certificate_item_id')  int certificateItemId, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'transaction_id')  String transactionId,  PaymentMethod method, @JsonKey(name: 'company', includeToJson: false)  Company? company, @JsonKey(name: 'buyer', includeToJson: false)  LegalEntity? buyer, @JsonKey(name: 'seller', includeToJson: false)  LegalEntity? seller, @JsonKey(name: 'product_offers', includeToJson: false)  List<ProductOffer> productOffers)  $default,) {final _that = this;
switch (_that) {
case _Invoice():
return $default(_that.id,_that.companyId,_that.invoiceNumber,_that.createdAt,_that.amount,_that.currency,_that.status,_that.certificateItemId,_that.legalEntityId,_that.transactionId,_that.method,_that.company,_that.buyer,_that.seller,_that.productOffers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'invoice_number')  String invoiceNumber, @JsonKey(name: 'created_at')  DateTime? createdAt,  double amount,  String currency,  InvoiceStatus status, @JsonKey(name: 'certificate_item_id')  int certificateItemId, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'transaction_id')  String transactionId,  PaymentMethod method, @JsonKey(name: 'company', includeToJson: false)  Company? company, @JsonKey(name: 'buyer', includeToJson: false)  LegalEntity? buyer, @JsonKey(name: 'seller', includeToJson: false)  LegalEntity? seller, @JsonKey(name: 'product_offers', includeToJson: false)  List<ProductOffer> productOffers)?  $default,) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.companyId,_that.invoiceNumber,_that.createdAt,_that.amount,_that.currency,_that.status,_that.certificateItemId,_that.legalEntityId,_that.transactionId,_that.method,_that.company,_that.buyer,_that.seller,_that.productOffers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Invoice extends Invoice {
  const _Invoice({this.id, @JsonKey(name: 'company_id') this.companyId = 0, @JsonKey(name: 'invoice_number') this.invoiceNumber = "", @JsonKey(name: 'created_at') this.createdAt, this.amount = 0, this.currency = 'RUB', this.status = InvoiceStatus.pending, @JsonKey(name: 'certificate_item_id') this.certificateItemId = 0, @JsonKey(name: 'legal_entity_id') this.legalEntityId = 0, @JsonKey(name: 'transaction_id') this.transactionId = "", this.method = PaymentMethod.bankTransfer, @JsonKey(name: 'company', includeToJson: false) this.company, @JsonKey(name: 'buyer', includeToJson: false) this.buyer, @JsonKey(name: 'seller', includeToJson: false) this.seller, @JsonKey(name: 'product_offers', includeToJson: false) final  List<ProductOffer> productOffers = const []}): _productOffers = productOffers,super._();
  factory _Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'company_id') final  int companyId;
@override@JsonKey(name: 'invoice_number') final  String invoiceNumber;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey() final  double amount;
@override@JsonKey() final  String currency;
@override@JsonKey() final  InvoiceStatus status;
@override@JsonKey(name: 'certificate_item_id') final  int certificateItemId;
@override@JsonKey(name: 'legal_entity_id') final  int legalEntityId;
@override@JsonKey(name: 'transaction_id') final  String transactionId;
@override@JsonKey() final  PaymentMethod method;
@override@JsonKey(name: 'company', includeToJson: false) final  Company? company;
@override@JsonKey(name: 'buyer', includeToJson: false) final  LegalEntity? buyer;
@override@JsonKey(name: 'seller', includeToJson: false) final  LegalEntity? seller;
 final  List<ProductOffer> _productOffers;
@override@JsonKey(name: 'product_offers', includeToJson: false) List<ProductOffer> get productOffers {
  if (_productOffers is EqualUnmodifiableListView) return _productOffers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_productOffers);
}


/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceCopyWith<_Invoice> get copyWith => __$InvoiceCopyWithImpl<_Invoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.status, status) || other.status == status)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.method, method) || other.method == method)&&(identical(other.company, company) || other.company == company)&&(identical(other.buyer, buyer) || other.buyer == buyer)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other._productOffers, _productOffers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,invoiceNumber,createdAt,amount,currency,status,certificateItemId,legalEntityId,transactionId,method,company,buyer,seller,const DeepCollectionEquality().hash(_productOffers));

@override
String toString() {
  return 'Invoice(id: $id, companyId: $companyId, invoiceNumber: $invoiceNumber, createdAt: $createdAt, amount: $amount, currency: $currency, status: $status, certificateItemId: $certificateItemId, legalEntityId: $legalEntityId, transactionId: $transactionId, method: $method, company: $company, buyer: $buyer, seller: $seller, productOffers: $productOffers)';
}


}

/// @nodoc
abstract mixin class _$InvoiceCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$InvoiceCopyWith(_Invoice value, $Res Function(_Invoice) _then) = __$InvoiceCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'invoice_number') String invoiceNumber,@JsonKey(name: 'created_at') DateTime? createdAt, double amount, String currency, InvoiceStatus status,@JsonKey(name: 'certificate_item_id') int certificateItemId,@JsonKey(name: 'legal_entity_id') int legalEntityId,@JsonKey(name: 'transaction_id') String transactionId, PaymentMethod method,@JsonKey(name: 'company', includeToJson: false) Company? company,@JsonKey(name: 'buyer', includeToJson: false) LegalEntity? buyer,@JsonKey(name: 'seller', includeToJson: false) LegalEntity? seller,@JsonKey(name: 'product_offers', includeToJson: false) List<ProductOffer> productOffers
});


@override $CompanyCopyWith<$Res>? get company;@override $LegalEntityCopyWith<$Res>? get buyer;@override $LegalEntityCopyWith<$Res>? get seller;

}
/// @nodoc
class __$InvoiceCopyWithImpl<$Res>
    implements _$InvoiceCopyWith<$Res> {
  __$InvoiceCopyWithImpl(this._self, this._then);

  final _Invoice _self;
  final $Res Function(_Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyId = null,Object? invoiceNumber = null,Object? createdAt = freezed,Object? amount = null,Object? currency = null,Object? status = null,Object? certificateItemId = null,Object? legalEntityId = null,Object? transactionId = null,Object? method = null,Object? company = freezed,Object? buyer = freezed,Object? seller = freezed,Object? productOffers = null,}) {
  return _then(_Invoice(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InvoiceStatus,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as Company?,buyer: freezed == buyer ? _self.buyer : buyer // ignore: cast_nullable_to_non_nullable
as LegalEntity?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as LegalEntity?,productOffers: null == productOffers ? _self._productOffers : productOffers // ignore: cast_nullable_to_non_nullable
as List<ProductOffer>,
  ));
}

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyCopyWith<$Res>? get company {
    if (_self.company == null) {
    return null;
  }

  return $CompanyCopyWith<$Res>(_self.company!, (value) {
    return _then(_self.copyWith(company: value));
  });
}/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LegalEntityCopyWith<$Res>? get buyer {
    if (_self.buyer == null) {
    return null;
  }

  return $LegalEntityCopyWith<$Res>(_self.buyer!, (value) {
    return _then(_self.copyWith(buyer: value));
  });
}/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LegalEntityCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $LegalEntityCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}

// dart format on
