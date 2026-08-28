import 'dart:io';
import 'package:dio/dio.dart';
import 'package:saas_ui/src/core/network/server_api.dart';

import 'package:saas_ui/src/core/network/models/response/server_response.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';

enum FailureType {
  none,
  network,
  unauthorized,
  forbidden,
  notFound,
  validation,
  timeout,
  server,
  unknown,
}

class RequestResult<T> {
  final int errorCode;
  final String errorMessage;
  final T? result;
  final FailureType failureType;

  /// Поле для хранения детальных ошибок валидации от сервера.
  /// Обычно содержит мапу вида: {"email": ["Неверный формат"], "password": ["Слишком короткий"]}
  final Map<String, dynamic>? errors;

  RequestResult({
    this.errorCode = 0,
    this.errorMessage = "",
    this.result,
    this.errors,
    FailureType? failureType,
  }) : failureType = failureType ?? _resolveFailureType(errorCode);

  static FailureType _resolveFailureType(int code) {
    if (code == 0 || (code >= 200 && code < 300)) return FailureType.none;
    if (code == 401) return FailureType.unauthorized;
    if (code == 403) return FailureType.forbidden;
    if (code == 404) return FailureType.notFound;
    if (code == 422 || code == 400) return FailureType.validation;
    if (code == 408) return FailureType.timeout;
    if (code >= 500) return FailureType.server;
    if (code < 0) return FailureType.network;
    return FailureType.unknown;
  }

  String get errorString =>
      "$errorCode ${errorMessage.isNotEmpty ? "- $errorMessage" : ""}";

  bool get isSuccess => errorCode == 0 || (errorCode >= 200 && errorCode < 300);

  Future<void> showError({String? title}) async {
    AppSnackbar.showError(title: title ?? 'Ошибка', message: errorString);
  }
}

abstract class BaseRepository {
  final ServerApi api;
  BaseRepository(this.api);

  // => REQUESTS

  /// Основной метод для выполнения сетевых запросов.
  ///
  /// Оборачивает вызов API в стандартную обработку ошибок и логирование.
  Future<RequestResult<T>> sendRequest<T>(
    Future<ServerResponse<T>> Function() serverApiRequest, {
    Object? data,
  }) async {
    try {
      final response = await serverApiRequest();

      final result = RequestResult(
        result: response.result,
        errorCode: response.status.code,
        errorMessage: response.status.message,
      );

      _logResponse(result, data: data);
      return result;
    } on DioException catch (e, stackTrace) {
      final result = _handleDioError<T>(e);
      _logResponse(
        result,
        data: data,
        stackTrace: stackTrace,
        dioOptions: e.requestOptions,
      );
      return result;
    } catch (e, stackTrace) {
      final result = RequestResult<T>(
        errorCode: -1,
        errorMessage: 'Other error: $e',
      );
      _logResponse(result, data: data, stackTrace: stackTrace);
      return result;
    }
  }

  /// Централизованная обработка ошибок Dio.
  RequestResult<T> _handleDioError<T>(DioException e) {
    int code = e.response?.statusCode ?? 500;
    String message = e.response?.statusMessage ?? "Unknown error";
    Map<String, dynamic>? errors;

    // Специфичная обработка SocketException (отсутствие интернета)
    if (e.error is SocketException) {
      final osError = (e.error as SocketException).osError;
      return RequestResult(
        errorCode: osError?.errorCode ?? 0,
        errorMessage: osError?.message ?? 'Socket Exception',
      );
    }

    // Извлечение данных об ошибке из тела ответа
    if (e.response?.data is Map<String, dynamic>) {
      final Map<String, dynamic> body =
          e.response?.data as Map<String, dynamic>;

      // Проверка структуры { status: { code: ..., message: ... } }
      if (body.containsKey("status")) {
        final status = body["status"] as Map<String, dynamic>;
        code = status["code"] ?? code;
        message = status["message"] ?? message;
      } else if (body.containsKey("message")) {
        // Fallback если message лежит в корне
        message = body["message"] ?? message;
      }

      // Извлечение ошибок валидации (если есть)
      if (body.containsKey("errors")) {
        errors = body["errors"];
      }
    }

    // Подмена сообщений для стандартных типов исключений Dio
    message = switch (e.type) {
      DioExceptionType.connectionTimeout => 'Connection Timeout',
      DioExceptionType.sendTimeout => 'Send Timeout',
      DioExceptionType.receiveTimeout => 'Receive Timeout',
      DioExceptionType.cancel => 'Request Cancelled',
      DioExceptionType.connectionError => 'Connection Error',
      DioExceptionType.badCertificate => 'Bad Certificate',
      _ => message,
    };

    return RequestResult(
      errorCode: code,
      errorMessage: message,
      errors: errors,
    );
  }

  /// Унифицированный логгер результатов запроса.
  void _logResponse<T>(
    RequestResult<T> result, {
    Object? data,
    StackTrace? stackTrace,
    RequestOptions? dioOptions,
  }) {
    String details = "";
    if (dioOptions != null) {
      details = "\nURL: ${dioOptions.method} ${dioOptions.path}";
      if (dioOptions.queryParameters.isNotEmpty) {
        details += "\nPARAMS: ${dioOptions.queryParameters}";
      }
      if (dioOptions.data != null) {
        // Если тело запроса еще не залогировано через параметр data
        if (data == null) details += "\nBODY: ${dioOptions.data}";
      }
    }

    final logMessage =
        "API ${result.isSuccess ? 'SUCCESS' : 'ERROR'}: ${result.errorString}$details${data != null ? "\nINPUT DATA: $data" : ""}";

    if (result.isSuccess) {
      AppLogger.request(logMessage);
    } else {
      AppLogger.error(logMessage, stackTrace: stackTrace);
    }
  }
}
