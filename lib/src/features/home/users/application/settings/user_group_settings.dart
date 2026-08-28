import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/user.dart';

class UserGroupSettings extends GroupSettings<User> {
  @override
  final List<GroupField<User>> availableGroupFields = [
    GroupField(id: 'none', name: 'Без группировки', groupBy: (item) => null),
    GroupField(
      id: 'role',
      name: 'По роли',
      groupBy: (item) => item.role.text(),
    ),
    GroupField(
      id: 'company_name',
      name: 'По компании',
      groupBy: (item) => item.companyName,
    ),
  ];

  @override
  String? get initialGroupFieldId => 'none';

  UserGroupSettings({super.groupBy});

  @override
  UserGroupSettings createCopy({GroupField<User>? groupBy}) =>
      UserGroupSettings(groupBy: groupBy);
}
