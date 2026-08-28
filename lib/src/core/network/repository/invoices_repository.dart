import 'dart:typed_data';
import 'package:saas_ui/src/core/services/api_service.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/response/email_response.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/home/invoices/application/settings/invoice_settings.dart';

part 'invoices_repository.g.dart';

@Riverpod(keepAlive: true)
InvoicesRepository invoicesRepository(Ref ref) =>
    InvoicesRepository(ref.watch(serverApiProvider));

class InvoicesRepository extends CrudRepository<Invoice, int, InvoiceSettings> {
  InvoicesRepository(super.api);
  @override
  Future<RequestResult<Invoice>> create(Invoice invoice) =>
      sendRequest<Invoice>(() => api.createInvoice(invoice));

  @override
  Future<RequestResult<List<Invoice>>> listAll([InvoiceSettings? filter]) =>
      sendRequest<List<Invoice>>(() => api.listInvoices());

  @override
  Future<RequestResult<Invoice>> getById(int id) =>
      sendRequest<Invoice>(() => api.getInvoice(id));

  @override
  Future<RequestResult<Invoice>> update(int id, Invoice invoice) =>
      sendRequest<Invoice>(() => api.updateInvoice(id, invoice));

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteInvoice(id));

  Future<RequestResult<List<Invoice>>> getInvoicesPeriod(
    DateTime startDate,
    DateTime endDate,
  ) => sendRequest<List<Invoice>>(
    () => api.getInvoicesPeriod(startDate, endDate),
  );

  // PDF METHODS

  Future<RequestResult<Uint8List>> getPdf(int invoiceId) async {
    try {
      final result = await api.getInvoicePdf(invoiceId);
      return RequestResult<Uint8List>(result: result);
    } catch (e) {
      return RequestResult<Uint8List>(errorCode: 1, errorMessage: e.toString());
    }
  }

  Future<RequestResult<EmailResponse>> sendEmail(int invoiceId) =>
      sendRequest<EmailResponse>(() => api.sendInvoiceEmail(invoiceId));
}
