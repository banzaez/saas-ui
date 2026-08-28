import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/constants/app_constants.dart';
import 'package:saas_ui/src/core/network/server_api.dart';
import 'package:saas_ui/src/core/network/interceptors/auth_interceptor.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  dio.options
    ..headers['Accept'] = 'application/json'
    ..headers['Accept-Language'] = "ru"
    ..headers['Content-Type'] = 'application/json';

  dio.interceptors.add(ref.read(authInterceptorProvider));

  return dio;
}

@Riverpod(keepAlive: true)
ServerApi serverApi(Ref ref) {
  return ServerApi(ref.watch(dioProvider));
}
