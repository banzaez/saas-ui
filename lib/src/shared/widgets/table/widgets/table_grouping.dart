import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_selector.dart';

class TableGroupingWidget<T> extends StatelessWidget {
  const TableGroupingWidget({
    super.key,
    required this.initialValue,
    required this.items,
    required this.onChanged,
    this.hint = 'Группировка',
  });

  final GroupField<T>? initialValue;
  final List<GroupField<T>> items;
  final ValueChanged<GroupField<T>?> onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return TableSelectorWidget<GroupField<T>>(
      icon: Icons.view_agenda_outlined,
      hint: hint,
      items: items,
      selectedId: initialValue?.id,
      labelOf: (f) => f.name,
      idOf: (f) => f.id,
      onSelected: onChanged,
    );
  }
}
