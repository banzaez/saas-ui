import 'package:flutter/foundation.dart';

class AppLoggerColors {
  static const reset = '\x1B[0m';
  static const red = '\x1B[31m';
  static const green = '\x1B[32m';
  static const yellow = '\x1B[33m';
  static const blue = '\x1B[34m';
  static const magenta = '\x1B[35m';
  static const cyan = '\x1B[36m';
  static const white = '\x1B[37m';
}

class AppLogger {
  static void info(String message) {
    if (kDebugMode) {
      _log("INFO", message, color: AppLoggerColors.cyan);
    }
  }

  static void success(String message) {
    if (kDebugMode) {
      _log("SUCCESS", message, color: AppLoggerColors.green);
    }
  }

  static void debug(String message) {
    if (kDebugMode) {
      _log("DEBUG", message, color: AppLoggerColors.blue);
    }
  }

  static void request(String message) {
    if (kDebugMode) {
      _log("REQUEST", message, color: AppLoggerColors.magenta);
    }
  }

  static void warning(String message) {
    _log("WARNING", message, color: AppLoggerColors.yellow);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    _log("ERROR", message, color: AppLoggerColors.red);
    if (error != null) {
      debugPrint("${AppLoggerColors.magenta}$error${AppLoggerColors.reset}");
    }
    if (stackTrace != null) debugPrint("$stackTrace");
  }

  static void _log(String tag, String message, {required String color}) {
    debugPrint("$color[$tag] $message${AppLoggerColors.reset}");
  }
}
