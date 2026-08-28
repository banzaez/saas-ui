import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/user.dart';

import 'user_filter_settings.dart';
import 'user_group_settings.dart';
import 'user_sort_settings.dart';

export 'user_filter_settings.dart';
export 'user_group_settings.dart';
export 'user_sort_settings.dart';

/// Класс настроек для списка пользователей.
/// Объединяет в себе параметры фильтрации и сортировки.
class UserSettings extends BaseListSettings<User, UserSettings>
    with FilterWithPagination {
  @override
  final UserFilterSettings filter;

  @override
  final UserSortSettings sort;

  final UserGroupSettings _group;

  @override
  UserGroupSettings get group => _group;

  UserSettings({
    String? search,
    UserRole? role,
    SortField<User>? sortingBy,
    bool sortingReverse = false,
    UserGroupSettings? group,
  }) : filter = UserFilterSettings(search: search, role: role),
       sort = UserSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       ),
       _group = group ?? UserGroupSettings();

  @override
  UserSettings createCopy({
    SortSettings<User>? sort,
    GroupSettings<User>? group,
  }) => UserSettings(
    search: filter.search,
    role: filter.role,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
    group: group as UserGroupSettings? ?? _group,
  );
}
