import 'package:go_router/go_router.dart';

import 'package:saas_ui/src/core/routers/router_enums.dart';

// Home Screens
import 'package:saas_ui/src/features/home/companies/presentation/companies_screen.dart';
import 'package:saas_ui/src/features/home/users/presentation/users_screen.dart';
import 'package:saas_ui/src/features/home/statistics/presentation/statistics_screen.dart';
import 'package:saas_ui/src/features/home/invoices/presentation/invoices_screen.dart';
import 'package:saas_ui/src/features/settings/presentation/settings_screen.dart';
import 'package:saas_ui/src/features/home/certificates/presentation/certificates_screen.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/certificate_screen.dart';
import 'package:saas_ui/src/features/home/payments/presentation/payments_screen.dart';
import 'package:saas_ui/src/features/home/legal_entities/presentation/legal_entities_screen.dart';
import 'package:saas_ui/src/features/home/referrals/presentation/referrals_screen.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/tarifs_screen.dart';
import 'package:saas_ui/src/features/support/token_transactions/presentation/token_transaction_screen.dart';
import 'package:saas_ui/src/features/support/logs/presentation/logs_screen.dart';

/// Маршруты раздела "Личный кабинет" (Home)
List<GoRoute> buildHomeRoutes() => [
  _sub(HomeRouters.companies.route, (c, s) => const CompaniesScreen()),
  _sub(HomeRouters.payments.route, (c, s) => const PaymentsScreen()),
  _sub(HomeRouters.statistics.route, (c, s) => const StatisticsScreen()),
  _sub(HomeRouters.invoices.route, (c, s) => const InvoicesScreen()),
  _sub(HomeRouters.certificates.route, (c, s) => const CertificatesScreen()),
  _certificateItemRoute(),
  _sub(HomeRouters.legalEntities.route, (c, s) => const LegalEntitiesScreen()),
  _sub(HomeRouters.users.route, (c, s) => const UsersScreen()),
  _sub(
    HomeRouters.tokenTransactions.route,
    (c, s) => const TokenTransactionScreen(),
  ),
  _sub(HomeRouters.logs.route, (c, s) => const LogsScreen()),
  _sub(HomeRouters.settings.route, (c, s) => const SettingsScreen()),
  _sub(HomeRouters.referrals.route, (c, s) => const ReferralsScreen()),
  _sub(HomeRouters.tarifs.route, (c, s) => const TarifsScreen()),
];

GoRoute _sub(String subPath, GoRouterWidgetBuilder builder) =>
    GoRoute(path: '${MainRouters.home.route}$subPath', builder: builder);

GoRoute _certificateItemRoute() =>
    _sub(HomeRouters.certificateItem.routeWithId, (c, s) {
      final certificateId = s.pathParameters['certificateId'];
      final showBuySection = s.uri.queryParameters['buy'] == 'true';

      return CertificateScreen(
        certificateId: certificateId,
        showBuySection: showBuySection,
      );
    });
