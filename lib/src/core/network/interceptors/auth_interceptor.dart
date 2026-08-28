import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/token_service.dart';

part 'auth_interceptor.g.dart';

@Riverpod(keepAlive: true)
AuthInterceptor authInterceptor(Ref ref) => AuthInterceptor(ref);

class AuthInterceptor extends Interceptor {
  final Ref ref;
  AuthInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final userToken = ref.read(tokenServiceProvider);

    if (userToken != null) {
      options.headers['Authorization'] = '${userToken.type} ${userToken.token}';
    }

    handler.next(options);
  }

  bool _isRedirecting = false;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final code = err.response?.statusCode;

    if (code == 401 && _requestSentAuthorization(err.requestOptions)) {
      if (!_isRedirecting) {
        _isRedirecting = true;
        Future.microtask(() async {
          await ref.read(tokenServiceProvider.notifier).clear();
          _isRedirecting = false;
        });
      }
    }

    handler.next(err);
  }
}

bool _requestSentAuthorization(RequestOptions options) {
  final value =
      options.headers['Authorization'] ?? options.headers['authorization'];
  if (value == null) return false;
  final s = value is String ? value : value.toString();
  return s.trim().isNotEmpty;
}
