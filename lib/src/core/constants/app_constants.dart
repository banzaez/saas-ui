import 'dart:convert' show json;

import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

class AppConstants {
  AppConstants._();

  static const String appTitle = 'Нейроинструменты';

  static String appVersion = '';

  // -------------------------------------------------------------------- //

  // Тип сервера для отладки
  // На проде смотрит в файл web/.config.json
  static const ServerType serverType = ServerType.prod;

  // Кэш для загруженного конфига
  static Map<String, dynamic>? _configCache;

  // Загрузка конфига из JSON файла (только для веб)
  static Future<void> loadConfig() async {
    // Загрузка версии из pubspec.yaml
    final packageInfo = await PackageInfo.fromPlatform();
    appVersion = '${packageInfo.version}+${packageInfo.buildNumber}';

    if (kIsWeb == false || kDebugMode == true) return;

    try {
      final response = await http
          .get(Uri.parse('/.config.json'))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        _configCache = json.decode(response.body) as Map<String, dynamic>;
      }
    } catch (e) {
      // Если конфиг не найден, используем значения по умолчанию
      _configCache = null;
    }
  }

  static String get apiUrl {
    // Для веб-платформы проверяем загруженный конфиг
    if (kIsWeb && _configCache != null && _configCache!['apiUrl'] != null) {
      return _configCache!['apiUrl'] as String;
    }

    // Fallback на значение по умолчанию
    // На проде смотрит в файл web/.config.json
    return serverType.url;
  }
}

/// Документация API http://95.216.39.100:88/app_api/docs
/// Если выкладываем на прод указываем URL в файле web/.config.json !!!
enum ServerType {
  test('http://95.216.39.100:89/app_api', 'Кейсофт TEST'), // Кейсофт TEST
  prod('https://lk.ai-opisanie.ru/app_api', 'Кейсофт RDS'), // Кейсофт RDS
  local('http://localhost:8008', 'Локальный сервер'); // Локальный сервер

  final String url;
  final String name;

  const ServerType(this.url, this.name);

  bool get isTest => this == ServerType.test;
  bool get isProd => this == ServerType.prod;
  bool get isLocal => this == ServerType.local;
}
