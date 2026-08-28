import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/gen/assets.gen.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/shared/widgets/sidebar/app_sidebar.dart';

class SupportScreen extends ConsumerWidget {
  final Widget child;

  const SupportScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.path;

    return Scaffold(
      body: Row(
        children: [
          // Боковая панель
          AppSidebar(
            onScreenChanged: (route) => context.go(route),
            currentRoute: currentPath,
            items: _sidebarItems,
          ),
          // Контент
          Expanded(child: child),
        ],
      ),
    );
  }

  static final List<AppSidebarItemData> _sidebarItems = [
    AppSidebarItemData(
      label: 'Компании',
      pathAsset: Assets.sidebar.icons.companies.path,
      route: SupportRouters.companies.fullroute,
    ),
    AppSidebarItemData(
      label: 'Юр. лица',
      pathAsset: Assets.sidebar.icons.legalEntities.path,
      route: SupportRouters.legalEntities.fullroute,
    ),
    AppSidebarItemData(
      label: 'Пользователи',
      pathAsset: Assets.sidebar.icons.users.path,
      route: SupportRouters.users.fullroute,
    ),
    AppSidebarItemData(
      label: 'Продукты',
      pathAsset: Assets.sidebar.icons.services.path,
      route: SupportRouters.products.fullroute,
    ),
    AppSidebarItemData(
      label: 'Пакеты',
      pathAsset: Assets.sidebar.icons.packages.path,
      route: SupportRouters.packages.fullroute,
    ),
    AppSidebarItemData(
      label: 'Транзакции\nтокенов',
      pathAsset: Assets.sidebar.icons.tokenTransactions.path,
      route: SupportRouters.tokenTransactions.fullroute,
    ),
    AppSidebarItemData(
      label: 'Системные логи',
      pathAsset: Assets.sidebar.icons.systemLogs.path,
      route: SupportRouters.logs.fullroute,
    ),
    AppSidebarItemData(
      label: 'Файлы',
      pathAsset: Assets.sidebar.icons.files.path,
      route: SupportRouters.files.fullroute,
    ),
    AppSidebarItemData(
      label: 'Настройки',
      pathAsset: Assets.sidebar.icons.settings.path,
      route: SupportRouters.settings.fullroute,
    ),
  ];
}
