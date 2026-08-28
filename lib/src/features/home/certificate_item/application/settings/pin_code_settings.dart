import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';

import 'pin_code_filter_settings.dart';
import 'pin_code_sort_settings.dart';

export 'pin_code_filter_settings.dart';
export 'pin_code_sort_settings.dart';

/// Настройки для списка PIN-кодов сертификата.
/// Пагинация отсутствует — API принимает ID сертификата и возвращает весь список.
class PinCodeSettings extends BaseListSettings<PinCode, PinCodeSettings> {
  @override
  final PinCodeFilterSettings filter;

  @override
  final PinCodeSortSettings sort;

  PinCodeSettings({
    String? search,
    int? certificateId,
    SortField<PinCode>? sortingBy,
    bool sortingReverse = false,
  }) : filter = PinCodeFilterSettings(
         search: search,
         certificateId: certificateId,
       ),
       sort = PinCodeSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       );

  @override
  PinCodeSettings createCopy({
    SortSettings<PinCode>? sort,
    GroupSettings<PinCode>? group,
  }) => PinCodeSettings(
    search: filter.search,
    certificateId: filter.certificateId,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
  );
}
