import 'package:flutter/material.dart' show Color, Colors;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';
import 'package:saas_ui/src/core/models/has_active_status.dart';

part 'product_offer.freezed.dart';
part 'product_offer.g.dart';

@freezed
sealed class ProductOffer
    with _$ProductOffer
    implements BaseModel, HasActiveStatus {
  const ProductOffer._();

  const factory ProductOffer({
    int? id,
    @Default('') String name,
    @Default('') String description,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_name', includeToJson: false)
    @Default("")
    String productName,
    @JsonKey(name: 'company_id') int? companyId,
    @JsonKey(name: 'company_name', includeToJson: false)
    @Default("")
    String companyName,
    @Default(0) double price,
    @Default(0) double discount,
    @JsonKey(name: 'package_type')
    @Default(PackageType.timeBased)
    PackageType type,
    @JsonKey(name: 'tokens_per_period') @Default(0) int tokensPerPeriod,
    @JsonKey(name: 'period_type') PeriodType? periodType,
    @JsonKey(name: 'period_value') @Default(0) int periodValue,
    @JsonKey(name: 'period_count') @Default(0) int periodCount,
    @JsonKey(name: 'total_sum', includeToJson: false)
    @Default(0)
    double totalSum,

    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'mystock_tariff_id') String? mystockTariffId,
  }) = _ProductOffer;

  factory ProductOffer.fromJson(Map<String, dynamic> json) =>
      _$ProductOfferFromJson(json);

  @override
  String get getName => name;

  bool get hasDiscount => discount > 0;

  /// Цена со скидкой
  double get discountedPrice =>
      hasDiscount ? price * (1 - discount / 100) : price;

  /// Оригинальная цена (базовая)
  double get originalPrice => price;

  /// Общее количество токенов за весь срок действия пакета
  /// Формула: (токены за цикл) * (количество обновлений)
  int get totalTokens => tokensPerPeriod * periodCount;

  /// Суммарная длительность всех периодов в единицах (днях/месяцах)
  /// Формула: (длительность периода) * (количество обновлений)
  int get totalPeriodValue => periodValue * periodCount;

  /// Стоимость одного токена с учетом скидки
  /// Формула: (финальная цена) / (общее количество токенов)
  double get pricePerToken => totalTokens > 0 ? totalSum / totalTokens : 0;

  /// Склонение слова «токен» по числу [totalTokens].
  String get pluralTokens {
    final n = totalTokens;
    final n10 = n % 10;
    final n100 = n % 100;
    if (n10 == 1 && n100 != 11) return 'токен';
    if (n10 >= 2 && n10 <= 4 && (n100 < 10 || n100 >= 20)) return 'токена';
    return 'токенов';
  }
}

enum PackageType with EnumWithText {
  @JsonValue('time_based')
  timeBased,
  @JsonValue('token_based')
  tokenBased;

  @override
  String toString() => switch (this) {
    timeBased => 'time_based',
    tokenBased => 'token_based',
  };

  @override
  String text() => switch (this) {
    timeBased => 'Временной',
    tokenBased => 'Токеновый',
  };

  String get textShort => switch (this) {
    timeBased => 'В',
    tokenBased => 'Т',
  };

  Color get color {
    switch (this) {
      case timeBased:
        return Colors.green;
      case tokenBased:
        return Colors.orange;
    }
  }
}

enum PeriodType with EnumWithText {
  @JsonValue('day')
  day,
  @JsonValue('month')
  month;

  @override
  String toString() => switch (this) {
    day => 'day',
    month => 'month',
  };

  @override
  String text() => switch (this) {
    day => 'День',
    month => 'Месяц',
  };

  String plural(int n) {
    final int n10 = n % 10;
    final int n100 = n % 100;

    if (this == PeriodType.day) {
      if (n10 == 1 && n100 != 11) return 'день';
      if (n10 >= 2 && n10 <= 4 && (n100 < 10 || n100 >= 20)) return 'дня';
      return 'дней';
    } else {
      if (n10 == 1 && n100 != 11) return 'месяц';
      if (n10 >= 2 && n10 <= 4 && (n100 < 10 || n100 >= 20)) return 'месяца';
      return 'месяцев';
    }
  }
}
