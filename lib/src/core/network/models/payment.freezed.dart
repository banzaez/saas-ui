// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {

 int? get id;@JsonKey(name: 'company_id') int get companyId;@JsonKey(name: 'company_name', includeToJson: false) String get companyName;@JsonKey(name: 'legal_entity_id') int get legalEntityId;@JsonKey(name: 'legal_entity_name', includeToJson: false) String get legalEntityName;@JsonKey(name: 'certificate_item_id') int get certificateItemId; PaymentStatus get status; PaymentMethod get method;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'paid_at') DateTime? get paidAt;@JsonKey(name: 'payment_link') String? get paymentLink;@JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson) Uint8List? get qrCodeImage; double get amount;@JsonKey(name: 'amount_paid') double get amountPaid; String get currency;@JsonKey(name: 'invoice_id') int? get invoiceId;@JsonKey(name: 'invoice') InvoiceData? get invoice;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.legalEntityName, legalEntityName) || other.legalEntityName == legalEntityName)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.status, status) || other.status == status)&&(identical(other.method, method) || other.method == method)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.paymentLink, paymentLink) || other.paymentLink == paymentLink)&&const DeepCollectionEquality().equals(other.qrCodeImage, qrCodeImage)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.invoice, invoice) || other.invoice == invoice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,companyName,legalEntityId,legalEntityName,certificateItemId,status,method,createdAt,paidAt,paymentLink,const DeepCollectionEquality().hash(qrCodeImage),amount,amountPaid,currency,invoiceId,invoice);

@override
String toString() {
  return 'Payment(id: $id, companyId: $companyId, companyName: $companyName, legalEntityId: $legalEntityId, legalEntityName: $legalEntityName, certificateItemId: $certificateItemId, status: $status, method: $method, createdAt: $createdAt, paidAt: $paidAt, paymentLink: $paymentLink, qrCodeImage: $qrCodeImage, amount: $amount, amountPaid: $amountPaid, currency: $currency, invoiceId: $invoiceId, invoice: $invoice)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName,@JsonKey(name: 'legal_entity_id') int legalEntityId,@JsonKey(name: 'legal_entity_name', includeToJson: false) String legalEntityName,@JsonKey(name: 'certificate_item_id') int certificateItemId, PaymentStatus status, PaymentMethod method,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'paid_at') DateTime? paidAt,@JsonKey(name: 'payment_link') String? paymentLink,@JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson) Uint8List? qrCodeImage, double amount,@JsonKey(name: 'amount_paid') double amountPaid, String currency,@JsonKey(name: 'invoice_id') int? invoiceId,@JsonKey(name: 'invoice') InvoiceData? invoice
});


$InvoiceDataCopyWith<$Res>? get invoice;

}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyId = null,Object? companyName = null,Object? legalEntityId = null,Object? legalEntityName = null,Object? certificateItemId = null,Object? status = null,Object? method = null,Object? createdAt = freezed,Object? paidAt = freezed,Object? paymentLink = freezed,Object? qrCodeImage = freezed,Object? amount = null,Object? amountPaid = null,Object? currency = null,Object? invoiceId = freezed,Object? invoice = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,legalEntityName: null == legalEntityName ? _self.legalEntityName : legalEntityName // ignore: cast_nullable_to_non_nullable
as String,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentLink: freezed == paymentLink ? _self.paymentLink : paymentLink // ignore: cast_nullable_to_non_nullable
as String?,qrCodeImage: freezed == qrCodeImage ? _self.qrCodeImage : qrCodeImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,invoiceId: freezed == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as int?,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceData?,
  ));
}
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceDataCopyWith<$Res>? get invoice {
    if (_self.invoice == null) {
    return null;
  }

  return $InvoiceDataCopyWith<$Res>(_self.invoice!, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}
}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'legal_entity_name', includeToJson: false)  String legalEntityName, @JsonKey(name: 'certificate_item_id')  int certificateItemId,  PaymentStatus status,  PaymentMethod method, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'payment_link')  String? paymentLink, @JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson)  Uint8List? qrCodeImage,  double amount, @JsonKey(name: 'amount_paid')  double amountPaid,  String currency, @JsonKey(name: 'invoice_id')  int? invoiceId, @JsonKey(name: 'invoice')  InvoiceData? invoice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.companyId,_that.companyName,_that.legalEntityId,_that.legalEntityName,_that.certificateItemId,_that.status,_that.method,_that.createdAt,_that.paidAt,_that.paymentLink,_that.qrCodeImage,_that.amount,_that.amountPaid,_that.currency,_that.invoiceId,_that.invoice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'legal_entity_name', includeToJson: false)  String legalEntityName, @JsonKey(name: 'certificate_item_id')  int certificateItemId,  PaymentStatus status,  PaymentMethod method, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'payment_link')  String? paymentLink, @JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson)  Uint8List? qrCodeImage,  double amount, @JsonKey(name: 'amount_paid')  double amountPaid,  String currency, @JsonKey(name: 'invoice_id')  int? invoiceId, @JsonKey(name: 'invoice')  InvoiceData? invoice)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.companyId,_that.companyName,_that.legalEntityId,_that.legalEntityName,_that.certificateItemId,_that.status,_that.method,_that.createdAt,_that.paidAt,_that.paymentLink,_that.qrCodeImage,_that.amount,_that.amountPaid,_that.currency,_that.invoiceId,_that.invoice);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName, @JsonKey(name: 'legal_entity_id')  int legalEntityId, @JsonKey(name: 'legal_entity_name', includeToJson: false)  String legalEntityName, @JsonKey(name: 'certificate_item_id')  int certificateItemId,  PaymentStatus status,  PaymentMethod method, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'payment_link')  String? paymentLink, @JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson)  Uint8List? qrCodeImage,  double amount, @JsonKey(name: 'amount_paid')  double amountPaid,  String currency, @JsonKey(name: 'invoice_id')  int? invoiceId, @JsonKey(name: 'invoice')  InvoiceData? invoice)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.companyId,_that.companyName,_that.legalEntityId,_that.legalEntityName,_that.certificateItemId,_that.status,_that.method,_that.createdAt,_that.paidAt,_that.paymentLink,_that.qrCodeImage,_that.amount,_that.amountPaid,_that.currency,_that.invoiceId,_that.invoice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment extends Payment {
  const _Payment({this.id, @JsonKey(name: 'company_id') this.companyId = 0, @JsonKey(name: 'company_name', includeToJson: false) this.companyName = "", @JsonKey(name: 'legal_entity_id') this.legalEntityId = 0, @JsonKey(name: 'legal_entity_name', includeToJson: false) this.legalEntityName = "", @JsonKey(name: 'certificate_item_id') this.certificateItemId = 0, this.status = PaymentStatus.created, this.method = PaymentMethod.bankTransfer, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'paid_at') this.paidAt, @JsonKey(name: 'payment_link') this.paymentLink, @JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson) this.qrCodeImage, this.amount = 0, @JsonKey(name: 'amount_paid') this.amountPaid = 0, this.currency = 'RUB', @JsonKey(name: 'invoice_id') this.invoiceId, @JsonKey(name: 'invoice') this.invoice}): super._();
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'company_id') final  int companyId;
@override@JsonKey(name: 'company_name', includeToJson: false) final  String companyName;
@override@JsonKey(name: 'legal_entity_id') final  int legalEntityId;
@override@JsonKey(name: 'legal_entity_name', includeToJson: false) final  String legalEntityName;
@override@JsonKey(name: 'certificate_item_id') final  int certificateItemId;
@override@JsonKey() final  PaymentStatus status;
@override@JsonKey() final  PaymentMethod method;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'paid_at') final  DateTime? paidAt;
@override@JsonKey(name: 'payment_link') final  String? paymentLink;
@override@JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson) final  Uint8List? qrCodeImage;
@override@JsonKey() final  double amount;
@override@JsonKey(name: 'amount_paid') final  double amountPaid;
@override@JsonKey() final  String currency;
@override@JsonKey(name: 'invoice_id') final  int? invoiceId;
@override@JsonKey(name: 'invoice') final  InvoiceData? invoice;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.legalEntityName, legalEntityName) || other.legalEntityName == legalEntityName)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.status, status) || other.status == status)&&(identical(other.method, method) || other.method == method)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.paymentLink, paymentLink) || other.paymentLink == paymentLink)&&const DeepCollectionEquality().equals(other.qrCodeImage, qrCodeImage)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.amountPaid, amountPaid) || other.amountPaid == amountPaid)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.invoiceId, invoiceId) || other.invoiceId == invoiceId)&&(identical(other.invoice, invoice) || other.invoice == invoice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,companyName,legalEntityId,legalEntityName,certificateItemId,status,method,createdAt,paidAt,paymentLink,const DeepCollectionEquality().hash(qrCodeImage),amount,amountPaid,currency,invoiceId,invoice);

@override
String toString() {
  return 'Payment(id: $id, companyId: $companyId, companyName: $companyName, legalEntityId: $legalEntityId, legalEntityName: $legalEntityName, certificateItemId: $certificateItemId, status: $status, method: $method, createdAt: $createdAt, paidAt: $paidAt, paymentLink: $paymentLink, qrCodeImage: $qrCodeImage, amount: $amount, amountPaid: $amountPaid, currency: $currency, invoiceId: $invoiceId, invoice: $invoice)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName,@JsonKey(name: 'legal_entity_id') int legalEntityId,@JsonKey(name: 'legal_entity_name', includeToJson: false) String legalEntityName,@JsonKey(name: 'certificate_item_id') int certificateItemId, PaymentStatus status, PaymentMethod method,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'paid_at') DateTime? paidAt,@JsonKey(name: 'payment_link') String? paymentLink,@JsonKey(name: 'qr_code_image', fromJson: _qrCodeImageFromJson) Uint8List? qrCodeImage, double amount,@JsonKey(name: 'amount_paid') double amountPaid, String currency,@JsonKey(name: 'invoice_id') int? invoiceId,@JsonKey(name: 'invoice') InvoiceData? invoice
});


@override $InvoiceDataCopyWith<$Res>? get invoice;

}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyId = null,Object? companyName = null,Object? legalEntityId = null,Object? legalEntityName = null,Object? certificateItemId = null,Object? status = null,Object? method = null,Object? createdAt = freezed,Object? paidAt = freezed,Object? paymentLink = freezed,Object? qrCodeImage = freezed,Object? amount = null,Object? amountPaid = null,Object? currency = null,Object? invoiceId = freezed,Object? invoice = freezed,}) {
  return _then(_Payment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,legalEntityName: null == legalEntityName ? _self.legalEntityName : legalEntityName // ignore: cast_nullable_to_non_nullable
as String,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentLink: freezed == paymentLink ? _self.paymentLink : paymentLink // ignore: cast_nullable_to_non_nullable
as String?,qrCodeImage: freezed == qrCodeImage ? _self.qrCodeImage : qrCodeImage // ignore: cast_nullable_to_non_nullable
as Uint8List?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,amountPaid: null == amountPaid ? _self.amountPaid : amountPaid // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,invoiceId: freezed == invoiceId ? _self.invoiceId : invoiceId // ignore: cast_nullable_to_non_nullable
as int?,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceData?,
  ));
}

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceDataCopyWith<$Res>? get invoice {
    if (_self.invoice == null) {
    return null;
  }

  return $InvoiceDataCopyWith<$Res>(_self.invoice!, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}
}


/// @nodoc
mixin _$InvoiceData {

 int get id;@JsonKey(name: 'legal_entity_id') int get legalEntityId; double get amount; String get currency;@JsonKey(name: 'invoice_number') String get invoiceNumber;
/// Create a copy of InvoiceData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceDataCopyWith<InvoiceData> get copyWith => _$InvoiceDataCopyWithImpl<InvoiceData>(this as InvoiceData, _$identity);

  /// Serializes this InvoiceData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceData&&(identical(other.id, id) || other.id == id)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,legalEntityId,amount,currency,invoiceNumber);

@override
String toString() {
  return 'InvoiceData(id: $id, legalEntityId: $legalEntityId, amount: $amount, currency: $currency, invoiceNumber: $invoiceNumber)';
}


}

/// @nodoc
abstract mixin class $InvoiceDataCopyWith<$Res>  {
  factory $InvoiceDataCopyWith(InvoiceData value, $Res Function(InvoiceData) _then) = _$InvoiceDataCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'legal_entity_id') int legalEntityId, double amount, String currency,@JsonKey(name: 'invoice_number') String invoiceNumber
});




}
/// @nodoc
class _$InvoiceDataCopyWithImpl<$Res>
    implements $InvoiceDataCopyWith<$Res> {
  _$InvoiceDataCopyWithImpl(this._self, this._then);

  final InvoiceData _self;
  final $Res Function(InvoiceData) _then;

/// Create a copy of InvoiceData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? legalEntityId = null,Object? amount = null,Object? currency = null,Object? invoiceNumber = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InvoiceData].
extension InvoiceDataPatterns on InvoiceData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvoiceData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvoiceData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvoiceData value)  $default,){
final _that = this;
switch (_that) {
case _InvoiceData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvoiceData value)?  $default,){
final _that = this;
switch (_that) {
case _InvoiceData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'legal_entity_id')  int legalEntityId,  double amount,  String currency, @JsonKey(name: 'invoice_number')  String invoiceNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvoiceData() when $default != null:
return $default(_that.id,_that.legalEntityId,_that.amount,_that.currency,_that.invoiceNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'legal_entity_id')  int legalEntityId,  double amount,  String currency, @JsonKey(name: 'invoice_number')  String invoiceNumber)  $default,) {final _that = this;
switch (_that) {
case _InvoiceData():
return $default(_that.id,_that.legalEntityId,_that.amount,_that.currency,_that.invoiceNumber);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'legal_entity_id')  int legalEntityId,  double amount,  String currency, @JsonKey(name: 'invoice_number')  String invoiceNumber)?  $default,) {final _that = this;
switch (_that) {
case _InvoiceData() when $default != null:
return $default(_that.id,_that.legalEntityId,_that.amount,_that.currency,_that.invoiceNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvoiceData implements InvoiceData {
  const _InvoiceData({required this.id, @JsonKey(name: 'legal_entity_id') required this.legalEntityId, required this.amount, required this.currency, @JsonKey(name: 'invoice_number') required this.invoiceNumber});
  factory _InvoiceData.fromJson(Map<String, dynamic> json) => _$InvoiceDataFromJson(json);

@override final  int id;
@override@JsonKey(name: 'legal_entity_id') final  int legalEntityId;
@override final  double amount;
@override final  String currency;
@override@JsonKey(name: 'invoice_number') final  String invoiceNumber;

/// Create a copy of InvoiceData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceDataCopyWith<_InvoiceData> get copyWith => __$InvoiceDataCopyWithImpl<_InvoiceData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceData&&(identical(other.id, id) || other.id == id)&&(identical(other.legalEntityId, legalEntityId) || other.legalEntityId == legalEntityId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.invoiceNumber, invoiceNumber) || other.invoiceNumber == invoiceNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,legalEntityId,amount,currency,invoiceNumber);

@override
String toString() {
  return 'InvoiceData(id: $id, legalEntityId: $legalEntityId, amount: $amount, currency: $currency, invoiceNumber: $invoiceNumber)';
}


}

/// @nodoc
abstract mixin class _$InvoiceDataCopyWith<$Res> implements $InvoiceDataCopyWith<$Res> {
  factory _$InvoiceDataCopyWith(_InvoiceData value, $Res Function(_InvoiceData) _then) = __$InvoiceDataCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'legal_entity_id') int legalEntityId, double amount, String currency,@JsonKey(name: 'invoice_number') String invoiceNumber
});




}
/// @nodoc
class __$InvoiceDataCopyWithImpl<$Res>
    implements _$InvoiceDataCopyWith<$Res> {
  __$InvoiceDataCopyWithImpl(this._self, this._then);

  final _InvoiceData _self;
  final $Res Function(_InvoiceData) _then;

/// Create a copy of InvoiceData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? legalEntityId = null,Object? amount = null,Object? currency = null,Object? invoiceNumber = null,}) {
  return _then(_InvoiceData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,legalEntityId: null == legalEntityId ? _self.legalEntityId : legalEntityId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,invoiceNumber: null == invoiceNumber ? _self.invoiceNumber : invoiceNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
