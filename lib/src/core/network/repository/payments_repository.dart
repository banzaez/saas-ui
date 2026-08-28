import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/core/network/models/requests/create_payment_request.dart';
import 'package:saas_ui/src/features/home/payments/application/settings/payment_settings.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/response/payment_qr_status_response.dart';

part 'payments_repository.g.dart';

@Riverpod(keepAlive: true)
PaymentsRepository paymentsRepository(Ref ref) =>
    PaymentsRepository(ref.watch(serverApiProvider));

class PaymentsRepository
    extends ReadOnlyRepository<Payment, int, PaymentSettings> {
  PaymentsRepository(super.api);
  @override
  Future<RequestResult<Payment>> getById(int id) =>
      sendRequest<Payment>(() => api.getPaymentById(id));

  @override
  Future<RequestResult<List<Payment>>> listAll([PaymentSettings? filter]) =>
      sendRequest<List<Payment>>(
        () => api.getPaymentList(
          filter?.filter.fromDate,
          filter?.filter.toDate,
          filter?.filter.companyId,
          filter?.filter.methods,
          filter?.filter.statuses,
          filter?.offset,
          filter?.limit,
        ),
      );

  Future<RequestResult<List<Payment>>> getItemPayments(int certificateItemId) =>
      sendRequest<List<Payment>>(() => api.getItemPayments(certificateItemId));

  Future<RequestResult<Payment>> createPayment({
    required int certificateItemId,
    int? legalEntityId,
    int? certificateId,
    PaymentProvider? paymentProvider,
    PaymentMethod? paymentMethod,
  }) => sendRequest<Payment>(
    () => api.createPayment(
      certificateItemId,
      CreatePaymentRequest(
        legalEntityId: legalEntityId,
        paymentProvider: paymentProvider,
        paymentMethod: paymentMethod,
      ),
    ),
  );

  Future<RequestResult<PaymentQrStatusResponse>> getPaymentStatus(
    int paymentId,
  ) => sendRequest<PaymentQrStatusResponse>(
    () => api.getPaymentStatus(paymentId),
  );

  Future<RequestResult<void>> completePayment(int paymentId) =>
      sendRequest<void>(() => api.completePayment(paymentId));
}
