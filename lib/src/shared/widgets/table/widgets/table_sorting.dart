import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/models/settings/sort_settings.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/widgets/table_selector.dart';

class TableSortingWidget<T> extends StatelessWidget {
  const TableSortingWidget({
    super.key,
    required this.initialValue,
    required this.items,
    required this.onChanged,
    required this.onReverseChanged,
    this.isReverse = false,
    this.hint = 'Сортировка',
  });

  final SortField<T>? initialValue;
  final List<SortField<T>> items;
  final ValueChanged<SortField<T>?> onChanged;
  final ValueChanged<bool> onReverseChanged;
  final bool isReverse;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TableSelectorWidget<SortField<T>>(
      icon: Icons.sort,
      hint: hint,
      items: items,
      selectedId: initialValue?.id,
      labelOf: (f) => f.name,
      idOf: (f) => f.id,
      onSelected: onChanged,
      trailingWidget: _buildDirectionButton(),
    );
  }

  Widget _buildDirectionButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: isReverse ? 'По убыванию' : 'По возрастанию',
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => onReverseChanged(!isReverse),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              isReverse
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_upward_rounded,
              color: AppColors.primary,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
