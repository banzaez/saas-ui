import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';

/// Общий виджет выбора из выпадающего списка для тулбара таблицы.
/// Используется в [TableSortingWidget] и [TableGroupingWidget].
class TableSelectorWidget<V> extends StatelessWidget {
  const TableSelectorWidget({
    super.key,
    required this.icon,
    required this.hint,
    required this.items,
    required this.selectedId,
    required this.labelOf,
    required this.onSelected,
    this.idOf,
    this.trailingWidget,
  });

  /// Иконка слева от текущего значения
  final IconData icon;

  /// Подсказка когда ничего не выбрано
  final String hint;

  /// Все доступные опции
  final List<V> items;

  /// ID текущего выбранного значения (для сравнения)
  final String? selectedId;

  /// Возвращает отображаемое имя элемента
  final String Function(V) labelOf;

  /// Возвращает уникальный ID элемента
  final String Function(V)? idOf;

  /// Возвращает уникальный ID элемента (из функции или по умолчанию)
  String _idOf(V item) => idOf != null ? idOf!(item) : labelOf(item);

  /// Callback при выборе элемента (null = сброс)
  final ValueChanged<V?> onSelected;

  /// Опциональный виджет справа (например, кнопка направления сортировки)
  final Widget? trailingWidget;

  /// Находит выбранный элемент по selectedId.
  /// Возвращает null, если selectedId не задан или не найден.
  V? get _selectedItem {
    if (selectedId == null) return null;
    for (final item in items) {
      if (_idOf(item) == selectedId) return item;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: _buildSelector(context)),
            if (trailingWidget != null) ...[
              _buildVerticalDivider(),
              trailingWidget!,
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSelector(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Theme(
        data: Theme.of(context).copyWith(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: PopupMenuButton<V>(
          onSelected: onSelected,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          offset: const Offset(0, 44),
          itemBuilder: (context) => _buildMenuItems(context),
          child: _buildTrigger(),
        ),
      ),
    );
  }

  List<PopupMenuEntry<V>> _buildMenuItems(BuildContext context) {
    // Кешируем selectedId для избежания повторных вычислений
    final currentSelectedId = selectedId;
    final theme = Theme.of(context);

    return items.map((item) {
      final itemId = _idOf(item);
      final isSelected = itemId == currentSelectedId;
      return PopupMenuItem<V>(
        value: item,
        child: Row(
          spacing: 12,
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
              size: 20,
            ),
            Text(
              labelOf(item),
              style: isSelected
                  ? const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    )
                  : const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildTrigger() {
    final selectedItem = _selectedItem;
    final label = selectedItem;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Icon(icon, color: AppColors.primary, size: 16),
          Flexible(
            child: Text(
              label != null ? labelOf(label) : hint,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 16),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 16,
      color: AppColors.primary.withValues(alpha: 0.2),
    );
  }
}
