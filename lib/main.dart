import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:saas_ui/src/app.dart';
import 'package:saas_ui/src/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saas_ui/src/core/services/shared_preferences_provider.dart';
import 'package:saas_ui/src/core/util/url_strategy/url_strategy.dart';

import 'package:saas_ui/src/core/util/app_provider_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureUrl();

  await initializeDateFormatting('ru_RU', null);

  await AppConstants.loadConfig();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const SaasApp(),
    ),
  );
}
