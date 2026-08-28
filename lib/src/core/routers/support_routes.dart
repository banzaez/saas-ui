import 'package:go_router/go_router.dart';

import 'package:saas_ui/src/core/routers/router_enums.dart';

// Shared Screens
import 'package:saas_ui/src/features/home/companies/presentation/companies_screen.dart';
import 'package:saas_ui/src/features/home/users/presentation/users_screen.dart';
import 'package:saas_ui/src/features/home/legal_entities/presentation/legal_entities_screen.dart';
import 'package:saas_ui/src/features/settings/presentation/settings_screen.dart';

import 'package:saas_ui/src/features/support/token_transactions/presentation/token_transaction_screen.dart';
import 'package:saas_ui/src/features/support/logs/presentation/logs_screen.dart';

// Support-only Screens
import 'package:saas_ui/src/features/support/products/presentation/products_screen.dart';
import 'package:saas_ui/src/features/support/packages/presentation/packages_screen.dart';
import 'package:saas_ui/src/features/support/files/presentation/files_screen.dart';

/// Маршруты раздела "Администрирование" (Support)
List<GoRoute> buildSupportRoutes() => [
  _sub(SupportRouters.companies.route, (c, s) => const CompaniesScreen()),
  _sub(
    SupportRouters.legalEntities.route,
    (c, s) => const LegalEntitiesScreen(),
  ),
  _sub(SupportRouters.users.route, (c, s) => const UsersScreen()),
  _sub(SupportRouters.products.route, (c, s) => const ProductsSupportScreen()),
  _packagesRoute(),
  _sub(
    SupportRouters.tokenTransactions.route,
    (c, s) => const TokenTransactionScreen(),
  ),
  _sub(SupportRouters.logs.route, (c, s) => const LogsScreen()),
  _sub(SupportRouters.files.route, (c, s) => const FilesScreen()),
  _sub(SupportRouters.settings.route, (c, s) => const SettingsScreen()),
];

GoRoute _sub(String subPath, GoRouterWidgetBuilder builder) =>
    GoRoute(path: '${MainRouters.support.route}$subPath', builder: builder);

GoRoute _packagesRoute() => _sub(
  SupportRouters.packages.route,
  (c, s) => const PackagesSupportScreen(),
);
