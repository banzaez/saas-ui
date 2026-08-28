import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/home/certificates/application/settings/certificate_settings.dart';

part 'certificates_repository.g.dart';

@Riverpod(keepAlive: true)
CertificatesRepository certificatesRepository(Ref ref) =>
    CertificatesRepository(ref.watch(serverApiProvider));

class CertificatesRepository
    extends CrudRepository<Certificate, int, CertificateSettings> {
  CertificatesRepository(super.api);
  @override
  Future<RequestResult<Certificate>> create(Certificate certificate) =>
      sendRequest<Certificate>(() => api.createCertificate(certificate));

  @override
  Future<RequestResult<List<Certificate>>> listAll([
    CertificateSettings? filter,
  ]) => sendRequest<List<Certificate>>(() => api.listCertificates());

  @override
  Future<RequestResult<Certificate>> getById(int id) =>
      sendRequest<Certificate>(() => api.getCertificate(id));

  @override
  Future<RequestResult<Certificate>> update(int id, Certificate certificate) =>
      sendRequest<Certificate>(
        () => api.updateCertificate(
          id,
          certificate.description,
          certificate.ipWhitelist,
        ),
      );

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteCertificate(id));

  Future<RequestResult<bool>> activateCertificate(int id) =>
      sendRequest<bool>(() => api.activateCertificate(id));

  Future<RequestResult<bool>> validateCertificate(String pin) =>
      sendRequest<bool>(() => api.validateCertificate(pin));
}
