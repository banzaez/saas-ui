import 'package:saas_ui/src/core/models/base_list_settings.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';

import 'certificate_filter_settings.dart';
import 'certificate_group_settings.dart';
import 'certificate_sort_settings.dart';

export 'certificate_filter_settings.dart';
export 'certificate_group_settings.dart';
export 'certificate_sort_settings.dart';

/// Настройки для списка сертификатов.
/// Объединяет параметры фильтрации, сортировки и группировки.
/// Пагинация отсутствует — API возвращает весь список.
class CertificateSettings
    extends BaseListSettings<Certificate, CertificateSettings> {
  @override
  final CertificateFilterSettings filter;

  @override
  final CertificateSortSettings sort;

  final CertificateGroupSettings _group;

  @override
  CertificateGroupSettings get group => _group;

  CertificateSettings({
    String? search,
    SortField<Certificate>? sortingBy,
    bool sortingReverse = true,
    CertificateGroupSettings? group,
  }) : filter = CertificateFilterSettings(search: search),
       sort = CertificateSortSettings(
         sortingBy: sortingBy,
         sortingReverse: sortingReverse,
       ),
       _group = group ?? CertificateGroupSettings();

  @override
  CertificateSettings createCopy({
    SortSettings<Certificate>? sort,
    GroupSettings<Certificate>? group,
  }) => CertificateSettings(
    search: filter.search,
    sortingBy: sort?.sortingBy ?? this.sort.sortingBy,
    sortingReverse: sort?.sortingReverse ?? this.sort.sortingReverse,
    group: group as CertificateGroupSettings? ?? _group,
  );
}
