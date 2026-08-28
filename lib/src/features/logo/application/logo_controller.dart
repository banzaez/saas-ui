import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart'
    show AppRouters, routerProvider;
import 'package:saas_ui/src/core/services/user_service.dart';

part 'logo_controller.g.dart';

@riverpod
class LogoController extends _$LogoController {
  @override
  void build() {
    // Используем Future.microtask чтобы не блокировать build
    Future.microtask(() => _redirect());
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!ref.mounted) return;

    final userState = ref.read(userServiceProvider);
    final initialRoute = AppRouters.getInitialRoute(userState.value?.role);

    ref.read(routerProvider).go(initialRoute);
  }
}
