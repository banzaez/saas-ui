import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/mixins/filter_with_pagination.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';

import 'legal_entity_filter_settings.dart';
import 'legal_entity_group_settings.dart';
import 'legal_entity_sort_settings.dart';

export 'legal_entity_filter_settings.dart';
export 'legal_entity_group_settings.dart';
export 'legal_entity_sort_settings.dart';

/// Класс настроек для списка юридических лиц.
/// Объединяет в себе параметры фильтрации и сортировки.
class LegalEntitySettings
    extends BaseListSettings<LegalEntity, LegalEntitySettings>
    with FilterWithPagination {
  @override
  final LegalEntityFilterSettings filter;

  @override
  final LegalEntitySortSettings sort;

  final LegalEntityGroupSettings _group;

  @override
  LegalEntityGroupSettings get group => _group;

  LegalEntitySettings({
    String? search,
    SortField<LegalEntity>? sortingBy,
    bool sortingReverse = false,
    LegalEntityGroupSettings? group,
  }) : filter = LegalEntityFilterSettings(search: search),
       sort = LegalEntitySortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       ),
       _group = group ?? LegalEntityGroupSettings();

  @override
  LegalEntitySettings createCopy({
    SortSettings<LegalEntity>? sort,
    GroupSettings<LegalEntity>? group,
  }) => LegalEntitySettings(
    search: filter.search,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
    group: group as LegalEntityGroupSettings? ?? _group,
  );
}
