import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:saas_ui/src/core/network/models/requests/attach_partner_request.dart';
import 'package:saas_ui/src/core/network/models/requests/create_payment_request.dart';
import 'package:saas_ui/src/core/network/models/app_file.dart';
import 'package:saas_ui/src/core/network/models/requests/reset_password_request.dart';
import 'package:saas_ui/src/core/network/models/response/app_file_upload_response.dart';
import 'package:saas_ui/src/core/network/models/certificate.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/response/email_response.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/response/payment_qr_status_response.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/models/log.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/models/response/product_offer_buy_response.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/models/statistic.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';
import 'package:saas_ui/src/core/network/models/response/total_sum_response.dart';
import 'package:saas_ui/src/core/network/models/user.dart';
import 'package:saas_ui/src/core/network/endpoints/app_files_api.dart';
import 'package:saas_ui/src/core/network/endpoints/legal_entities_api.dart';
import 'package:saas_ui/src/core/network/endpoints/logs_api.dart';
import 'package:saas_ui/src/core/network/endpoints/payments_api.dart';
import 'package:saas_ui/src/core/network/endpoints/pin_codes_api.dart';
import 'package:saas_ui/src/core/network/endpoints/statistics_api.dart';
import 'package:saas_ui/src/core/network/endpoints/token_transactions_api.dart';
import 'package:saas_ui/src/core/network/endpoints/users_api.dart';
import 'package:saas_ui/src/core/network/models/response/item_delete_response.dart';
import 'package:saas_ui/src/core/network/models/requests/login_request.dart';
import 'package:saas_ui/src/core/network/models/requests/product_offer_buy_request.dart';
import 'package:saas_ui/src/core/network/models/response/user_token.dart';
import 'package:saas_ui/src/core/network/models/requests/register_request.dart';
import 'package:saas_ui/src/core/network/models/response/server_response.dart';
import 'package:saas_ui/src/core/network/endpoints/auth_api.dart';
import 'package:saas_ui/src/core/network/endpoints/companies_api.dart';
import 'package:saas_ui/src/core/network/endpoints/products_api.dart';
import 'package:saas_ui/src/core/network/endpoints/product_offers_api.dart';
import 'package:saas_ui/src/core/network/endpoints/certificates_api.dart';
import 'package:saas_ui/src/core/network/endpoints/invoices_api.dart';

part 'server_api.g.dart';

@RestApi()
abstract class ServerApi
    with
        AuthApiMixin,
        CompaniesApiMixin,
        LegalEntitiesApiMixin,
        PaymentsApiMixin,
        PinCodesApiMixin,
        ProductsApiMixin,
        ProductOffersApiMixin,
        CertificatesApiMixin,
        InvoicesApiMixin,
        UsersApiMixin,
        LogsApiMixin,
        TokenTransactionsApiMixin,
        StatisticsApiMixin,
        AppFilesApiMixin {
  factory ServerApi(Dio dio, {String baseUrl, ParseErrorLogger? errorLogger}) =
      _ServerApi;
}
