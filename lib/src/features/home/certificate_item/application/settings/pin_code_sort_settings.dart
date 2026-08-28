import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';

/// Настройки сортировки PIN-кодов.
/// Список полей пуст — таблица PIN-кодов не требует сортировки.
class PinCodeSortSettings extends SortSettings<PinCode> {
  @override
  final List<SortField<PinCode>> availableSortFields = const [];

  PinCodeSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  PinCodeSortSettings createCopy({
    SortField<PinCode>? sortingBy,
    bool? sortReverse,
  }) => PinCodeSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
