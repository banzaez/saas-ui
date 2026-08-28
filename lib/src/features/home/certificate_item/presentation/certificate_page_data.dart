import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';

/// Снимок данных экрана одного сертификата (сертификат, пакеты, файлы).
class CertificatePageData {
  const CertificatePageData({
    required this.certificate,
    required this.packages,
    required this.files,
  });

  final Certificate certificate;
  final List<ProductOffer> packages;
  final List<AppFile> files;

  CertificatePageData copyWith({
    Certificate? certificate,
    List<ProductOffer>? packages,
    List<AppFile>? files,
  }) => CertificatePageData(
    certificate: certificate ?? this.certificate,
    packages: packages ?? this.packages,
    files: files ?? this.files,
  );
}
