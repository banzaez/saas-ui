import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/gen/assets.gen.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/shared/widgets/sidebar/app_sidebar.dart';

class HomeScreen extends ConsumerWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

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
      label: 'Сертификаты',
      pathAsset: Assets.sidebar.icons.certificates.path,
      route: HomeRouters.certificates.fullroute,
    ),
    AppSidebarItemData(
      label: 'Взаиморасчеты',
      pathAsset: Assets.sidebar.icons.payments.path,
      route: HomeRouters.payments.fullroute,
    ),
    AppSidebarItemData(
      label: 'Статистика',
      pathAsset: Assets.sidebar.icons.statistics.path,
      route: HomeRouters.statistics.fullroute,
    ),
    AppSidebarItemData(
      label: 'Юр. лица',
      pathAsset: Assets.sidebar.icons.legalEntities.path,
      route: HomeRouters.legalEntities.fullroute,
    ),
    AppSidebarItemData(
      label: 'Пользователи',
      pathAsset: Assets.sidebar.icons.users.path,
      route: HomeRouters.users.fullroute,
    ),
    AppSidebarItemData(
      label: 'Тарифы',
      pathAsset: Assets.sidebar.icons.tarifs.path,
      route: HomeRouters.tarifs.fullroute,
    ),
    AppSidebarItemData(
      label: 'Транзакции\nтокенов',
      pathAsset: Assets.sidebar.icons.tokenTransactions.path,
      route: HomeRouters.tokenTransactions.fullroute,
    ),
    AppSidebarItemData(
      label: 'Системные логи',
      pathAsset: Assets.sidebar.icons.systemLogs.path,
      route: HomeRouters.logs.fullroute,
    ),
    AppSidebarItemData(
      label: 'Реферальная\nпрограмма',
      pathAsset: Assets.sidebar.icons.referrals.path,
      route: HomeRouters.referrals.fullroute,
    ),
    AppSidebarItemData(
      label: 'Настройки',
      pathAsset: Assets.sidebar.icons.settings.path,
      route: HomeRouters.settings.fullroute,
    ),
  ];
}
