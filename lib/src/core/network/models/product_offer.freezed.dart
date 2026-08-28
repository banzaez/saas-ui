// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductOffer {

 int? get id; String get name; String get description;@JsonKey(name: 'product_id') int? get productId;@JsonKey(name: 'product_name', includeToJson: false) String get productName;@JsonKey(name: 'company_id') int? get companyId;@JsonKey(name: 'company_name', includeToJson: false) String get companyName; double get price; double get discount;@JsonKey(name: 'package_type') PackageType get type;@JsonKey(name: 'tokens_per_period') int get tokensPerPeriod;@JsonKey(name: 'period_type') PeriodType? get periodType;@JsonKey(name: 'period_value') int get periodValue;@JsonKey(name: 'period_count') int get periodCount;@JsonKey(name: 'total_sum', includeToJson: false) double get totalSum;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'mystock_tariff_id') String? get mystockTariffId;
/// Create a copy of ProductOffer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOfferCopyWith<ProductOffer> get copyWith => _$ProductOfferCopyWithImpl<ProductOffer>(this as ProductOffer, _$identity);

  /// Serializes this ProductOffer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.type, type) || other.type == type)&&(identical(other.tokensPerPeriod, tokensPerPeriod) || other.tokensPerPeriod == tokensPerPeriod)&&(identical(other.periodType, periodType) || other.periodType == periodType)&&(identical(other.periodValue, periodValue) || other.periodValue == periodValue)&&(identical(other.periodCount, periodCount) || other.periodCount == periodCount)&&(identical(other.totalSum, totalSum) || other.totalSum == totalSum)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.mystockTariffId, mystockTariffId) || other.mystockTariffId == mystockTariffId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,productId,productName,companyId,companyName,price,discount,type,tokensPerPeriod,periodType,periodValue,periodCount,totalSum,isActive,mystockTariffId);

@override
String toString() {
  return 'ProductOffer(id: $id, name: $name, description: $description, productId: $productId, productName: $productName, companyId: $companyId, companyName: $companyName, price: $price, discount: $discount, type: $type, tokensPerPeriod: $tokensPerPeriod, periodType: $periodType, periodValue: $periodValue, periodCount: $periodCount, totalSum: $totalSum, isActive: $isActive, mystockTariffId: $mystockTariffId)';
}


}

/// @nodoc
abstract mixin class $ProductOfferCopyWith<$Res>  {
  factory $ProductOfferCopyWith(ProductOffer value, $Res Function(ProductOffer) _then) = _$ProductOfferCopyWithImpl;
@useResult
$Res call({
 int? id, String name, String description,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'product_name', includeToJson: false) String productName,@JsonKey(name: 'company_id') int? companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName, double price, double discount,@JsonKey(name: 'package_type') PackageType type,@JsonKey(name: 'tokens_per_period') int tokensPerPeriod,@JsonKey(name: 'period_type') PeriodType? periodType,@JsonKey(name: 'period_value') int periodValue,@JsonKey(name: 'period_count') int periodCount,@JsonKey(name: 'total_sum', includeToJson: false) double totalSum,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'mystock_tariff_id') String? mystockTariffId
});




}
/// @nodoc
class _$ProductOfferCopyWithImpl<$Res>
    implements $ProductOfferCopyWith<$Res> {
  _$ProductOfferCopyWithImpl(this._self, this._then);

  final ProductOffer _self;
  final $Res Function(ProductOffer) _then;

/// Create a copy of ProductOffer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? productId = freezed,Object? productName = null,Object? companyId = freezed,Object? companyName = null,Object? price = null,Object? discount = null,Object? type = null,Object? tokensPerPeriod = null,Object? periodType = freezed,Object? periodValue = null,Object? periodCount = null,Object? totalSum = null,Object? isActive = null,Object? mystockTariffId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,tokensPerPeriod: null == tokensPerPeriod ? _self.tokensPerPeriod : tokensPerPeriod // ignore: cast_nullable_to_non_nullable
as int,periodType: freezed == periodType ? _self.periodType : periodType // ignore: cast_nullable_to_non_nullable
as PeriodType?,periodValue: null == periodValue ? _self.periodValue : periodValue // ignore: cast_nullable_to_non_nullable
as int,periodCount: null == periodCount ? _self.periodCount : periodCount // ignore: cast_nullable_to_non_nullable
as int,totalSum: null == totalSum ? _self.totalSum : totalSum // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,mystockTariffId: freezed == mystockTariffId ? _self.mystockTariffId : mystockTariffId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductOffer].
extension ProductOfferPatterns on ProductOffer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductOffer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductOffer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductOffer value)  $default,){
final _that = this;
switch (_that) {
case _ProductOffer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductOffer value)?  $default,){
final _that = this;
switch (_that) {
case _ProductOffer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  String description, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName, @JsonKey(name: 'company_id')  int? companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName,  double price,  double discount, @JsonKey(name: 'package_type')  PackageType type, @JsonKey(name: 'tokens_per_period')  int tokensPerPeriod, @JsonKey(name: 'period_type')  PeriodType? periodType, @JsonKey(name: 'period_value')  int periodValue, @JsonKey(name: 'period_count')  int periodCount, @JsonKey(name: 'total_sum', includeToJson: false)  double totalSum, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'mystock_tariff_id')  String? mystockTariffId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductOffer() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.productId,_that.productName,_that.companyId,_that.companyName,_that.price,_that.discount,_that.type,_that.tokensPerPeriod,_that.periodType,_that.periodValue,_that.periodCount,_that.totalSum,_that.isActive,_that.mystockTariffId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  String description, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName, @JsonKey(name: 'company_id')  int? companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName,  double price,  double discount, @JsonKey(name: 'package_type')  PackageType type, @JsonKey(name: 'tokens_per_period')  int tokensPerPeriod, @JsonKey(name: 'period_type')  PeriodType? periodType, @JsonKey(name: 'period_value')  int periodValue, @JsonKey(name: 'period_count')  int periodCount, @JsonKey(name: 'total_sum', includeToJson: false)  double totalSum, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'mystock_tariff_id')  String? mystockTariffId)  $default,) {final _that = this;
switch (_that) {
case _ProductOffer():
return $default(_that.id,_that.name,_that.description,_that.productId,_that.productName,_that.companyId,_that.companyName,_that.price,_that.discount,_that.type,_that.tokensPerPeriod,_that.periodType,_that.periodValue,_that.periodCount,_that.totalSum,_that.isActive,_that.mystockTariffId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  String description, @JsonKey(name: 'product_id')  int? productId, @JsonKey(name: 'product_name', includeToJson: false)  String productName, @JsonKey(name: 'company_id')  int? companyId, @JsonKey(name: 'company_name', includeToJson: false)  String companyName,  double price,  double discount, @JsonKey(name: 'package_type')  PackageType type, @JsonKey(name: 'tokens_per_period')  int tokensPerPeriod, @JsonKey(name: 'period_type')  PeriodType? periodType, @JsonKey(name: 'period_value')  int periodValue, @JsonKey(name: 'period_count')  int periodCount, @JsonKey(name: 'total_sum', includeToJson: false)  double totalSum, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'mystock_tariff_id')  String? mystockTariffId)?  $default,) {final _that = this;
switch (_that) {
case _ProductOffer() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.productId,_that.productName,_that.companyId,_that.companyName,_that.price,_that.discount,_that.type,_that.tokensPerPeriod,_that.periodType,_that.periodValue,_that.periodCount,_that.totalSum,_that.isActive,_that.mystockTariffId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductOffer extends ProductOffer {
  const _ProductOffer({this.id, this.name = '', this.description = '', @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_name', includeToJson: false) this.productName = "", @JsonKey(name: 'company_id') this.companyId, @JsonKey(name: 'company_name', includeToJson: false) this.companyName = "", this.price = 0, this.discount = 0, @JsonKey(name: 'package_type') this.type = PackageType.timeBased, @JsonKey(name: 'tokens_per_period') this.tokensPerPeriod = 0, @JsonKey(name: 'period_type') this.periodType, @JsonKey(name: 'period_value') this.periodValue = 0, @JsonKey(name: 'period_count') this.periodCount = 0, @JsonKey(name: 'total_sum', includeToJson: false) this.totalSum = 0, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'mystock_tariff_id') this.mystockTariffId}): super._();
  factory _ProductOffer.fromJson(Map<String, dynamic> json) => _$ProductOfferFromJson(json);

@override final  int? id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey(name: 'product_id') final  int? productId;
@override@JsonKey(name: 'product_name', includeToJson: false) final  String productName;
@override@JsonKey(name: 'company_id') final  int? companyId;
@override@JsonKey(name: 'company_name', includeToJson: false) final  String companyName;
@override@JsonKey() final  double price;
@override@JsonKey() final  double discount;
@override@JsonKey(name: 'package_type') final  PackageType type;
@override@JsonKey(name: 'tokens_per_period') final  int tokensPerPeriod;
@override@JsonKey(name: 'period_type') final  PeriodType? periodType;
@override@JsonKey(name: 'period_value') final  int periodValue;
@override@JsonKey(name: 'period_count') final  int periodCount;
@override@JsonKey(name: 'total_sum', includeToJson: false) final  double totalSum;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'mystock_tariff_id') final  String? mystockTariffId;

/// Create a copy of ProductOffer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductOfferCopyWith<_ProductOffer> get copyWith => __$ProductOfferCopyWithImpl<_ProductOffer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductOfferToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductOffer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.companyId, companyId) || other.companyId == companyId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.price, price) || other.price == price)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.type, type) || other.type == type)&&(identical(other.tokensPerPeriod, tokensPerPeriod) || other.tokensPerPeriod == tokensPerPeriod)&&(identical(other.periodType, periodType) || other.periodType == periodType)&&(identical(other.periodValue, periodValue) || other.periodValue == periodValue)&&(identical(other.periodCount, periodCount) || other.periodCount == periodCount)&&(identical(other.totalSum, totalSum) || other.totalSum == totalSum)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.mystockTariffId, mystockTariffId) || other.mystockTariffId == mystockTariffId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,productId,productName,companyId,companyName,price,discount,type,tokensPerPeriod,periodType,periodValue,periodCount,totalSum,isActive,mystockTariffId);

@override
String toString() {
  return 'ProductOffer(id: $id, name: $name, description: $description, productId: $productId, productName: $productName, companyId: $companyId, companyName: $companyName, price: $price, discount: $discount, type: $type, tokensPerPeriod: $tokensPerPeriod, periodType: $periodType, periodValue: $periodValue, periodCount: $periodCount, totalSum: $totalSum, isActive: $isActive, mystockTariffId: $mystockTariffId)';
}


}

/// @nodoc
abstract mixin class _$ProductOfferCopyWith<$Res> implements $ProductOfferCopyWith<$Res> {
  factory _$ProductOfferCopyWith(_ProductOffer value, $Res Function(_ProductOffer) _then) = __$ProductOfferCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, String description,@JsonKey(name: 'product_id') int? productId,@JsonKey(name: 'product_name', includeToJson: false) String productName,@JsonKey(name: 'company_id') int? companyId,@JsonKey(name: 'company_name', includeToJson: false) String companyName, double price, double discount,@JsonKey(name: 'package_type') PackageType type,@JsonKey(name: 'tokens_per_period') int tokensPerPeriod,@JsonKey(name: 'period_type') PeriodType? periodType,@JsonKey(name: 'period_value') int periodValue,@JsonKey(name: 'period_count') int periodCount,@JsonKey(name: 'total_sum', includeToJson: false) double totalSum,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'mystock_tariff_id') String? mystockTariffId
});




}
/// @nodoc
class __$ProductOfferCopyWithImpl<$Res>
    implements _$ProductOfferCopyWith<$Res> {
  __$ProductOfferCopyWithImpl(this._self, this._then);

  final _ProductOffer _self;
  final $Res Function(_ProductOffer) _then;

/// Create a copy of ProductOffer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? productId = freezed,Object? productName = null,Object? companyId = freezed,Object? companyName = null,Object? price = null,Object? discount = null,Object? type = null,Object? tokensPerPeriod = null,Object? periodType = freezed,Object? periodValue = null,Object? periodCount = null,Object? totalSum = null,Object? isActive = null,Object? mystockTariffId = freezed,}) {
  return _then(_ProductOffer(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,companyId: freezed == companyId ? _self.companyId : companyId // ignore: cast_nullable_to_non_nullable
as int?,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,tokensPerPeriod: null == tokensPerPeriod ? _self.tokensPerPeriod : tokensPerPeriod // ignore: cast_nullable_to_non_nullable
as int,periodType: freezed == periodType ? _self.periodType : periodType // ignore: cast_nullable_to_non_nullable
as PeriodType?,periodValue: null == periodValue ? _self.periodValue : periodValue // ignore: cast_nullable_to_non_nullable
as int,periodCount: null == periodCount ? _self.periodCount : periodCount // ignore: cast_nullable_to_non_nullable
as int,totalSum: null == totalSum ? _self.totalSum : totalSum // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,mystockTariffId: freezed == mystockTariffId ? _self.mystockTariffId : mystockTariffId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
