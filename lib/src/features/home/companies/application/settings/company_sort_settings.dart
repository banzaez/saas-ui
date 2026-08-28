import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/company.dart';

/// Подкласс для управления логикой сортировки компаний.
class CompanySortSettings extends SortSettings<Company> {
  @override
  final List<SortField<Company>> availableSortFields = [
    SortField(
      id: 'name',
      name: 'По наименованию',
      compareTo: (a, b) => a.displayName.compareTo(b.displayName),
    ),
    SortField(
      id: 'id',
      name: 'По ID',
      compareTo: (a, b) => a.id!.compareTo(b.id!),
    ),
  ];

  @override
  String? get initialSortFieldId => 'name';

  CompanySortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  CompanySortSettings createCopy({
    SortField<Company>? sortingBy,
    bool? sortReverse,
  }) => CompanySortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
