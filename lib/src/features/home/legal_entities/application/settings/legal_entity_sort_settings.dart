import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';

/// Подкласс для управления логикой сортировки юридических лиц.
class LegalEntitySortSettings extends SortSettings<LegalEntity> {
  @override
  final List<SortField<LegalEntity>> availableSortFields = [
    SortField(
      id: 'name',
      name: 'По наименованию',
      compareTo: (a, b) => a.fullName.compareTo(b.fullName),
    ),
    SortField(
      id: 'inn',
      name: 'По ИНН',
      compareTo: (a, b) => a.inn.compareTo(b.inn),
    ),
  ];

  @override
  String? get initialSortFieldId => 'name';

  LegalEntitySortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  LegalEntitySortSettings createCopy({
    SortField<LegalEntity>? sortingBy,
    bool? sortReverse,
  }) => LegalEntitySortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
