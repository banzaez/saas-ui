import 'dart:async';
import 'dart:math' as math;

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/core/network/models/statistics_period.dart';
import 'package:saas_ui/src/core/network/repository/certificates_repository.dart';
import 'package:saas_ui/src/core/network/repository/statistics_repository.dart';
import 'package:saas_ui/src/features/home/statistics/application/settings/statistic_settings.dart';

part 'statistics_notifier.g.dart';

@riverpod
class Statistics extends _$Statistics {
  final StatisticSettings settings = StatisticSettings();
  StatisticsPeriod period = StatisticsPeriod.last30Days;
  List<Certificate> certificates = [];

  ({int min, int max})? _cachedYRange;

  @override
  FutureOr<List<Statistic>> build() async {
    _applyPeriodDates();
    await _ensureCertificates();
    return _fetchAndProcess();
  }

  void _applyPeriodDates() {
    final now = DateTime.now().startOfDay;
    settings.filter.fromDate = now.subtract(period.duration);
    settings.filter.toDate = now.endOfDay;
  }

  Future<void> _ensureCertificates() async {
    if (certificates.isNotEmpty) return;
    final response = await ref.read(certificatesRepositoryProvider).listAll();
    if (!ref.mounted) return;
    if (!response.isSuccess) return;
    final result = List<Certificate>.from(response.result ?? []);
    result.sort((a, b) => (b.id ?? 0).compareTo(a.id ?? 0));
    certificates = result;
    if (settings.filter.certificateId == null && certificates.isNotEmpty) {
      settings.filter.certificateId = certificates.first.id;
    }
  }

  Future<List<Statistic>> _fetchAndProcess() async {
    final response = await ref
        .read(statisticsRepositoryProvider)
        .listAll(settings);
    if (!ref.mounted) return [];
    if (!response.isSuccess) {
      throw response.errorString;
    }
    var list = List<Statistic>.from(response.result ?? []);
    final startDate = settings.filter.fromDate ?? DateTime.now().startOfDay;
    final endDate = settings.filter.toDate ?? DateTime.now().endOfDay;
    list = list.map((e) => e.withBoundaryDates(startDate, endDate)).toList();
    _invalidateChartCache();
    return list;
  }

  void _calculateYRange(List<Statistic> items) {
    if (_cachedYRange != null) return;
    if (items.isEmpty) {
      _cachedYRange = null;
      return;
    }

    int minValue = 0;
    int maxValue = 0;

    for (final item in items) {
      maxValue = math.max(maxValue, item.tokensAfter);
      maxValue = math.max(maxValue, item.tokensBefore);
      minValue = math.min(minValue, item.tokensAfter);
      minValue = math.min(minValue, item.tokensBefore);

      for (final data in item.data) {
        if (data.tokensReceived > 0) {
          maxValue = math.max(maxValue, data.tokensReceived);
        }
        if (data.tokensSpent < 0) {
          minValue = math.min(minValue, data.tokensSpent);
        }
      }
    }

    if (minValue == 0 && maxValue == 0) {
      _cachedYRange = null;
      return;
    }

    minValue = (minValue.toDouble() * 1.15).round();
    maxValue = (maxValue.toDouble() * 1.15).round();
    _cachedYRange = (min: minValue, max: maxValue);
  }

  int? minY(List<Statistic> items) {
    _calculateYRange(items);
    return _cachedYRange?.min;
  }

  int? maxY(List<Statistic> items) {
    _calculateYRange(items);
    return _cachedYRange?.max;
  }

  void _invalidateChartCache() {
    _cachedYRange = null;
  }

  double getDateIndex(List<Statistic> items, DateTime date) =>
      items.isEmpty ? 0.0 : items.first.getDateIndex(date);

  String getDateLabel(List<Statistic> items, double x) =>
      items.isEmpty ? '' : items.first.getDateLabel(x);

  String get startDateString => settings.filter.fromDate?.formatMMMDDYYYY ?? '';
  String get endDateString => settings.filter.toDate?.formatMMMDDYYYY ?? '';
  String get periodString => '$startDateString - $endDateString';
  int? get certificateId => settings.filter.certificateId;
  DateTime? get startDate => settings.filter.fromDate;
  DateTime? get endDate => settings.filter.toDate;

  Future<void> setPeriod(StatisticsPeriod? value) async {
    period = value ?? StatisticsPeriod.today;
    _applyPeriodDates();
    _invalidateChartCache();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _fetchAndProcess();
      if (!ref.mounted) return result;
      return result;
    });
  }

  Future<void> setCertificate(int? value) async {
    settings.filter.certificateId = value;
    _invalidateChartCache();
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _fetchAndProcess();
      if (!ref.mounted) return result;
      return result;
    });
  }
}
