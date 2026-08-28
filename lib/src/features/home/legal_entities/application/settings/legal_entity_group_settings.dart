import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';

/// Настройки группировки юридических лиц в табличном отображении.
class LegalEntityGroupSettings extends GroupSettings<LegalEntity> {
  @override
  final List<GroupField<LegalEntity>> availableGroupFields = [
    GroupField(id: 'none', name: 'Без группировки', groupBy: (item) => null),
    GroupField(
      id: 'company_name',
      name: 'По компаниям',
      groupBy: (item) => item.companyName,
    ),
  ];

  @override
  String? get initialGroupFieldId => 'company_name';

  LegalEntityGroupSettings({super.groupBy});

  @override
  LegalEntityGroupSettings createCopy({GroupField<LegalEntity>? groupBy}) =>
      LegalEntityGroupSettings(groupBy: groupBy);
}
