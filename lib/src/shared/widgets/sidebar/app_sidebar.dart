import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/extensions/ext_string.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/core/services/token_service.dart';
import 'package:saas_ui/src/core/services/user_service.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_version.dart';
import 'package:saas_ui/src/shared/widgets/sidebar/app_sidebar_item.dart';
import 'package:saas_ui/src/shared/widgets/app_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppSidebarItemData {
  final String label;
  final String pathAsset;
  final String route;

  const AppSidebarItemData({
    required this.label,
    required this.pathAsset,
    required this.route,
  });
}

class AppSidebar extends ConsumerStatefulWidget {
  const AppSidebar({
    super.key,
    required this.onScreenChanged,
    required this.currentRoute,
    required this.items,
  });

  final ValueChanged<String> onScreenChanged;
  final String currentRoute;
  final List<AppSidebarItemData> items;

  @override
  ConsumerState<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends ConsumerState<AppSidebar> {
  bool _isCollapsed = false;

  void _toggleSidebar() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      width: _isCollapsed ? 96 : 280, // Optimized width for collapsed state
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Шапка с кнопкой и лого
            _buildHeader(),

            // Навигационное меню (включает кнопку сворачивания в конце)
            Expanded(child: _buildMenu()),

            // DEBUG
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: !_isCollapsed
                  ? _buildDebug().visibleForAdmin(
                    role: ref.watch(userServiceProvider).value?.role,
                  )
                  : const SizedBox.shrink(),
            ),

            // Информация о пользователе (Профиль и Выход)
            _buildUserProfile(context),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: !_isCollapsed
                  ? const AppVersion()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  // => HEADER

  Widget _buildHeader() {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.symmetric(
        horizontal: _isCollapsed ? 0 : 16,
        vertical: _isCollapsed ? 32 : 24,
      ),
      child: Center(
        child: AppLogo(iconSize: 28, fontSize: 15, showTitle: !_isCollapsed),
      ),
    );
  }

  // => MENU

  Widget _buildMenu() => ListView(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    children: [
      ...widget.items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Column(
          children: [
            GestureDetector(
              onTap: () => widget.onScreenChanged(item.route),
              child: AppSidebarItem(
                label: item.label,
                pathAsset: item.pathAsset,
                route: item.route,
                isSelected: widget.currentRoute.startsWith(item.route),
                isCollapsed: _isCollapsed,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              height: index < widget.items.length - 1
                  ? (_isCollapsed ? 12 : 8)
                  : 0,
            ),
          ],
        );
      }),
      // Кнопка сворачивания (сразу под меню)
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: IconButton(
            onPressed: _toggleSidebar,
            icon: AnimatedRotation(
              duration: const Duration(milliseconds: 400),
              turns: _isCollapsed ? 0.5 : 0,
              child: Icon(
                Icons.chevron_left_rounded,
                color: AppColors.greyDarker,
                size: 20,
              ),
            ),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.greyDarker.withValues(alpha: 0.1),
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              minimumSize: const Size(32, 32),
            ),
          ),
        ),
      ),
    ],
  );

  // => DEBUG (Keep as is, but it's hidden in build when collapsed)
  // ... (rest of the helper methods remain mostly the same but use widget. where appropriate)
  // I will include them to ensure completeness

  Widget _buildDebug() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.red.withValues(alpha: 0.05),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.red.withValues(alpha: 0.1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        const Text(
          "DEBUG TOOLS",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
        FittedBox(
          fit: BoxFit.none,
          alignment: Alignment.center,
          child: SizedBox(
            width: 180,
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red.shade900,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => context.go(MainRouters.support.route),
                    child: const Text('Support'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      foregroundColor: Colors.blue.shade900,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () => context.go(MainRouters.home.route),
                    child: const Text('User'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildUserProfile(BuildContext context) {
    final userEmail = ref.watch(userServiceProvider.select((u) => u.value?.email));
    final userRole = ref.watch(userServiceProvider.select((u) => u.value?.role));

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _isCollapsed
          ? Padding(
              key: const ValueKey('collapsed'),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    child: Text(
                      userEmail?.substring(0, 1).toUpperCase() ?? 'U',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  IconButton(
                    onPressed: () =>
                        ref.read(tokenServiceProvider.notifier).clear(),
                    icon: const Icon(Icons.logout_rounded, size: 16),
                    color: AppColors.primary,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primary.withValues(
                        alpha: 0.08,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              key: const ValueKey('expanded'),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white10
                      : Colors.black.withValues(alpha: .05),
                ),
              ),
              child: Column(
                spacing: 8,
                children: [
                  FittedBox(
                    fit: BoxFit.none,
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 220,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: AppColors.primary.withValues(
                              alpha: 0.1,
                            ),
                            child: Text(
                              (userEmail?.split('@').first ?? 'User').toUpperCase()[0],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  userEmail?.split('@').first ?? 'User',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  userRole?.name.capitalizeFirst ?? 'Standard',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.greyDarker,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.none,
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 200,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primary.withValues(
                            alpha: 0.08,
                          ),
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () =>
                            ref.read(tokenServiceProvider.notifier).clear(),
                        icon: const Icon(Icons.logout_rounded, size: 16),
                        label: const Text(
                          'Выйти',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
