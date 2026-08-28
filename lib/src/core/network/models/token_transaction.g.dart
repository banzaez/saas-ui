// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenTransaction _$TokenTransactionFromJson(Map<String, dynamic> json) =>
    _TokenTransaction(
      id: (json['id'] as num?)?.toInt(),
      certificateItemId: (json['certificate_item_id'] as num).toInt(),
      proxyRequestLogId: (json['proxy_request_log_id'] as num?)?.toInt(),
      transactionType: $enumDecode(
        _$TokenTransactionTypeEnumMap,
        json['transaction_type'],
      ),
      tokensBefore: (json['tokens_before'] as num).toInt(),
      tokensChange: (json['tokens_change'] as num).toInt(),
      tokensAfter: (json['tokens_after'] as num).toInt(),
      reason: json['reason'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TokenTransactionToJson(
  _TokenTransaction instance,
) => <String, dynamic>{
  'id': instance.id,
  'certificate_item_id': instance.certificateItemId,
  'proxy_request_log_id': instance.proxyRequestLogId,
  'transaction_type': _$TokenTransactionTypeEnumMap[instance.transactionType]!,
  'tokens_before': instance.tokensBefore,
  'tokens_change': instance.tokensChange,
  'tokens_after': instance.tokensAfter,
  'reason': instance.reason,
  'created_at': instance.createdAt.toIso8601String(),
};

const _$TokenTransactionTypeEnumMap = {
  TokenTransactionType.deduction: 'deduction',
  TokenTransactionType.usage: 'usage',
  TokenTransactionType.refund: 'refund',
  TokenTransactionType.activation: 'activation',
  TokenTransactionType.expiration: 'expiration',
  TokenTransactionType.manualAdjustment: 'manual_adjustment',
  TokenTransactionType.renew: 'renew',
};
