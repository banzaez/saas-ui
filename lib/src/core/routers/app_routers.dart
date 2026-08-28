import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/services/navigation_service.dart';
import 'package:saas_ui/src/features/loading/presentation/loading_screen.dart';
import 'package:saas_ui/src/features/not_found/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Services & Models
import 'package:saas_ui/src/core/services/user_service.dart';
import 'package:saas_ui/src/core/services/token_service.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';

// Auth & Logo
import 'package:saas_ui/src/features/auth/presentation/auth_screen.dart';
import 'package:saas_ui/src/features/logo/presentation/logo_screen.dart';
import 'package:saas_ui/src/features/auth/presentation/password_recovery_screen.dart';

// Buy Screens
import 'package:saas_ui/src/features/buy/presentation/buy_screen.dart';
import 'package:saas_ui/src/features/qr_code/presentation/qr_code_screen.dart';

// Shell screens
import 'package:saas_ui/src/features/home/home_screen.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/tarifs_screen.dart';
import 'package:saas_ui/src/features/support/support_screen.dart';

// Routes
import 'package:saas_ui/src/core/routers/router_enums.dart';
import 'package:saas_ui/src/core/routers/home_routes.dart';
import 'package:saas_ui/src/core/routers/support_routes.dart';

export 'package:saas_ui/src/core/routers/router_enums.dart';

part 'app_routers.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: AppRouters.rootNavigatorKey,
    initialLocation: MainRouters.logo.route,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: notifier,
    redirect: (context, state) => AppRouters._authRedirect(context, state, ref),
    routes: [
      ...AppRouters._publicRoutes(),
      ...AppRouters._homeSectionRoutes(),
      ...AppRouters._supportSectionRoutes(),
      ...AppRouters._otherRoutes(),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

@Riverpod(name: 'routerNotifierProvider')
class RouterNotifier extends _$RouterNotifier implements Listenable {
  final _listeners = <VoidCallback>[];
  bool _pendingNotify = false;

  @override
  void build() {
    ref.listen(tokenServiceProvider, (_, _) => _scheduleNotify());
    ref.listen(userServiceProvider, (_, _) => _scheduleNotify());
    ref.onDispose(_listeners.clear);
  }

  void _scheduleNotify() {
    if (_pendingNotify) return;
    _pendingNotify = true;
    Future.microtask(() {
      _pendingNotify = false;
      _notifyListeners();
    });
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  @override
  void addListener(VoidCallback listener) => _listeners.add(listener);

  @override
  void removeListener(VoidCallback listener) => _listeners.remove(listener);
}

/// Класс управления маршрутизацией приложения.
/// Централизованно описывает все доступные страницы и их настройки с использованием GoRouter.
class AppRouters {
  AppRouters._();

  static const _buyOfferIdParam = 'offerId';
  static const _buyCertificateIdParam = 'certificateId';
  static const _buyCertificateItemIdParam = 'certificateItemId';
  static const _qrPaymentIdParam = 'paymentId';

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _supportNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static final _publicPaths = <String>{
    MainRouters.auth.route,
    MainRouters.logo.route,
    MainRouters.tarifs.route,
    MainRouters.passwordRecovery.route,
  };

  static List<RouteBase> _publicRoutes() => [
    GoRoute(
      path: MainRouters.logo.route,
      builder: (context, state) => const LogoScreen(),
    ),
    GoRoute(
      path: MainRouters.auth.route,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: MainRouters.tarifs.route,
      builder: (context, state) => const TarifsScreen(isStandalone: true),
    ),
    GoRoute(
      path: MainRouters.passwordRecovery.route,
      builder: (context, state) {
        final token = state.uri.queryParameters['token'] ?? '';
        return PasswordRecoveryScreen(token: token);
      },
    ),
    GoRoute(
      path: MainRouters.loading.route,
      builder: (context, state) => const LoadingScreen(),
    ),
  ];

  static List<RouteBase> _homeSectionRoutes() => [
    GoRoute(
      path: MainRouters.home.route,
      redirect: (context, state) =>
          '${MainRouters.home.route}${HomeRouters.certificates.route}',
    ),
    ShellRoute(
      restorationScopeId: 'home-shell',
      navigatorKey: _homeNavigatorKey,
      builder: (context, state, child) => HomeScreen(child: child),
      routes: buildHomeRoutes(),
    ),
  ];

  static List<RouteBase> _supportSectionRoutes() => [
    GoRoute(
      path: MainRouters.support.route,
      redirect: (context, state) =>
          '${MainRouters.support.route}${SupportRouters.packages.route}',
    ),
    ShellRoute(
      navigatorKey: _supportNavigatorKey,
      builder: (context, state, child) => SupportScreen(child: child),
      routes: buildSupportRoutes(),
    ),
  ];

  static List<RouteBase> _otherRoutes() => [
    GoRoute(
      path: MainRouters.buy.route,
      builder: (context, state) {
        final offerId = state.uri.queryParameters[_buyOfferIdParam];
        final certificateId = state.uri.queryParameters[_buyCertificateIdParam];
        final certificateItemId =
            state.uri.queryParameters[_buyCertificateItemIdParam];
        return BuyScreen(
          offerId: offerId,
          certificateId: certificateId,
          certificateItemId: certificateItemId,
        );
      },
    ),
    GoRoute(
      path: '${MainRouters.qrCode.route}/:$_qrPaymentIdParam',
      builder: (context, state) {
        final paymentIdStr = state.pathParameters[_qrPaymentIdParam];
        final paymentId = int.tryParse(paymentIdStr ?? '');
        if (paymentId == null || paymentId <= 0) {
          return const NotFoundScreen();
        }
        return QrCodeScreen(paymentId: paymentId);
      },
    ),
  ];

  /// Логика перенаправления
  static String? _authRedirect(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) {
    final hasSession = ref.read(tokenServiceProvider) != null;

    final userState = ref.read(userServiceProvider);
    final location = state.uri.toString();
    final path = state.uri.path;

    final isAuthPage =
        path == MainRouters.auth.route ||
        path == MainRouters.logo.route ||
        path == MainRouters.loading.route;
    final isPublicPage = _isPublicRoute(location);

    // SSO Check: при наличии sso_token в URL инициируем вход и перенаправляем на экран загрузки
    final ssoToken = state.uri.queryParameters['sso_token'];
    if (ssoToken != null && ssoToken.isNotEmpty) {
      AppLogger.info('SSO token detected, initiating login');
      Future.microtask(
        () => ref.read(userServiceProvider.notifier).loginSso(ssoToken),
      );
      return '${MainRouters.loading.route}?from=${Uri.encodeComponent(path)}';
    }

    // Если данные пользователя всё еще загружаются или мы в процессе SSO - ждем
    if (userState.isLoading) return null;

    // Если SSO/загрузка профиля завершилась с ошибкой — отправляем на auth или home в зависимости от сессии
    if (userState.hasError) {
      return hasSession ? MainRouters.home.route : MainRouters.auth.route;
    }

    // 1. Если сессия есть, а мы на страницах входа/лого/загрузки - редирект дальше
    if (hasSession && isAuthPage) {
      final role = userState.value?.role;
      if (role == null) return null;

      // Если есть сохраненный путь 'from' — идем туда, иначе на начальный экран роли
      final from = state.uri.queryParameters['from'];
      if (from != null && from.isNotEmpty && from != path) {
        return from;
      }

      return getInitialRoute(role);
    }

    // 2. Если страница публичная (Тарифы и т.д.) - ПУСКАЕМ ВСЕГДА
    if (isPublicPage) return null;

    // 3. Если сессии нет и страница НЕ публичная - редирект на Auth с сохранением пути
    if (!hasSession) {
      return '${MainRouters.auth.route}?from=${Uri.encodeComponent(location)}';
    }

    // 4. Проверка доступа по роли (только для защищенных страниц)
    final userRole = userState.value?.role;
    // Роль ещё не загружена — ждём (null при наличии сессии = загрузка профиля не завершена)
    if (userRole == null) return null;
    if (!_checkRole(userRole, path)) {
      return getInitialRoute(userRole);
    }

    return null;
  }

  static bool _isPublicRoute(String location) {
    final path = Uri.parse(location).path;
    return _publicPaths.contains(path);
  }

  static bool _checkRole(UserRole userRole, String path) {
    // 1. Секция поддержки — только для админов и техподдержки
    if (path.startsWith(MainRouters.support.route)) {
      return userRole == UserRole.admin || userRole == UserRole.support;
    }

    // 2. Все остальные защищенные секции (Home, Buy, QR) — доступны всем авторизованным
    final isHomeSection = path.startsWith(MainRouters.home.route);
    final isPaymentSection =
        path.startsWith(MainRouters.buy.route) ||
        path.startsWith(MainRouters.qrCode.route);

    return isHomeSection || isPaymentSection;
  }

  /// Получает начальный путь для роли пользователя
  static String getInitialRoute(UserRole? role) {
    return switch (role) {
      UserRole.admin || UserRole.support => MainRouters.support.route,
      UserRole.owner || UserRole.user => MainRouters.home.route,
      _ => MainRouters.auth.route,
    };
  }

  /// Навигация на экран покупки с параметрами.
  /// Использует queryParameters для соответствия ожиданиям builder в AppRouters.
  static void goToBuy(
    void Function(String) go, {
    required int offerId,
    int? certificateId,
    int? certificateItemId,
    NavigationService? navigationService,
  }) {
    final queryParams = {
      _buyOfferIdParam: offerId.toString(),
      if (certificateId != null)
        _buyCertificateIdParam: certificateId.toString(),
      if (certificateItemId != null)
        _buyCertificateItemIdParam: certificateItemId.toString(),
    };

    final uri = Uri(
      path: MainRouters.buy.route,
      queryParameters: queryParams,
    ).toString();

    AppLogger.info('Navigating to BuyScreen: $uri');

    if (kIsWeb) {
      (navigationService ?? NavigationService()).openInternalInNewTab(uri);
    } else {
      go(uri);
    }
  }
}
