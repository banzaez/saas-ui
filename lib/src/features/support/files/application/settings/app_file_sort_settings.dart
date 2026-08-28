import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';

/// Настройки сортировки файлов.
class AppFileSortSettings extends SortSettings<AppFile> {
  @override
  final List<SortField<AppFile>> availableSortFields = [
    SortField(
      id: 'filename',
      name: 'По имени файла',
      compareTo: (a, b) => a.filename.compareTo(b.filename),
    ),
    SortField(
      id: 'product',
      name: 'По продукту',
      compareTo: (a, b) => (a.productName ?? '').compareTo(b.productName ?? ''),
    ),
  ];

  @override
  String? get initialSortFieldId => 'filename';

  AppFileSortSettings({
    super.sortingBy,
    super.sortingReverse,
  });

  @override
  AppFileSortSettings createCopy({
    SortField<AppFile>? sortingBy,
    bool? sortReverse,
  }) => AppFileSortSettings(
    sortingBy: sortingBy ?? this.sortingBy,
    sortingReverse: sortReverse ?? sortingReverse,
  );
}
