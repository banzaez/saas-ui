import 'package:saas_ui/src/core/models/base_list_settings.dart';

/// Клиентская фильтрация списка для таблицы (как [ReadOnlyController.items]).
/// Сортировка выполняется в [AppTableNotifier._sortItems] — единственный слой.
List<T> displayedTableItems<T>(
  List<T> raw,
  BaseListSettings<T, dynamic>? settings,
) {
  var list = List<T>.from(raw);

  final s = settings;
  if (s != null) {
    list = s.filter.filterItems(list);
  }

  return list;
}
