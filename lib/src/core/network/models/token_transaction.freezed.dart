// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenTransaction {

 int? get id;@JsonKey(name: 'certificate_item_id') int get certificateItemId;@JsonKey(name: 'proxy_request_log_id') int? get proxyRequestLogId;@JsonKey(name: 'transaction_type') TokenTransactionType get transactionType;@JsonKey(name: 'tokens_before') int get tokensBefore;@JsonKey(name: 'tokens_change') int get tokensChange;@JsonKey(name: 'tokens_after') int get tokensAfter; String get reason;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenTransactionCopyWith<TokenTransaction> get copyWith => _$TokenTransactionCopyWithImpl<TokenTransaction>(this as TokenTransaction, _$identity);

  /// Serializes this TokenTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.proxyRequestLogId, proxyRequestLogId) || other.proxyRequestLogId == proxyRequestLogId)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.tokensBefore, tokensBefore) || other.tokensBefore == tokensBefore)&&(identical(other.tokensChange, tokensChange) || other.tokensChange == tokensChange)&&(identical(other.tokensAfter, tokensAfter) || other.tokensAfter == tokensAfter)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,certificateItemId,proxyRequestLogId,transactionType,tokensBefore,tokensChange,tokensAfter,reason,createdAt);

@override
String toString() {
  return 'TokenTransaction(id: $id, certificateItemId: $certificateItemId, proxyRequestLogId: $proxyRequestLogId, transactionType: $transactionType, tokensBefore: $tokensBefore, tokensChange: $tokensChange, tokensAfter: $tokensAfter, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TokenTransactionCopyWith<$Res>  {
  factory $TokenTransactionCopyWith(TokenTransaction value, $Res Function(TokenTransaction) _then) = _$TokenTransactionCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_item_id') int certificateItemId,@JsonKey(name: 'proxy_request_log_id') int? proxyRequestLogId,@JsonKey(name: 'transaction_type') TokenTransactionType transactionType,@JsonKey(name: 'tokens_before') int tokensBefore,@JsonKey(name: 'tokens_change') int tokensChange,@JsonKey(name: 'tokens_after') int tokensAfter, String reason,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$TokenTransactionCopyWithImpl<$Res>
    implements $TokenTransactionCopyWith<$Res> {
  _$TokenTransactionCopyWithImpl(this._self, this._then);

  final TokenTransaction _self;
  final $Res Function(TokenTransaction) _then;

/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? certificateItemId = null,Object? proxyRequestLogId = freezed,Object? transactionType = null,Object? tokensBefore = null,Object? tokensChange = null,Object? tokensAfter = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,proxyRequestLogId: freezed == proxyRequestLogId ? _self.proxyRequestLogId : proxyRequestLogId // ignore: cast_nullable_to_non_nullable
as int?,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TokenTransactionType,tokensBefore: null == tokensBefore ? _self.tokensBefore : tokensBefore // ignore: cast_nullable_to_non_nullable
as int,tokensChange: null == tokensChange ? _self.tokensChange : tokensChange // ignore: cast_nullable_to_non_nullable
as int,tokensAfter: null == tokensAfter ? _self.tokensAfter : tokensAfter // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenTransaction].
extension TokenTransactionPatterns on TokenTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenTransaction value)  $default,){
final _that = this;
switch (_that) {
case _TokenTransaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_item_id')  int certificateItemId, @JsonKey(name: 'proxy_request_log_id')  int? proxyRequestLogId, @JsonKey(name: 'transaction_type')  TokenTransactionType transactionType, @JsonKey(name: 'tokens_before')  int tokensBefore, @JsonKey(name: 'tokens_change')  int tokensChange, @JsonKey(name: 'tokens_after')  int tokensAfter,  String reason, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
return $default(_that.id,_that.certificateItemId,_that.proxyRequestLogId,_that.transactionType,_that.tokensBefore,_that.tokensChange,_that.tokensAfter,_that.reason,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_item_id')  int certificateItemId, @JsonKey(name: 'proxy_request_log_id')  int? proxyRequestLogId, @JsonKey(name: 'transaction_type')  TokenTransactionType transactionType, @JsonKey(name: 'tokens_before')  int tokensBefore, @JsonKey(name: 'tokens_change')  int tokensChange, @JsonKey(name: 'tokens_after')  int tokensAfter,  String reason, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TokenTransaction():
return $default(_that.id,_that.certificateItemId,_that.proxyRequestLogId,_that.transactionType,_that.tokensBefore,_that.tokensChange,_that.tokensAfter,_that.reason,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'certificate_item_id')  int certificateItemId, @JsonKey(name: 'proxy_request_log_id')  int? proxyRequestLogId, @JsonKey(name: 'transaction_type')  TokenTransactionType transactionType, @JsonKey(name: 'tokens_before')  int tokensBefore, @JsonKey(name: 'tokens_change')  int tokensChange, @JsonKey(name: 'tokens_after')  int tokensAfter,  String reason, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TokenTransaction() when $default != null:
return $default(_that.id,_that.certificateItemId,_that.proxyRequestLogId,_that.transactionType,_that.tokensBefore,_that.tokensChange,_that.tokensAfter,_that.reason,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenTransaction extends TokenTransaction {
  const _TokenTransaction({this.id, @JsonKey(name: 'certificate_item_id') required this.certificateItemId, @JsonKey(name: 'proxy_request_log_id') this.proxyRequestLogId, @JsonKey(name: 'transaction_type') required this.transactionType, @JsonKey(name: 'tokens_before') required this.tokensBefore, @JsonKey(name: 'tokens_change') required this.tokensChange, @JsonKey(name: 'tokens_after') required this.tokensAfter, required this.reason, @JsonKey(name: 'created_at') required this.createdAt}): super._();
  factory _TokenTransaction.fromJson(Map<String, dynamic> json) => _$TokenTransactionFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'certificate_item_id') final  int certificateItemId;
@override@JsonKey(name: 'proxy_request_log_id') final  int? proxyRequestLogId;
@override@JsonKey(name: 'transaction_type') final  TokenTransactionType transactionType;
@override@JsonKey(name: 'tokens_before') final  int tokensBefore;
@override@JsonKey(name: 'tokens_change') final  int tokensChange;
@override@JsonKey(name: 'tokens_after') final  int tokensAfter;
@override final  String reason;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenTransactionCopyWith<_TokenTransaction> get copyWith => __$TokenTransactionCopyWithImpl<_TokenTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateItemId, certificateItemId) || other.certificateItemId == certificateItemId)&&(identical(other.proxyRequestLogId, proxyRequestLogId) || other.proxyRequestLogId == proxyRequestLogId)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.tokensBefore, tokensBefore) || other.tokensBefore == tokensBefore)&&(identical(other.tokensChange, tokensChange) || other.tokensChange == tokensChange)&&(identical(other.tokensAfter, tokensAfter) || other.tokensAfter == tokensAfter)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,certificateItemId,proxyRequestLogId,transactionType,tokensBefore,tokensChange,tokensAfter,reason,createdAt);

@override
String toString() {
  return 'TokenTransaction(id: $id, certificateItemId: $certificateItemId, proxyRequestLogId: $proxyRequestLogId, transactionType: $transactionType, tokensBefore: $tokensBefore, tokensChange: $tokensChange, tokensAfter: $tokensAfter, reason: $reason, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TokenTransactionCopyWith<$Res> implements $TokenTransactionCopyWith<$Res> {
  factory _$TokenTransactionCopyWith(_TokenTransaction value, $Res Function(_TokenTransaction) _then) = __$TokenTransactionCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_item_id') int certificateItemId,@JsonKey(name: 'proxy_request_log_id') int? proxyRequestLogId,@JsonKey(name: 'transaction_type') TokenTransactionType transactionType,@JsonKey(name: 'tokens_before') int tokensBefore,@JsonKey(name: 'tokens_change') int tokensChange,@JsonKey(name: 'tokens_after') int tokensAfter, String reason,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$TokenTransactionCopyWithImpl<$Res>
    implements _$TokenTransactionCopyWith<$Res> {
  __$TokenTransactionCopyWithImpl(this._self, this._then);

  final _TokenTransaction _self;
  final $Res Function(_TokenTransaction) _then;

/// Create a copy of TokenTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? certificateItemId = null,Object? proxyRequestLogId = freezed,Object? transactionType = null,Object? tokensBefore = null,Object? tokensChange = null,Object? tokensAfter = null,Object? reason = null,Object? createdAt = null,}) {
  return _then(_TokenTransaction(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateItemId: null == certificateItemId ? _self.certificateItemId : certificateItemId // ignore: cast_nullable_to_non_nullable
as int,proxyRequestLogId: freezed == proxyRequestLogId ? _self.proxyRequestLogId : proxyRequestLogId // ignore: cast_nullable_to_non_nullable
as int?,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as TokenTransactionType,tokensBefore: null == tokensBefore ? _self.tokensBefore : tokensBefore // ignore: cast_nullable_to_non_nullable
as int,tokensChange: null == tokensChange ? _self.tokensChange : tokensChange // ignore: cast_nullable_to_non_nullable
as int,tokensAfter: null == tokensAfter ? _self.tokensAfter : tokensAfter // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
