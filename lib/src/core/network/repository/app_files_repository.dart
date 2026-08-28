import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/features/support/files/application/settings/app_file_settings.dart';
import 'package:saas_ui/src/core/network/models/response/app_file_upload_response.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';

part 'app_files_repository.g.dart';

@Riverpod(keepAlive: true)
AppFilesRepository appFilesRepository(Ref ref) =>
    AppFilesRepository(ref.watch(serverApiProvider), ref.watch(dioProvider));

class AppFilesRepository
    extends ReadOnlyRepository<AppFile, int, AppFileSettings> {
  final Dio _dio;
  AppFilesRepository(super.api, this._dio);

  @override
  Future<RequestResult<AppFile>> getById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<RequestResult<List<AppFile>>> listAll([AppFileSettings? filter]) =>
      sendRequest<List<AppFile>>(
        () => api.listFiles(
          filter?.filter.companyId,
          filter?.filter.productId,
          filter?.offset,
          filter?.limit,
        ),
      );

  Future<RequestResult<AppFileUploadResponse>> upload(
    MultipartFile file,
    int? productId,
    String? uuid, {
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) => sendRequest<AppFileUploadResponse>(
    () => api.uploadFile(
      file,
      productId,
      uuid,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    ),
  );

  Future<RequestResult<Uint8List>> download(
    String? mimetype,
    int fileId, {
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    final String url = '/file/$fileId/download';
    try {
      // Используем прямой вызов Dio для поддержки прогресса
      final headers = <String, dynamic>{};
      if (mimetype != null) {
        headers['Accept'] = mimetype;
      }

      final response = await _dio.get<Uint8List>(
        url,
        options: Options(responseType: ResponseType.bytes, headers: headers),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      final result = response.data;
      if (result == null) {
        throw Exception('Empty response data');
      }

      AppLogger.info('Downloaded file size: ${result.length} bytes');

      return RequestResult<Uint8List>(result: result);
    } catch (e) {
      AppLogger.error('Error downloading file: $e');
      return RequestResult<Uint8List>(errorCode: 1, errorMessage: e.toString());
    }
  }

  Future<RequestResult<void>> delete(int fileId) =>
      sendRequest<void>(() => api.deleteFiles(fileId));
}
