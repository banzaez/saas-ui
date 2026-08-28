import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';

/// Настройки группировки сертификатов в табличном отображении.
class CertificateGroupSettings extends GroupSettings<Certificate> {
  @override
  final List<GroupField<Certificate>> availableGroupFields = [
    GroupField(id: 'none', name: 'Без группировки', groupBy: (_) => null),
    GroupField(
      id: 'company',
      name: 'По компании',
      groupBy: (item) => '${item.companyName} (${item.companyId})',
    ),
  ];

  @override
  String? get initialGroupFieldId => 'none';

  CertificateGroupSettings({super.groupBy});

  @override
  CertificateGroupSettings createCopy({GroupField<Certificate>? groupBy}) =>
      CertificateGroupSettings(groupBy: groupBy);
}
