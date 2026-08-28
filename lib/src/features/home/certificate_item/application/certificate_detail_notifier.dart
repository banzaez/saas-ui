import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/certificate_item.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/repository/app_files_repository.dart';
import 'package:saas_ui/src/core/network/repository/certificates_repository.dart';
import 'package:saas_ui/src/core/network/repository/invoices_repository.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/features/home/certificate_item/presentation/certificate_page_data.dart';
import 'package:saas_ui/src/features/support/files/application/settings/app_file_settings.dart';
import 'package:saas_ui/src/features/support/packages/application/settings/product_offer_settings.dart';
import 'package:saas_ui/src/shared/widgets/clipboard_helper/clipboard_helper.dart';

part 'certificate_detail_notifier.g.dart';

@riverpod
class CertificateDetail extends _$CertificateDetail {
  @override
  FutureOr<CertificatePageData?> build(int certificateId) async {
    if (certificateId <= 0) return null;
    return _load(certificateId);
  }

  Future<CertificatePageData?> _load(int id) async {
    final certRes = await ref.read(certificatesRepositoryProvider).getById(id);
    if (!certRes.isSuccess) {
      certRes.showError();
      return null;
    }

    var cert = certRes.result!;
    final items = List<CertificateItem>.from(cert.certificateItems)
      ..sort((a, b) => b.tokensRemaining.compareTo(a.tokensRemaining));
    cert = cert.copyWith(certificateItems: items);

    cert = await _hydrateInvoices(cert);

    final packages = await _loadPackages(cert.productId);
    final files = await _loadFiles(cert.productId);

    return CertificatePageData(
      certificate: cert,
      packages: packages,
      files: files,
    );
  }

  Future<List<ProductOffer>> _loadPackages(int productId) async {
    final response = await ref
        .read(productOffersRepositoryProvider)
        .listAll(ProductOfferSettings(productId: productId, activeOnly: true));
    final list = List<ProductOffer>.from(response.result ?? []);
    list.sort((a, b) => a.price.compareTo(b.price));
    return list;
  }

  Future<List<AppFile>> _loadFiles(int productId) async {
    final response = await ref
        .read(appFilesRepositoryProvider)
        .listAll(AppFileSettings(productId: productId));
    if (response.isSuccess) return response.result ?? [];
    response.showError();
    return [];
  }

  Future<Certificate> _hydrateInvoices(Certificate cert) async {
    final repo = ref.read(invoicesRepositoryProvider);
    final newItems = <CertificateItem>[];

    for (final element in cert.certificateItems) {
      var invoices = List<Invoice>.from(element.invoices);
      for (final invoiceId in element.invoiceIds) {
        if (invoices.any((i) => i.id == invoiceId)) continue;
        final invoiceResponse = await repo.getById(invoiceId);
        if (invoiceResponse.isSuccess) {
          invoices = [...invoices, invoiceResponse.result!];
        } else {
          invoiceResponse.showError();
          return cert;
        }
      }
      newItems.add(element.copyWith(invoices: invoices));
    }

    return cert.copyWith(certificateItems: newItems);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => _load(certificateId));
  }

  Future<bool> _saveCertificate(Certificate certificate) async {
    final id = certificate.id;
    if (id == null) return false;
    final res = await ref
        .read(certificatesRepositoryProvider)
        .update(id, certificate);
    if (res.isSuccess) return true;
    res.showError();
    return false;
  }

  Future<void> addIP(String ip) async {
    final data = state.value;
    if (data == null) return;
    final newCert = data.certificate.copyWith(
      ipWhitelist: [...data.certificate.ipWhitelist, ip],
    );
    if (!await _saveCertificate(newCert)) return;
    if (!ref.mounted) return;
    state = AsyncData(data.copyWith(certificate: newCert));
  }

  Future<void> deleteIP(String ip) async {
    final data = state.value;
    if (data == null) return;
    final newCert = data.certificate.copyWith(
      ipWhitelist: data.certificate.ipWhitelist.where((e) => e != ip).toList(),
    );
    if (!await _saveCertificate(newCert)) return;
    if (!ref.mounted) return;
    state = AsyncData(data.copyWith(certificate: newCert));
  }

  Future<void> updateIP(String oldIP, String newIP) async {
    final data = state.value;
    if (data == null) return;
    final list = List<String>.from(data.certificate.ipWhitelist);
    final index = list.indexOf(oldIP);
    if (index < 0) return;
    list[index] = newIP;
    final newCert = data.certificate.copyWith(ipWhitelist: list);
    if (!await _saveCertificate(newCert)) return;
    if (!ref.mounted) return;
    state = AsyncData(data.copyWith(certificate: newCert));
  }

  void copyApiKey() {
    final key = state.value?.certificate.apiKey;
    if (key == null || key.isEmpty) return;
    ClipboardHelper.copy(key);
  }
}
