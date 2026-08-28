import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/requests/create_payment_request.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/response/payment_qr_status_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/certificate_items";

mixin PaymentsApiMixin {
  @GET("$_path/payment/{payment_id}")
  Future<ServerResponse<Payment>> getPaymentById(
    @Path("payment_id") int paymentId,
  );

  @GET("$_path/payment/list")
  Future<ServerResponse<List<Payment>>> getPaymentList(
    @Query("from_date") DateTime? fromDate,
    @Query("to_date") DateTime? toDate,
    @Query("company_id") int? companyId,
    @Query("methods") List<PaymentMethod>? methods,
    @Query("statuses") List<PaymentStatus>? statuses,
    @Query("offset") int? offset,
    @Query("limit") int? limit,
  );

  @GET("$_path/payment/{payment_id}/status")
  Future<ServerResponse<PaymentQrStatusResponse>> getPaymentStatus(
    @Path("payment_id") int paymentId,
  );

  @POST("$_path/payment/{payment_id}/complete")
  Future<ServerResponse<void>> completePayment(
    @Path("payment_id") int paymentId,
  );

  @GET("$_path/{id}/payment/list")
  Future<ServerResponse<List<Payment>>> getItemPayments(
    @Path("id") int certificateItemId,
  );

  @POST("$_path/{id}/payment/create")
  Future<ServerResponse<Payment>> createPayment(
    @Path("id") int certificateItemId,
    @Body() CreatePaymentRequest request,
  );
}
