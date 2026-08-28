import 'package:json_annotation/json_annotation.dart';

part 'total_sum_response.g.dart';

@JsonSerializable()
class TotalSumResponse {
  @JsonKey(name: 'price', defaultValue: 0)
  final double price;
  @JsonKey(name: 'period_count', defaultValue: 0)
  final int periodCount;
  @JsonKey(name: 'discount', defaultValue: 0)
  final double discount;
  @JsonKey(name: 'total_sum', defaultValue: 0)
  final double totalSum;

  TotalSumResponse({
    required this.price,
    required this.periodCount,
    required this.discount,
    required this.totalSum,
  });

  factory TotalSumResponse.fromJson(Map<String, dynamic> json) =>
      _$TotalSumResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TotalSumResponseToJson(this);

  @override
  String toString() {
    return 'TotalSumResponse(price: $price,\nperiodCount: $periodCount,\ndiscount: $discount,\ntotalSum: $totalSum)';
  }
}
