import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/cells/app_table_cell.dart';

class ActionMenuItem {
  static PopupMenuItem build({
    required VoidCallback onTap,
    required String label,
    required IconData icon,
    Color? color,
  }) {
    final activeColor = color ?? AppColors.primary;

    return PopupMenuItem(
      onTap: onTap,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Icon(icon, size: 20, color: activeColor),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: activeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class RowActionsCell extends AppTableCell {
  const RowActionsCell({
    super.key,
    this.items,
    super.leading,
    super.trailing,
    this.onDelete,
    super.padding = EdgeInsets.zero,
  });

  final List<PopupMenuItem>? items;
  final VoidCallback? onDelete;

  @override
  Widget buildValue(BuildContext context, TextStyle style) => Container(
    alignment: Alignment.center,
    child: PopupMenuButton(
      elevation: 8,
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.transparent,
      splashRadius: 20,
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_horiz_rounded, color: AppColors.primary, size: 22),
      offset: const Offset(0, 8),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
        ),
      ),
      itemBuilder: (context) => <PopupMenuEntry>[
        ...items ?? [],
        if (onDelete != null) ...[
          if (items?.isNotEmpty ?? false) const PopupMenuDivider(height: 1),
          ActionMenuItem.build(
            onTap: () => _delete(context),
            label: 'Удалить',
            icon: Icons.delete_outline_rounded,
            color: AppColors.error,
          ),
        ],
      ],
    ),
  );

  // ----------DELETE-------------------------------------------------------------------------------

  Future<void> _delete(BuildContext context) async {
    final result = await _showDeleteDialog(context);
    if (result == true) {
      onDelete?.call();
    }
  }

  Future<bool?> _showDeleteDialog(
    BuildContext context,
  ) async => await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Row(
        spacing: 12,
        children: [
          Icon(Icons.warning_amber_rounded, color: AppColors.error),
          Text('Подтверждение'),
        ],
      ),
      content: const Text(
        'Вы уверены, что хотите безвозвратно удалить этот элемент?',
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(
            'Отмена',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => context.pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Удалить'),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
