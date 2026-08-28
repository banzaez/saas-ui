import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/repository/invoices_repository.dart';
import 'package:saas_ui/src/core/services/pdf_service.dart';

part 'pdf_service_provider.g.dart';

@Riverpod(keepAlive: true)
PdfService pdfService(Ref ref) {
  return PdfService(ref.watch(invoicesRepositoryProvider));
}
