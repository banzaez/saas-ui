import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/base/notifiers/async_crud_notifier.dart';
import '../../../../core/base/notifiers/async_read_only_notifier.dart';
import '../../../../core/models/controller/app_table_source_mixin.dart';
import '../../../../core/network/models/certificate.dart';
import '../../../../core/network/repository/certificates_repository.dart';
import 'settings/certificate_settings.dart';

part 'certificates_notifier.g.dart';

/// Реактивный провайдер списка сертификатов на базе Riverpod 3.x.
@riverpod
class Certificates extends _$Certificates
    with
        AsyncReadOnlyNotifierMixin<Certificate, int, CertificateSettings>,
        AsyncCrudNotifierMixin<Certificate, int, CertificateSettings>,
        AppTableSourceMixin<Certificate, CertificateSettings> {
  CertificateSettings _settings = CertificateSettings();
  @override
  CertificateSettings get settings => _settings;
  @override
  set settings(CertificateSettings value) => _settings = value;

  @override
  CertificatesRepository get repository =>
      ref.read(certificatesRepositoryProvider);

  @override
  FutureOr<List<Certificate>> build() {
    return reloadItems();
  }

  @override
  Certificate createNewInstance() => const Certificate();

  Future<bool> activate(int id) async {
    final result = await repository.activateCertificate(id);
    if (!ref.mounted) return false;
    if (result.isSuccess) {
      await reloadItems();
      if (!ref.mounted) return false;
      return true;
    } else {
      result.showError();
      return false;
    }
  }
}
