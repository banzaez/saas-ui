// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Statistic {

 int? get id;@JsonKey(name: 'certificate_id') int get certificateId;@JsonKey(name: 'certificate_description') String get certificateDescription;@JsonKey(name: 'tokens_before') int get tokensBefore;@JsonKey(name: 'tokens_after') int get tokensAfter; List<StatisticData> get data;
/// Create a copy of Statistic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticCopyWith<Statistic> get copyWith => _$StatisticCopyWithImpl<Statistic>(this as Statistic, _$identity);

  /// Serializes this Statistic to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Statistic&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.certificateDescription, certificateDescription) || other.certificateDescription == certificateDescription)&&(identical(other.tokensBefore, tokensBefore) || other.tokensBefore == tokensBefore)&&(identical(other.tokensAfter, tokensAfter) || other.tokensAfter == tokensAfter)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,certificateId,certificateDescription,tokensBefore,tokensAfter,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'Statistic(id: $id, certificateId: $certificateId, certificateDescription: $certificateDescription, tokensBefore: $tokensBefore, tokensAfter: $tokensAfter, data: $data)';
}


}

/// @nodoc
abstract mixin class $StatisticCopyWith<$Res>  {
  factory $StatisticCopyWith(Statistic value, $Res Function(Statistic) _then) = _$StatisticCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_id') int certificateId,@JsonKey(name: 'certificate_description') String certificateDescription,@JsonKey(name: 'tokens_before') int tokensBefore,@JsonKey(name: 'tokens_after') int tokensAfter, List<StatisticData> data
});




}
/// @nodoc
class _$StatisticCopyWithImpl<$Res>
    implements $StatisticCopyWith<$Res> {
  _$StatisticCopyWithImpl(this._self, this._then);

  final Statistic _self;
  final $Res Function(Statistic) _then;

/// Create a copy of Statistic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? certificateId = null,Object? certificateDescription = null,Object? tokensBefore = null,Object? tokensAfter = null,Object? data = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateId: null == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int,certificateDescription: null == certificateDescription ? _self.certificateDescription : certificateDescription // ignore: cast_nullable_to_non_nullable
as String,tokensBefore: null == tokensBefore ? _self.tokensBefore : tokensBefore // ignore: cast_nullable_to_non_nullable
as int,tokensAfter: null == tokensAfter ? _self.tokensAfter : tokensAfter // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<StatisticData>,
  ));
}

}


/// Adds pattern-matching-related methods to [Statistic].
extension StatisticPatterns on Statistic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Statistic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Statistic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Statistic value)  $default,){
final _that = this;
switch (_that) {
case _Statistic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Statistic value)?  $default,){
final _that = this;
switch (_that) {
case _Statistic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'certificate_description')  String certificateDescription, @JsonKey(name: 'tokens_before')  int tokensBefore, @JsonKey(name: 'tokens_after')  int tokensAfter,  List<StatisticData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Statistic() when $default != null:
return $default(_that.id,_that.certificateId,_that.certificateDescription,_that.tokensBefore,_that.tokensAfter,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'certificate_description')  String certificateDescription, @JsonKey(name: 'tokens_before')  int tokensBefore, @JsonKey(name: 'tokens_after')  int tokensAfter,  List<StatisticData> data)  $default,) {final _that = this;
switch (_that) {
case _Statistic():
return $default(_that.id,_that.certificateId,_that.certificateDescription,_that.tokensBefore,_that.tokensAfter,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'certificate_id')  int certificateId, @JsonKey(name: 'certificate_description')  String certificateDescription, @JsonKey(name: 'tokens_before')  int tokensBefore, @JsonKey(name: 'tokens_after')  int tokensAfter,  List<StatisticData> data)?  $default,) {final _that = this;
switch (_that) {
case _Statistic() when $default != null:
return $default(_that.id,_that.certificateId,_that.certificateDescription,_that.tokensBefore,_that.tokensAfter,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Statistic extends Statistic {
  const _Statistic({this.id, @JsonKey(name: 'certificate_id') required this.certificateId, @JsonKey(name: 'certificate_description') required this.certificateDescription, @JsonKey(name: 'tokens_before') this.tokensBefore = 0, @JsonKey(name: 'tokens_after') this.tokensAfter = 0, final  List<StatisticData> data = const []}): _data = data,super._();
  factory _Statistic.fromJson(Map<String, dynamic> json) => _$StatisticFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'certificate_id') final  int certificateId;
@override@JsonKey(name: 'certificate_description') final  String certificateDescription;
@override@JsonKey(name: 'tokens_before') final  int tokensBefore;
@override@JsonKey(name: 'tokens_after') final  int tokensAfter;
 final  List<StatisticData> _data;
@override@JsonKey() List<StatisticData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of Statistic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticCopyWith<_Statistic> get copyWith => __$StatisticCopyWithImpl<_Statistic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Statistic&&(identical(other.id, id) || other.id == id)&&(identical(other.certificateId, certificateId) || other.certificateId == certificateId)&&(identical(other.certificateDescription, certificateDescription) || other.certificateDescription == certificateDescription)&&(identical(other.tokensBefore, tokensBefore) || other.tokensBefore == tokensBefore)&&(identical(other.tokensAfter, tokensAfter) || other.tokensAfter == tokensAfter)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,certificateId,certificateDescription,tokensBefore,tokensAfter,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'Statistic(id: $id, certificateId: $certificateId, certificateDescription: $certificateDescription, tokensBefore: $tokensBefore, tokensAfter: $tokensAfter, data: $data)';
}


}

/// @nodoc
abstract mixin class _$StatisticCopyWith<$Res> implements $StatisticCopyWith<$Res> {
  factory _$StatisticCopyWith(_Statistic value, $Res Function(_Statistic) _then) = __$StatisticCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'certificate_id') int certificateId,@JsonKey(name: 'certificate_description') String certificateDescription,@JsonKey(name: 'tokens_before') int tokensBefore,@JsonKey(name: 'tokens_after') int tokensAfter, List<StatisticData> data
});




}
/// @nodoc
class __$StatisticCopyWithImpl<$Res>
    implements _$StatisticCopyWith<$Res> {
  __$StatisticCopyWithImpl(this._self, this._then);

  final _Statistic _self;
  final $Res Function(_Statistic) _then;

/// Create a copy of Statistic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? certificateId = null,Object? certificateDescription = null,Object? tokensBefore = null,Object? tokensAfter = null,Object? data = null,}) {
  return _then(_Statistic(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,certificateId: null == certificateId ? _self.certificateId : certificateId // ignore: cast_nullable_to_non_nullable
as int,certificateDescription: null == certificateDescription ? _self.certificateDescription : certificateDescription // ignore: cast_nullable_to_non_nullable
as String,tokensBefore: null == tokensBefore ? _self.tokensBefore : tokensBefore // ignore: cast_nullable_to_non_nullable
as int,tokensAfter: null == tokensAfter ? _self.tokensAfter : tokensAfter // ignore: cast_nullable_to_non_nullable
as int,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<StatisticData>,
  ));
}


}


/// @nodoc
mixin _$StatisticData {

 DateTime get date;@JsonKey(name: 'tokens_after') int get tokensAfter;@JsonKey(name: 'tokens_received') int get tokensReceived;@JsonKey(name: 'tokens_spent') int get tokensSpent;@JsonKey(name: 'tokens_change') int get tokensChange;@JsonKey(name: 'is_forecast') bool get isForecast;
/// Create a copy of StatisticData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticDataCopyWith<StatisticData> get copyWith => _$StatisticDataCopyWithImpl<StatisticData>(this as StatisticData, _$identity);

  /// Serializes this StatisticData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatisticData&&(identical(other.date, date) || other.date == date)&&(identical(other.tokensAfter, tokensAfter) || other.tokensAfter == tokensAfter)&&(identical(other.tokensReceived, tokensReceived) || other.tokensReceived == tokensReceived)&&(identical(other.tokensSpent, tokensSpent) || other.tokensSpent == tokensSpent)&&(identical(other.tokensChange, tokensChange) || other.tokensChange == tokensChange)&&(identical(other.isForecast, isForecast) || other.isForecast == isForecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,tokensAfter,tokensReceived,tokensSpent,tokensChange,isForecast);

@override
String toString() {
  return 'StatisticData(date: $date, tokensAfter: $tokensAfter, tokensReceived: $tokensReceived, tokensSpent: $tokensSpent, tokensChange: $tokensChange, isForecast: $isForecast)';
}


}

/// @nodoc
abstract mixin class $StatisticDataCopyWith<$Res>  {
  factory $StatisticDataCopyWith(StatisticData value, $Res Function(StatisticData) _then) = _$StatisticDataCopyWithImpl;
@useResult
$Res call({
 DateTime date,@JsonKey(name: 'tokens_after') int tokensAfter,@JsonKey(name: 'tokens_received') int tokensReceived,@JsonKey(name: 'tokens_spent') int tokensSpent,@JsonKey(name: 'tokens_change') int tokensChange,@JsonKey(name: 'is_forecast') bool isForecast
});




}
/// @nodoc
class _$StatisticDataCopyWithImpl<$Res>
    implements $StatisticDataCopyWith<$Res> {
  _$StatisticDataCopyWithImpl(this._self, this._then);

  final StatisticData _self;
  final $Res Function(StatisticData) _then;

/// Create a copy of StatisticData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? tokensAfter = null,Object? tokensReceived = null,Object? tokensSpent = null,Object? tokensChange = null,Object? isForecast = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,tokensAfter: null == tokensAfter ? _self.tokensAfter : tokensAfter // ignore: cast_nullable_to_non_nullable
as int,tokensReceived: null == tokensReceived ? _self.tokensReceived : tokensReceived // ignore: cast_nullable_to_non_nullable
as int,tokensSpent: null == tokensSpent ? _self.tokensSpent : tokensSpent // ignore: cast_nullable_to_non_nullable
as int,tokensChange: null == tokensChange ? _self.tokensChange : tokensChange // ignore: cast_nullable_to_non_nullable
as int,isForecast: null == isForecast ? _self.isForecast : isForecast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StatisticData].
extension StatisticDataPatterns on StatisticData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatisticData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatisticData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatisticData value)  $default,){
final _that = this;
switch (_that) {
case _StatisticData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatisticData value)?  $default,){
final _that = this;
switch (_that) {
case _StatisticData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(name: 'tokens_after')  int tokensAfter, @JsonKey(name: 'tokens_received')  int tokensReceived, @JsonKey(name: 'tokens_spent')  int tokensSpent, @JsonKey(name: 'tokens_change')  int tokensChange, @JsonKey(name: 'is_forecast')  bool isForecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatisticData() when $default != null:
return $default(_that.date,_that.tokensAfter,_that.tokensReceived,_that.tokensSpent,_that.tokensChange,_that.isForecast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date, @JsonKey(name: 'tokens_after')  int tokensAfter, @JsonKey(name: 'tokens_received')  int tokensReceived, @JsonKey(name: 'tokens_spent')  int tokensSpent, @JsonKey(name: 'tokens_change')  int tokensChange, @JsonKey(name: 'is_forecast')  bool isForecast)  $default,) {final _that = this;
switch (_that) {
case _StatisticData():
return $default(_that.date,_that.tokensAfter,_that.tokensReceived,_that.tokensSpent,_that.tokensChange,_that.isForecast);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date, @JsonKey(name: 'tokens_after')  int tokensAfter, @JsonKey(name: 'tokens_received')  int tokensReceived, @JsonKey(name: 'tokens_spent')  int tokensSpent, @JsonKey(name: 'tokens_change')  int tokensChange, @JsonKey(name: 'is_forecast')  bool isForecast)?  $default,) {final _that = this;
switch (_that) {
case _StatisticData() when $default != null:
return $default(_that.date,_that.tokensAfter,_that.tokensReceived,_that.tokensSpent,_that.tokensChange,_that.isForecast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatisticData implements StatisticData {
  const _StatisticData({required this.date, @JsonKey(name: 'tokens_after') this.tokensAfter = 0, @JsonKey(name: 'tokens_received') this.tokensReceived = 0, @JsonKey(name: 'tokens_spent') this.tokensSpent = 0, @JsonKey(name: 'tokens_change') this.tokensChange = 0, @JsonKey(name: 'is_forecast') this.isForecast = false});
  factory _StatisticData.fromJson(Map<String, dynamic> json) => _$StatisticDataFromJson(json);

@override final  DateTime date;
@override@JsonKey(name: 'tokens_after') final  int tokensAfter;
@override@JsonKey(name: 'tokens_received') final  int tokensReceived;
@override@JsonKey(name: 'tokens_spent') final  int tokensSpent;
@override@JsonKey(name: 'tokens_change') final  int tokensChange;
@override@JsonKey(name: 'is_forecast') final  bool isForecast;

/// Create a copy of StatisticData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticDataCopyWith<_StatisticData> get copyWith => __$StatisticDataCopyWithImpl<_StatisticData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatisticData&&(identical(other.date, date) || other.date == date)&&(identical(other.tokensAfter, tokensAfter) || other.tokensAfter == tokensAfter)&&(identical(other.tokensReceived, tokensReceived) || other.tokensReceived == tokensReceived)&&(identical(other.tokensSpent, tokensSpent) || other.tokensSpent == tokensSpent)&&(identical(other.tokensChange, tokensChange) || other.tokensChange == tokensChange)&&(identical(other.isForecast, isForecast) || other.isForecast == isForecast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,tokensAfter,tokensReceived,tokensSpent,tokensChange,isForecast);

@override
String toString() {
  return 'StatisticData(date: $date, tokensAfter: $tokensAfter, tokensReceived: $tokensReceived, tokensSpent: $tokensSpent, tokensChange: $tokensChange, isForecast: $isForecast)';
}


}

/// @nodoc
abstract mixin class _$StatisticDataCopyWith<$Res> implements $StatisticDataCopyWith<$Res> {
  factory _$StatisticDataCopyWith(_StatisticData value, $Res Function(_StatisticData) _then) = __$StatisticDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@JsonKey(name: 'tokens_after') int tokensAfter,@JsonKey(name: 'tokens_received') int tokensReceived,@JsonKey(name: 'tokens_spent') int tokensSpent,@JsonKey(name: 'tokens_change') int tokensChange,@JsonKey(name: 'is_forecast') bool isForecast
});




}
/// @nodoc
class __$StatisticDataCopyWithImpl<$Res>
    implements _$StatisticDataCopyWith<$Res> {
  __$StatisticDataCopyWithImpl(this._self, this._then);

  final _StatisticData _self;
  final $Res Function(_StatisticData) _then;

/// Create a copy of StatisticData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? tokensAfter = null,Object? tokensReceived = null,Object? tokensSpent = null,Object? tokensChange = null,Object? isForecast = null,}) {
  return _then(_StatisticData(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,tokensAfter: null == tokensAfter ? _self.tokensAfter : tokensAfter // ignore: cast_nullable_to_non_nullable
as int,tokensReceived: null == tokensReceived ? _self.tokensReceived : tokensReceived // ignore: cast_nullable_to_non_nullable
as int,tokensSpent: null == tokensSpent ? _self.tokensSpent : tokensSpent // ignore: cast_nullable_to_non_nullable
as int,tokensChange: null == tokensChange ? _self.tokensChange : tokensChange // ignore: cast_nullable_to_non_nullable
as int,isForecast: null == isForecast ? _self.isForecast : isForecast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
