import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/models/mixins/enum_with_text.dart';

part 'token_transaction.freezed.dart';
part 'token_transaction.g.dart';

@freezed
sealed class TokenTransaction with _$TokenTransaction implements BaseModel {
  const TokenTransaction._();

  const factory TokenTransaction({
    int? id,
    @JsonKey(name: 'certificate_item_id') required int certificateItemId,
    @JsonKey(name: 'proxy_request_log_id') int? proxyRequestLogId,
    @JsonKey(name: 'transaction_type')
    required TokenTransactionType transactionType,
    @JsonKey(name: 'tokens_before') required int tokensBefore,
    @JsonKey(name: 'tokens_change') required int tokensChange,
    @JsonKey(name: 'tokens_after') required int tokensAfter,
    required String reason,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _TokenTransaction;

  factory TokenTransaction.fromJson(Map<String, dynamic> json) =>
      _$TokenTransactionFromJson(json);

  @override
  String get getName => reason;
}

enum TokenTransactionType with EnumWithText {
  @JsonValue("deduction")
  deduction,
  @JsonValue("usage")
  usage,
  @JsonValue("refund")
  refund,
  @JsonValue("activation")
  activation,
  @JsonValue("expiration")
  expiration,
  @JsonValue("manual_adjustment")
  manualAdjustment,
  @JsonValue("renew")
  renew;

  @override
  String toString() => switch (this) {
    deduction => 'deduction',
    usage => 'usage',
    refund => 'refund',
    activation => 'activation',
    expiration => 'expiration',
    manualAdjustment => 'manual_adjustment',
    renew => 'renew',
  };

  @override
  String text() => switch (this) {
    deduction => 'Списание',
    usage => 'Использование',
    refund => 'Возврат',
    activation => 'Активация',
    expiration => 'Истек',
    manualAdjustment => 'Списание',
    renew => 'Обновление',
  };

  Color get color => switch (this) {
    deduction => Colors.red,
    usage => Colors.blue,
    refund => Colors.green,
    activation => Colors.orange,
    expiration => Colors.grey,
    manualAdjustment => Colors.purple,
    renew => Colors.pink,
  };
}
