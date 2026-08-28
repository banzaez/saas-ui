import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_column.dart';

class TableSidePanel<T> extends ConsumerWidget {
  const TableSidePanel({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Получаем цвета темы один раз
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final surfaceColor = theme.colorScheme.surface;
    final dividerColor = theme.dividerColor;

    final (hiddenColumnIds, availableColumns) = ref.watch(
      appTableProvider<T>(
        tag,
      ).select((s) => (s.hiddenColumnIds, s.availableColumns)),
    );
    final notifier = ref.read(appTableProvider<T>(tag).notifier);

    // Вычисляем список скрытых колонок
    final hiddenIds = hiddenColumnIds;
    final hiddenColumns = availableColumns
        .where((c) => hiddenIds.contains(c.columnId))
        .toList();

    return Container(
      width: 48,
      decoration: BoxDecoration(
        color: surfaceColor.withValues(alpha: 0.5),
        border: Border(
          left: BorderSide(color: dividerColor.withValues(alpha: 0.1)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            _SettingsButton<T>(
              availableColumns: availableColumns,
              hiddenColumnIds: hiddenColumnIds,
              onToggle: notifier.toggleColumnVisibility,
              primaryColor: primaryColor,
            ),
            const SizedBox(height: 16),
            if (hiddenColumns.isNotEmpty) ...[
              Tooltip(
                message: 'Скрытые колонки',
                child: Icon(
                  Icons.visibility_off_outlined,
                  size: 20,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 16),
              ...hiddenColumns.map(
                (col) => _HiddenColumnLabel<T>(
                  column: col,
                  onTap: () => notifier.toggleColumnVisibility(col.columnId),
                  primaryColor: primaryColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Вынесенная кнопка настроек для чистоты кода
class _SettingsButton<T> extends StatelessWidget {
  const _SettingsButton({
    required this.availableColumns,
    required this.hiddenColumnIds,
    required this.onToggle,
    required this.primaryColor,
  });

  final List<AppTableColumn<T>> availableColumns;
  final Set<String> hiddenColumnIds;
  final ValueChanged<String> onToggle;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: PopupMenuButton<String>(
        tooltip: 'Настройка колонок',
        offset: const Offset(-12, 48),
        elevation: 12,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        icon: _buildIcon(),
        onSelected: onToggle,
        itemBuilder: (context) => _buildMenuItems(context),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor.withValues(alpha: 0.15)),
      ),
      child: Icon(Icons.view_column_rounded, size: 20, color: primaryColor),
    );
  }

  List<PopupMenuEntry<String>> _buildMenuItems(BuildContext context) {
    final allPinned = availableColumns.every((c) => c.isPinned);

    return [
      _buildHeader(),
      const PopupMenuDivider(height: 8),
      if (allPinned)
        _buildAllPinnedMessage()
      else
        ...availableColumns.map((col) => _buildColumnItem(col)),
    ];
  }

  PopupMenuItem<String> _buildHeader() {
    return PopupMenuItem<String>(
      enabled: false,
      height: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'КОЛОНКИ ТАБЛИЦЫ',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ).copyWith(letterSpacing: 1.5),
          ),
          const SizedBox(height: 6),
          Container(
            height: 2.5,
            width: 24,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(1.25),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildAllPinnedMessage() {
    return PopupMenuItem<String>(
      enabled: false,
      child: Text(
        'Все колонки закреплены',
        style: TextStyle(
          fontSize: 13,
          color: AppColors.textGrey,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildColumnItem(AppTableColumn<T> col) {
    final isVisible = !hiddenColumnIds.contains(col.columnId) || col.isPinned;
    final canToggle = !col.isPinned;

    return PopupMenuItem<String>(
      value: col.columnId,
      enabled: canToggle,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          _CheckIcon(
            isVisible: isVisible,
            canToggle: canToggle,
            primaryColor: primaryColor,
          ),
          const SizedBox(width: 14),
          if (col.icon != null) ...[
            Icon(
              col.icon,
              size: 18,
              color: isVisible ? AppColors.textColor : AppColors.textGrey,
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              col.title ?? 'Без названия',
              style:
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isVisible
                        ? (canToggle ? AppColors.textColor : AppColors.textGrey)
                        : AppColors.textGrey.withValues(alpha: 0.7),
                  ).copyWith(
                    fontWeight: isVisible ? FontWeight.w600 : FontWeight.w400,
                  ),
            ),
          ),
          if (!canToggle)
            const Icon(Icons.lock_rounded, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}

class _CheckIcon extends StatelessWidget {
  const _CheckIcon({
    required this.isVisible,
    required this.canToggle,
    required this.primaryColor,
  });

  final bool isVisible;
  final bool canToggle;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: isVisible
            ? primaryColor.withValues(alpha: canToggle ? 1.0 : 0.4)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: isVisible
              ? primaryColor.withValues(alpha: canToggle ? 1.0 : 0.4)
              : Theme.of(context).dividerColor.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: isVisible
          ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
          : null,
    );
  }
}

class _HiddenColumnLabel<T> extends StatelessWidget {
  const _HiddenColumnLabel({
    required this.column,
    required this.onTap,
    required this.primaryColor,
  });

  final AppTableColumn<T> column;
  final VoidCallback onTap;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    final title =
        column.title ?? (column.icon != null ? 'Иконка' : 'Без названия');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Tooltip(
        message: title,
        preferBelow: false,
        child: RotatedBox(
          quarterTurns: 1,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.08),
                border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ).copyWith(letterSpacing: 0.2),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.add_rounded, size: 14, color: primaryColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
