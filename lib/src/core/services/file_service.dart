import 'package:dio/dio.dart' as dio;
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/network/models/response/app_file_upload_response.dart';
import 'package:saas_ui/src/core/network/repository/app_files_repository.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';

part 'file_service.g.dart';

class FileOperationProgress extends ChangeNotifier {
  FileOperationProgress({required this.filename});

  final String filename;

  double progress = 0;
  int bytesProcessed = 0;
  int? totalBytes;
  String remainingTime = '';
  bool isRunning = false;

  DateTime? _startTime;
  final dio.CancelToken cancelToken = dio.CancelToken();

  void start() {
    isRunning = true;
    _startTime = DateTime.now();
    notifyListeners();
  }

  void update(int processed, int total) {
    bytesProcessed = processed;
    if (total != -1 && total > 0) {
      totalBytes = total;
      progress = (processed / total).clamp(0.0, 1.0);

      if (_startTime != null && processed > 0) {
        final elapsed = DateTime.now().difference(_startTime!);
        final speed = processed / elapsed.inMilliseconds;
        if (speed > 0) {
          final remainingBytes = total - processed;
          final remainingMs = remainingBytes / speed;
          remainingTime = _formatDuration(
            Duration(milliseconds: remainingMs.toInt()),
          );
        }
      }
    } else {
      totalBytes = null;
      remainingTime = '';
    }
    notifyListeners();
  }

  void complete() {
    isRunning = false;
    progress = 1.0;
    notifyListeners();
  }

  void cancel() {
    cancelToken.cancel('Operation cancelled by user');
    isRunning = false;
    notifyListeners();
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours} ч ${duration.inMinutes.remainder(60)} мин ${duration.inSeconds.remainder(60)} сек';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} мин ${duration.inSeconds.remainder(60)} сек';
    } else {
      return '${duration.inSeconds} сек';
    }
  }
}

class FileService {
  FileService(this._filesRepository);

  final AppFilesRepository _filesRepository;

  Future<T?> _runTask<T>({
    required FileOperationProgress operation,
    required Future<RequestResult<T>> Function(
      dio.CancelToken cancelToken,
      dio.ProgressCallback onProgress,
    )
    task,
    void Function(FileOperationProgress op)? onTaskStart,
    VoidCallback? onTaskComplete,
  }) async {
    operation.start();

    onTaskStart?.call(operation);

    try {
      final response = await task(operation.cancelToken, operation.update);

      if (response.isSuccess) {
        operation.complete();
        AppLogger.success('File operation completed: ${operation.filename}');
        return response.result;
      } else {
        if (!operation.cancelToken.isCancelled) {
          AppLogger.error(
            'File operation failed: ${operation.filename}. ${response.errorString}',
          );
          response.showError();
        } else {
          AppLogger.info('File operation cancelled: ${operation.filename}');
        }
        return null;
      }
    } catch (e) {
      AppLogger.error('File task failed: ${operation.filename}', error: e);
      return null;
    } finally {
      onTaskComplete?.call();
    }
  }

  Future<AppFileUploadResponse?> uploadFile(
    dio.MultipartFile file, {
    int? productId,
    String? uuid,
    void Function(FileOperationProgress op)? onTaskStart,
    VoidCallback? onTaskComplete,
  }) async {
    final filename = file.filename ?? 'Файл';
    AppLogger.info('Starting file upload: $filename');

    return _runTask<AppFileUploadResponse>(
      operation: FileOperationProgress(filename: filename),
      onTaskStart: onTaskStart,
      onTaskComplete: onTaskComplete,
      task: (cancelToken, onProgress) => _filesRepository.upload(
        file,
        productId,
        uuid,
        cancelToken: cancelToken,
        onSendProgress: onProgress,
      ),
    );
  }

  Future<void> downloadFile(
    AppFile item, {
    void Function(FileOperationProgress op)? onTaskStart,
    VoidCallback? onTaskComplete,
  }) async {
    AppLogger.info('Starting file download: ${item.filename}');

    final bytes = await _runTask<Uint8List>(
      operation: FileOperationProgress(filename: item.filename),
      onTaskStart: onTaskStart,
      onTaskComplete: onTaskComplete,
      task: (cancelToken, onProgress) => _filesRepository.download(
        item.mimetype,
        item.id!,
        cancelToken: cancelToken,
        onReceiveProgress: onProgress,
      ),
    );

    if (bytes != null) {
      try {
        await FileSaver.instance.saveFile(name: item.filename, bytes: bytes);
        AppLogger.success('File saved to downloads: ${item.filename}');
      } catch (e) {
        AppLogger.error(
          'Failed to save downloaded file: ${item.filename}',
          error: e,
        );
        AppSnackbar.showError(
          title: 'Ошибка',
          message: 'Не удалось сохранить файл',
        );
      }
    }
  }
}

@Riverpod(keepAlive: true)
FileService fileService(Ref ref) {
  return FileService(ref.watch(appFilesRepositoryProvider));
}
