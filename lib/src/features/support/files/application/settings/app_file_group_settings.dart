import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';

/// Настройки группировки файлов в табличном отображении.
class AppFileGroupSettings extends GroupSettings<AppFile> {
  @override
  final List<GroupField<AppFile>> availableGroupFields = [
    GroupField(id: 'none', name: 'Без группировки', groupBy: (_) => null),
    GroupField(
      id: 'product',
      name: 'По продукту',
      groupBy: (item) => item.productName ?? 'root',
    ),
  ];

  @override
  String? get initialGroupFieldId => 'product';

  AppFileGroupSettings({super.groupBy});

  @override
  AppFileGroupSettings createCopy({GroupField<AppFile>? groupBy}) =>
      AppFileGroupSettings(groupBy: groupBy);
}
