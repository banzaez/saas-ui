import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/log.dart';

/// Настройки сортировки логов.
/// Сортировка выполняется на стороне сервера — поля не переопределяются.
class LogSortSettings extends SortSettings<Log> {
  LogSortSettings({super.sortingBy, super.sortingReverse});

  @override
  LogSortSettings createCopy({SortField<Log>? sortingBy, bool? sortReverse}) =>
      LogSortSettings(
        sortingBy: sortingBy ?? this.sortingBy,
        sortingReverse: sortReverse ?? sortingReverse,
      );
}
