import 'dart:async';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/models/response/app_file_upload_response.dart';
import 'package:saas_ui/src/core/network/repository/app_files_repository.dart';
import 'package:saas_ui/src/core/network/repository/products_repository.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/core/services/file_service.dart';
import 'package:saas_ui/src/features/support/files/application/files_panel_notifier.dart';
import 'package:saas_ui/src/features/support/files/application/settings/app_file_settings.dart';
import 'package:saas_ui/src/features/support/products/application/settings/product_settings.dart';
import 'package:saas_ui/src/shared/widgets/dialogs/dialog_file_progress.dart';
import 'package:dio/dio.dart' as dio;

part 'files_notifier.g.dart';

@riverpod
Future<List<Product>> filesProducts(Ref ref) async {
  final res = await ref
      .read(productsRepositoryProvider)
      .listAll(ProductSettings(activeOnly: false));
  if (res.isSuccess) return res.result ?? [];
  res.showError();
  return [];
}

@riverpod
class Files extends _$Files
    with
        AsyncReadOnlyNotifierMixin<AppFile, int, AppFileSettings>,
        AppTableSourceMixin<AppFile, AppFileSettings> {
  AppFileSettings _settings = AppFileSettings();
  @override
  AppFileSettings get settings => _settings;
  @override
  set settings(AppFileSettings value) => _settings = value;

  @override
  AppFilesRepository get repository => ref.read(appFilesRepositoryProvider);

  @override
  FutureOr<List<AppFile>> build() => reloadItems();

  Future<AppFileUploadResponse?> uploadFile(
    dio.MultipartFile file,
    int? productId, {
    String? uuid,
  }) async {
    final result = await ref
        .read(fileServiceProvider)
        .uploadFile(
          file,
          productId: productId,
          uuid: uuid,
          onTaskStart: (op) {
            final context = AppRouters.rootNavigatorKey.currentContext;
            if (context != null) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => UploadProgressDialog(
                  filename: file.filename ?? 'Файл',
                  operation: op,
                ),
              );
            }
          },
          onTaskComplete: () => AppRouters.rootNavigatorKey.currentState?.pop(),
        );
    if (result != null) {
      ref.read(filesPanelProvider.notifier).close();
      Future<void>.delayed(const Duration(milliseconds: 100), () {
        if (ref.mounted) reloadItems();
      });
    }
    return result;
  }

  Future<void> deleteFile(int fileId) async {
    final response = await repository.delete(fileId);
    if (!ref.mounted) return;
    if (response.isSuccess) {
      Future<void>.delayed(const Duration(milliseconds: 100), () {
        if (ref.mounted) reloadItems();
      });
    } else {
      response.showError();
    }
  }
}
