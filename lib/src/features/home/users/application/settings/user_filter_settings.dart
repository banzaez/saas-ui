import 'package:saas_ui/src/core/models/settings/filter_settings.dart';
import 'package:saas_ui/src/core/network/models/user.dart';

/// Настройки фильтрации для списка пользователей.
class UserFilterSettings extends FilterSettings<User> {
  UserRole? role;

  UserFilterSettings({super.search, this.role});

  @override
  List<User> filterItems(List<User> items) {
    return FilterHelpers.apply(
      items,
      search: search,
      fieldFilters: [if (role != null) (item) => item.role == role],
      searchExtractors: [
        (item) => item.fullName,
        (item) => item.email,
        (item) => item.companyName,
        (item) => item.id.toString(),
      ],
    );
  }
}
