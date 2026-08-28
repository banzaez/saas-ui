import 'dart:typed_data';

import 'package:dio/dio.dart' show ResponseType;
import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/response/email_response.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';

const String _path = "/invoices";

mixin InvoicesApiMixin {
  @POST("$_path/")
  Future<ServerResponse<Invoice>> createInvoice(@Body() Invoice payment);

  @GET("$_path/")
  Future<ServerResponse<List<Invoice>>> listInvoices();

  @GET("$_path/{id}")
  Future<ServerResponse<Invoice>> getInvoice(@Path("id") int id);

  @PUT("$_path/{id}")
  Future<ServerResponse<Invoice>> updateInvoice(
    @Path("id") int id,
    @Body() Invoice payment,
  );

  @DELETE("$_path/{id}")
  Future<ServerResponse<ItemDeleteResponse>> deleteInvoice(@Path("id") int id);

  // PAYMENT METHODS

  @GET("$_path/period")
  Future<ServerResponse<List<Invoice>>> getInvoicesPeriod(
    @Query("date_from") DateTime startDate,
    @Query("date_to") DateTime endDate,
  );

  // PDF METHODS ==>

  @GET("$_path/{invoice_id}/pdf")
  @Headers({'Accept': 'application/pdf'})
  @DioResponseType(ResponseType.bytes)
  Future<Uint8List> getInvoicePdf(@Path("invoice_id") int id);

  @POST("$_path/{invoice_id}/send_email")
  Future<ServerResponse<EmailResponse>> sendInvoiceEmail(
    @Path("invoice_id") int id,
  );

  // <==
}
