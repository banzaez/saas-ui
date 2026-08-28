import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/user.dart';

/// Подкласс для управления логикой сортировки пользователей.
class UserSortSettings extends SortSettings<User> {
  @override
  final List<SortField<User>> availableSortFields = [
    SortField(
      id: 'email',
      name: 'По Email',
      compareTo: (a, b) => a.email.compareTo(b.email),
    ),
    SortField(
      id: 'fullName',
      name: 'По наименованию',
      compareTo: (a, b) => a.fullName.compareTo(b.fullName),
    ),
  ];

  @override
  String? get initialSortFieldId => 'email';

  UserSortSettings({super.sortingBy, super.sortingReverse});

  @override
  UserSortSettings createCopy({
    SortField<User>? sortingBy,
    bool? sortReverse,
  }) => UserSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
