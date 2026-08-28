// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LegalEntity {

 int? get id;@JsonKey(name: 'company_id') int get companyId;@JsonKey(name: 'company_name', includeToJson: false) String get companyName; String get inn; String get kpp;@JsonKey(name: 'full_name') String get fullName; String get bank;@JsonKey(name: 'bank_account') String get bankAccount;@JsonKey(name: 'korr_account') String get korrAccount; String get bik; String get address; String get phone; String get email;@JsonKey(name: 'is_seller') bool get isSeller;
/// Create a copy of LegalEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegalEntityCopyWith<LegalEntity> get copyWith => _$LegalEntityCopyWithImpl<LegalEntity>(this as LegalEntity, _$identity);

  /// Serializes this LegalEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.inn, inn) || other.inn == inn)&&(identical(other.kpp, kpp) || other.kpp == kpp)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.bankAccount, bankAccount) || other.bankAccount == bankAccount)&&(identical(other.korrAccount, korrAccount) || other.korrAccount == korrAccount)&&(identical(other.bik, bik) || other.bik == bik)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isSeller, isSeller) || other.isSeller == isSeller));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,companyName,inn,kpp,fullName,bank,bankAccount,korrAccount,bik,address,phone,email,isSeller);

@override
String toString() {
  return 'LegalEntity(id: $id, companyId: $companyId, companyName: $companyName, inn: $inn, kpp: $kpp, fullName: $fullName, bank: $bank, bankAccount: $bankAccount, korrAccount: $korrAccount, bik: $bik, address: $address, phone: $phone, email: $email, isSeller: $isSeller)';
}


}

/// @nodoc
abstract mixin class $LegalEntityCopyWith<$Res>  {
  factory $LegalEntityCopyWith(LegalEntity value, $Res Function(LegalEntity) _then) = _$LegalEntityCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName, String inn, String kpp,@JsonKey(name: 'full_name') String fullName, String bank,@JsonKey(name: 'bank_account') String bankAccount,@JsonKey(name: 'korr_account') String korrAccount, String bik, String address, String phone, String email,@JsonKey(name: 'is_seller') bool isSeller
});




}
/// @nodoc
class _$LegalEntityCopyWithImpl<$Res>
    implements $LegalEntityCopyWith<$Res> {
  _$LegalEntityCopyWithImpl(this._self, this._then);

  final LegalEntity _self;
  final $Res Function(LegalEntity) _then;

/// Create a copy of LegalEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyId = null,Object? companyName = null,Object? inn = null,Object? kpp = null,Object? fullName = null,Object? bank = null,Object? bankAccount = null,Object? korrAccount = null,Object? bik = null,Object? address = null,Object? phone = null,Object? email = null,Object? isSeller = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,inn: null == inn ? _self.inn : inn // ignore: cast_nullable_to_non_nullable
as String,kpp: null == kpp ? _self.kpp : kpp // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,bank: null == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String,bankAccount: null == bankAccount ? _self.bankAccount : bankAccount // ignore: cast_nullable_to_non_nullable
as String,korrAccount: null == korrAccount ? _self.korrAccount : korrAccount // ignore: cast_nullable_to_non_nullable
as String,bik: null == bik ? _self.bik : bik // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isSeller: null == isSeller ? _self.isSeller : isSeller // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LegalEntity].
extension LegalEntityPatterns on LegalEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegalEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegalEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegalEntity value)  $default,){
final _that = this;
switch (_that) {
case _LegalEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegalEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LegalEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName,  String inn,  String kpp, @JsonKey(name: 'full_name')  String fullName,  String bank, @JsonKey(name: 'bank_account')  String bankAccount, @JsonKey(name: 'korr_account')  String korrAccount,  String bik,  String address,  String phone,  String email, @JsonKey(name: 'is_seller')  bool isSeller)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegalEntity() when $default != null:
return $default(_that.id,_that.companyId,_that.companyName,_that.inn,_that.kpp,_that.fullName,_that.bank,_that.bankAccount,_that.korrAccount,_that.bik,_that.address,_that.phone,_that.email,_that.isSeller);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName,  String inn,  String kpp, @JsonKey(name: 'full_name')  String fullName,  String bank, @JsonKey(name: 'bank_account')  String bankAccount, @JsonKey(name: 'korr_account')  String korrAccount,  String bik,  String address,  String phone,  String email, @JsonKey(name: 'is_seller')  bool isSeller)  $default,) {final _that = this;
switch (_that) {
case _LegalEntity():
return $default(_that.id,_that.companyId,_that.companyName,_that.inn,_that.kpp,_that.fullName,_that.bank,_that.bankAccount,_that.korrAccount,_that.bik,_that.address,_that.phone,_that.email,_that.isSeller);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'company_id')  int companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName,  String inn,  String kpp, @JsonKey(name: 'full_name')  String fullName,  String bank, @JsonKey(name: 'bank_account')  String bankAccount, @JsonKey(name: 'korr_account')  String korrAccount,  String bik,  String address,  String phone,  String email, @JsonKey(name: 'is_seller')  bool isSeller)?  $default,) {final _that = this;
switch (_that) {
case _LegalEntity() when $default != null:
return $default(_that.id,_that.companyId,_that.companyName,_that.inn,_that.kpp,_that.fullName,_that.bank,_that.bankAccount,_that.korrAccount,_that.bik,_that.address,_that.phone,_that.email,_that.isSeller);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LegalEntity extends LegalEntity {
  const _LegalEntity({this.id, @JsonKey(name: 'company_id') this.companyId = 0, @JsonKey(name: 'company_name', includeToJson: false) this.companyName = "", this.inn = "", this.kpp = "", @JsonKey(name: 'full_name') this.fullName = "", this.bank = "", @JsonKey(name: 'bank_account') this.bankAccount = "", @JsonKey(name: 'korr_account') this.korrAccount = "", this.bik = "", this.address = "", this.phone = "", this.email = "", @JsonKey(name: 'is_seller') this.isSeller = false}): super._();
  factory _LegalEntity.fromJson(Map<String, dynamic> json) => _$LegalEntityFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'company_id') final  int companyId;
@override@JsonKey(name: 'company_name', includeToJson: false) final  String companyName;
@override@JsonKey() final  String inn;
@override@JsonKey() final  String kpp;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey() final  String bank;
@override@JsonKey(name: 'bank_account') final  String bankAccount;
@override@JsonKey(name: 'korr_account') final  String korrAccount;
@override@JsonKey() final  String bik;
@override@JsonKey() final  String address;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String email;
@override@JsonKey(name: 'is_seller') final  bool isSeller;

/// Create a copy of LegalEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegalEntityCopyWith<_LegalEntity> get copyWith => __$LegalEntityCopyWithImpl<_LegalEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LegalEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegalEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.inn, inn) || other.inn == inn)&&(identical(other.kpp, kpp) || other.kpp == kpp)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.bankAccount, bankAccount) || other.bankAccount == bankAccount)&&(identical(other.korrAccount, korrAccount) || other.korrAccount == korrAccount)&&(identical(other.bik, bik) || other.bik == bik)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isSeller, isSeller) || other.isSeller == isSeller));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyId,companyName,inn,kpp,fullName,bank,bankAccount,korrAccount,bik,address,phone,email,isSeller);

@override
String toString() {
  return 'LegalEntity(id: $id, companyId: $companyId, companyName: $companyName, inn: $inn, kpp: $kpp, fullName: $fullName, bank: $bank, bankAccount: $bankAccount, korrAccount: $korrAccount, bik: $bik, address: $address, phone: $phone, email: $email, isSeller: $isSeller)';
}


}

/// @nodoc
abstract mixin class _$LegalEntityCopyWith<$Res> implements $LegalEntityCopyWith<$Res> {
  factory _$LegalEntityCopyWith(_LegalEntity value, $Res Function(_LegalEntity) _then) = __$LegalEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'company_id') int companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName, String inn, String kpp,@JsonKey(name: 'full_name') String fullName, String bank,@JsonKey(name: 'bank_account') String bankAccount,@JsonKey(name: 'korr_account') String korrAccount, String bik, String address, String phone, String email,@JsonKey(name: 'is_seller') bool isSeller
});




}
/// @nodoc
class __$LegalEntityCopyWithImpl<$Res>
    implements _$LegalEntityCopyWith<$Res> {
  __$LegalEntityCopyWithImpl(this._self, this._then);

  final _LegalEntity _self;
  final $Res Function(_LegalEntity) _then;

/// Create a copy of LegalEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyId = null,Object? companyName = null,Object? inn = null,Object? kpp = null,Object? fullName = null,Object? bank = null,Object? bankAccount = null,Object? korrAccount = null,Object? bik = null,Object? address = null,Object? phone = null,Object? email = null,Object? isSeller = null,}) {
  return _then(_LegalEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyId: null == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,inn: null == inn ? _self.inn : inn // ignore: cast_nullable_to_non_nullable
as String,kpp: null == kpp ? _self.kpp : kpp // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,bank: null == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String,bankAccount: null == bankAccount ? _self.bankAccount : bankAccount // ignore: cast_nullable_to_non_nullable
as String,korrAccount: null == korrAccount ? _self.korrAccount : korrAccount // ignore: cast_nullable_to_non_nullable
as String,bik: null == bik ? _self.bik : bik // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isSeller: null == isSeller ? _self.isSeller : isSeller // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
