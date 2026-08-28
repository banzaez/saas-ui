/// Параметры маршрута `/buy` (query) для family-провайдера оплаты.
class BuyRouteArgs {
  const BuyRouteArgs({
    this.offerId,
    this.certificateId,
    this.certificateItemId,
  });

  final String? offerId;
  final String? certificateId;
  final String? certificateItemId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuyRouteArgs &&
          other.offerId == offerId &&
          other.certificateId == certificateId &&
          other.certificateItemId == certificateItemId;

  @override
  int get hashCode => Object.hash(offerId, certificateId, certificateItemId);
}

/// Распарсенные идентификаторы для создания платежа.
class BuyArguments {
  const BuyArguments({
    required this.offerId,
    this.certificateId,
    this.certificateItemId,
  });

  final int offerId;
  final int? certificateId;
  final int? certificateItemId;

  @override
  String toString() =>
      'BuyArguments(offerId: $offerId, certificateId: $certificateId, certificateItemId: $certificateItemId)';
}
