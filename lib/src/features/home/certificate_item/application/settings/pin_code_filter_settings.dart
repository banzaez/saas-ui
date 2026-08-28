import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';

/// Настройки фильтрации для списка PIN-кодов.
class PinCodeFilterSettings extends FilterSettings<PinCode> {
  int? certificateId;

  PinCodeFilterSettings({super.search, this.certificateId});

  @override
  List<PinCode> filterItems(List<PinCode> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      searchExtractors: [(item) => item.code, (item) => item.id.toString()],
    );
  }
}
