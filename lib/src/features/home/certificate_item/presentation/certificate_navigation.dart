import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/routers/router_enums.dart';

/// Переход на экран детализации сертификата (личный кабинет).
void goToCertificateItem(GoRouter router, {required int certificateId}) {
  router.go('${HomeRouters.certificateItem.fullroute}/$certificateId');
}
