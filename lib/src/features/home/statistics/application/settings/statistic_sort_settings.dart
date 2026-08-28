import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';

/// Настройки сортировки статистики.
/// Список полей пуст — сортировка задаётся временным рядом на стороне сервера.
class StatisticSortSettings extends SortSettings<Statistic> {
  StatisticSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  StatisticSortSettings createCopy({
    SortField<Statistic>? sortingBy,
    bool? sortReverse,
  }) => StatisticSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
