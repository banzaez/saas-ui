import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';

part 'statistic.freezed.dart';
part 'statistic.g.dart';

@freezed
sealed class Statistic with _$Statistic implements BaseModel {
  const Statistic._();

  const factory Statistic({
    int? id,
    @JsonKey(name: 'certificate_id') required int certificateId,
    @JsonKey(name: 'certificate_description')
    required String certificateDescription,
    @JsonKey(name: 'tokens_before') @Default(0) int tokensBefore,
    @JsonKey(name: 'tokens_after') @Default(0) int tokensAfter,
    @Default([]) List<StatisticData> data,
  }) = _Statistic;

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);

  @override
  String get getName => "($certificateId) $certificateDescription";

  /// Всего расходов (сумма tokens_spent) без учета прогнозов
  int get totalExpenses => data
      .where((item) => !item.isForecast)
      .fold(0, (sum, item) => sum + item.tokensSpent);

  /// Всего доходов (сумма tokens_received) без учета прогнозов
  int get totalIncome => data
      .where((item) => !item.isForecast)
      .fold(0, (sum, item) => sum + item.tokensReceived);

  /// Возвращает отсортированный по дате список данных без пустых записей
  List<StatisticData> get processedData {
    return data
        .where(
          (item) =>
              item.tokensReceived != 0 ||
              item.tokensSpent != 0 ||
              item.tokensChange != 0,
        )
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  /// Получить метку даты по индексу (используя processedData)
  String getDateLabel(double index) {
    final list = processedData;
    final i = index.toInt();
    if (i >= 0 && i < list.length) {
      return list[i].date.formatDDMMM;
    }
    return '';
  }

  /// Получить индекс даты (используя processedData)
  double getDateIndex(DateTime date) {
    final list = processedData;
    for (var i = 0; i < list.length; i++) {
      if (list[i].date.startOfDay == date.startOfDay) {
        return i.toDouble();
      }
    }
    return 0.0;
  }

  /// Добавить граничные даты (начало и конец периода) и вернуть новый экземпляр
  Statistic withBoundaryDates(DateTime startDate, DateTime endDate) {
    final startDateOnly = startDate.startOfDay;
    final endDateOnly = endDate.startOfDay;
    final newData = List<StatisticData>.from(data);

    if (!newData.any((item) => item.date.startOfDay == startDateOnly)) {
      newData.add(
        StatisticData(date: startDateOnly, tokensAfter: tokensBefore),
      );
    }
    if (!newData.any((item) => item.date.startOfDay == endDateOnly)) {
      newData.add(StatisticData(date: endDateOnly, tokensAfter: tokensAfter));
    }

    return copyWith(data: newData);
  }
}

@freezed
sealed class StatisticData with _$StatisticData {
  const factory StatisticData({
    required DateTime date,
    @JsonKey(name: 'tokens_after') @Default(0) int tokensAfter,
    @JsonKey(name: 'tokens_received') @Default(0) int tokensReceived,
    @JsonKey(name: 'tokens_spent') @Default(0) int tokensSpent,
    @JsonKey(name: 'tokens_change') @Default(0) int tokensChange,
    @JsonKey(name: 'is_forecast') @Default(false) bool isForecast,
  }) = _StatisticData;

  factory StatisticData.fromJson(Map<String, dynamic> json) =>
      _$StatisticDataFromJson(json);
}
