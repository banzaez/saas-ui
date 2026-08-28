import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/response/product_offer_buy_response.dart';
import 'package:saas_ui/src/core/network/repository/payments_repository.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';

part 'payment_service.g.dart';

enum PaymentOption {
  bankTransfer(
    label: 'По счету',
    description: 'Для юр. лиц',
    provider: null,
    method: PaymentMethod.bankTransfer,
    iconPath: 'assets/buy/bank.svg',
  ),
  modulbankQrCode(
    label: 'СБП / QR',
    description: 'Мгновенно',
    provider: PaymentProvider.modulbank,
    method: PaymentMethod.qrCode,
    iconPath: 'assets/buy/qr.svg',
  ),
  modulbank(
    label: 'Картой',
    description: 'Online',
    provider: PaymentProvider.modulbank,
    method: null,
    iconPath: 'assets/buy/card.svg',
  );

  final String label;
  final String description;
  final PaymentProvider? provider;
  final PaymentMethod? method;
  final String iconPath;

  const PaymentOption({
    required this.label,
    required this.description,
    this.provider,
    this.method,
    required this.iconPath,
  });

  bool get isBankTransfer => this == PaymentOption.bankTransfer;
}

sealed class PaymentResult {
  const PaymentResult();
}

class PaymentResultInvoice extends PaymentResult {
  final InvoiceData invoice;
  const PaymentResultInvoice(this.invoice);
}

class PaymentResultQrCode extends PaymentResult {
  final int paymentId;
  const PaymentResultQrCode(this.paymentId);
}

class PaymentResultExternalUrl extends PaymentResult {
  final String url;
  const PaymentResultExternalUrl(this.url);
}

class PaymentResultUnknown extends PaymentResult {
  const PaymentResultUnknown();
}

class PaymentService {
  PaymentService(this._productOffersRepository, this._paymentsRepository);

  final ProductOffersRepository _productOffersRepository;
  final PaymentsRepository _paymentsRepository;

  Future<ProductOfferBuyResponse?> buyPackage({
    required int offerId,
    int? certificateId,
  }) async {
    final response = await _productOffersRepository.createProductOfferBuy(
      offerId: offerId,
      certificateId: certificateId,
    );

    if (!response.isSuccess) {
      AppLogger.error('Ошибка покупки пакета: ${response.errorString}');
      AppSnackbar.showError(
        title: 'Ошибка покупки пакета',
        message: response.errorString,
      );
      return null;
    }

    return response.result;
  }

  Future<Payment?> createPayment({
    required int certificateItemId,
    required PaymentOption option,
    int? legalEntityId,
  }) async {
    final response = await _paymentsRepository.createPayment(
      certificateItemId: certificateItemId,
      paymentProvider: option.provider,
      paymentMethod: option.method,
      legalEntityId: legalEntityId,
    );

    if (!response.isSuccess) {
      AppLogger.error('Ошибка создания платежа: ${response.errorString}');
      AppSnackbar.showError(
        title: 'Ошибка создания платежа',
        message: response.errorString,
      );
      return null;
    }

    return response.result;
  }

  Future<Payment?> buyAndCreatePayment({
    required int offerId,
    required PaymentOption option,
    int? legalEntityId,
    int? certificateId,
  }) async {
    final buyResult = await buyPackage(
      offerId: offerId,
      certificateId: certificateId,
    );

    if (buyResult == null) return null;

    return createPayment(
      option: option,
      certificateItemId: buyResult.certificateItemId,
      legalEntityId: legalEntityId,
    );
  }

  PaymentResult resolvePaymentResult({
    required Payment payment,
    required PaymentOption option,
  }) {
    if (payment.invoice != null) {
      return PaymentResultInvoice(payment.invoice!);
    }

    if (option.method == PaymentMethod.qrCode) {
      final id = payment.id;
      if (id == null) return const PaymentResultUnknown();
      return PaymentResultQrCode(id);
    }

    if (option.provider == PaymentProvider.modulbank &&
        payment.paymentLink != null) {
      return PaymentResultExternalUrl(payment.paymentLink!);
    }

    if (payment.paymentLink != null) {
      final id = payment.id;
      if (id == null) return const PaymentResultUnknown();
      return PaymentResultQrCode(id);
    }

    AppLogger.warning(
      'Не удалось определить результат для платежа ${payment.id}',
    );
    return const PaymentResultUnknown();
  }
}

@Riverpod(keepAlive: true)
PaymentService paymentService(Ref ref) {
  return PaymentService(
    ref.watch(productOffersRepositoryProvider),
    ref.watch(paymentsRepositoryProvider),
  );
}
