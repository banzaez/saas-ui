import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:saas_ui/src/core/constants/app_constants.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/core/services/theme_service.dart';
import 'package:saas_ui/src/core/styles/app_themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaasApp extends ConsumerWidget {
  const SaasApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeServiceProvider);
    final routerInstance = ref.watch(routerProvider);

    return MaterialApp.router(
      title: AppConstants.appTitle,
      routerConfig: routerInstance,
      scaffoldMessengerKey: AppRouters.messengerKey,
      debugShowCheckedModeBanner: AppConstants.serverType != ServerType.prod,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', 'RU')],
      locale: const Locale('ru', 'RU'),
      theme: AppThemes.theme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
    );
  }
}
