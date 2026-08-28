import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table.dart';
import 'package:saas_ui/src/shared/widgets/table/app_table_notifier.dart';
import 'package:saas_ui/src/shared/widgets/table/table_style.dart';

class TableGroupHeader<T> extends ConsumerWidget {
  const TableGroupHeader({
    super.key,
    required this.tag,
    required this.groupTitle,
  });

  final String tag;
  final String groupTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCollapsed = ref.watch(
      appTableProvider<T>(
        tag,
      ).select((s) => s.collapsedGroups[groupTitle] ?? false),
    );
    final notifier = ref.read(appTableProvider<T>(tag).notifier);
    final hoverColor = TableStyle.getHoverColor(context);

    return Container(
      height: AppTable.defaultGroupHeaderHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.02)
            : AppColors.primary.withValues(alpha: 0.03),
        border: Border(
          left: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 3.0,
          ),
          bottom: BorderSide(color: TableStyle.getDividerColor(context)),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          hoverColor: hoverColor,
          highlightColor: hoverColor,
          splashColor: hoverColor,
          onTap: () => notifier.toggleGroup(groupTitle),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    isCollapsed
                        ? Icons.keyboard_arrow_right
                        : Icons.keyboard_arrow_down,
                    key: ValueKey<bool>(isCollapsed),
                    size: 20,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    groupTitle.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ).copyWith(letterSpacing: 1.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
