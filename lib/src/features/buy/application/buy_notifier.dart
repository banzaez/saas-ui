import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart'
    show routerProvider, MainRouters, HomeRouters;
import 'package:saas_ui/src/core/services/navigation_service.dart';
import 'package:saas_ui/src/core/services/payment_service.dart';
import 'package:saas_ui/src/core/services/pdf_service_provider.dart';
import 'package:saas_ui/src/core/services/pdf_viewer_launcher.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';
import 'package:saas_ui/src/core/util/app_snackbar.dart';
import 'package:saas_ui/src/features/buy/application/buy_route_args.dart';

part 'buy_notifier.g.dart';

class BuySession {
  const BuySession({
    required this.offer,
    required this.args,
    required this.selectedPayment,
    this.legalEntityId,
    this.isSubmitting = false,
  });

  final ProductOffer offer;
  final BuyArguments args;
  final PaymentOption selectedPayment;
  final int? legalEntityId;
  final bool isSubmitting;

  BuySession copyWith({
    ProductOffer? offer,
    BuyArguments? args,
    PaymentOption? selectedPayment,
    int? legalEntityId,
    bool clearLegalEntity = false,
    bool? isSubmitting,
  }) => BuySession(
    offer: offer ?? this.offer,
    args: args ?? this.args,
    selectedPayment: selectedPayment ?? this.selectedPayment,
    legalEntityId:
        clearLegalEntity ? null : (legalEntityId ?? this.legalEntityId),
    isSubmitting: isSubmitting ?? this.isSubmitting,
  );
}

@riverpod
class BuyFlow extends _$BuyFlow {
  @override
  FutureOr<BuySession?> build(BuyRouteArgs routeArgs) async {
    final idStr = routeArgs.offerId;
    if (idStr == null) {
      _scheduleHomeRedirect('No buy arguments found, redirection to home');
      return null;
    }
    final offerId = int.tryParse(idStr);
    if (offerId == null) {
      AppLogger.warning('Invalid offerId parameter: $idStr');
      _scheduleHomeRedirect(null);
      return null;
    }
    final args = BuyArguments(
      offerId: offerId,
      certificateId: int.tryParse(routeArgs.certificateId ?? ''),
      certificateItemId: int.tryParse(routeArgs.certificateItemId ?? ''),
    );

    final result = await ref
        .read(productOffersRepositoryProvider)
        .getById(args.offerId);
    if (!ref.mounted) return null;
    final offer = result.result;
    if (!result.isSuccess || offer == null) {
      AppLogger.error('Failed to load offer: ${result.errorString}');
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Не удалось загрузить данные предложения',
      );
      return null;
    }

    AppLogger.success('BuyFlow initialized successfully');
    return BuySession(
      offer: offer,
      args: args,
      selectedPayment: PaymentOption.bankTransfer,
    );
  }

  void _scheduleHomeRedirect(String? logMessage) {
    if (logMessage != null) {
      AppLogger.warning(logMessage);
    }
    scheduleMicrotask(
      () => ref.read(routerProvider).go(MainRouters.home.route),
    );
  }

  BuySession? _sessionOrNull() => switch (state) {
    AsyncData(:final value) => value,
    _ => null,
  };

  void setPaymentOption(PaymentOption option) {
    final v = _sessionOrNull();
    if (v == null) return;
    state = AsyncData(v.copyWith(selectedPayment: option));
  }

  void setLegalEntityId(int? id) {
    final v = _sessionOrNull();
    if (v == null) return;
    state = AsyncData(
      v.copyWith(legalEntityId: id, clearLegalEntity: id == null),
    );
  }

  Future<Payment?> fullPaymentProcess() async {
    final session = _sessionOrNull();
    if (session == null || session.isSubmitting) return null;

    if (session.selectedPayment.isBankTransfer &&
        session.legalEntityId == null) {
      AppSnackbar.showError(
        title: 'Внимание',
        message: 'Для оплаты по счету необходимо выбрать юридическое лицо',
      );
      return null;
    }

    state = AsyncData(session.copyWith(isSubmitting: true));
    try {
      final payment = await _createPayment(session);
      if (payment != null) {
        AppLogger.success('Платеж успешно создан: ${payment.id}');
        await _handlePaymentResult(payment, session.selectedPayment);
      }
      return payment;
    } catch (e, stack) {
      AppLogger.error('Ошибка процесса оплаты', error: e, stackTrace: stack);
      AppSnackbar.showError(
        title: 'Ошибка',
        message: 'Не удалось произвести оплату. Попробуйте снова.',
      );
      return null;
    } finally {
      final s = _sessionOrNull();
      if (s != null) {
        state = AsyncData(s.copyWith(isSubmitting: false));
      }
    }
  }

  Future<void> _handlePaymentResult(
    Payment payment,
    PaymentOption option,
  ) async {
    final paymentService = ref.read(paymentServiceProvider);
    final result = paymentService.resolvePaymentResult(
      payment: payment,
      option: option,
    );

    switch (result) {
      case PaymentResultInvoice(:final invoice):
        ref.read(routerProvider).go(HomeRouters.payments.fullroute);
        ref
            .read(pdfServiceProvider)
            .showDialogPdf(invoice.id, 'invoice_${invoice.invoiceNumber}.pdf');
      case PaymentResultQrCode(:final paymentId):
        ref.read(routerProvider).push('${MainRouters.qrCode.route}/$paymentId');
      case PaymentResultExternalUrl(:final url):
        ref.read(navigationServiceProvider).launchExternalUrl(url);
        ref.read(routerProvider).go(HomeRouters.payments.fullroute);
      case PaymentResultUnknown():
        AppSnackbar.showError(
          title: 'Ошибка',
          message: 'Не удалось вывести данные для оплаты',
        );
    }
  }

  Future<Payment?> _createPayment(BuySession session) {
    final args = session.args;
    if (args.certificateItemId != null) {
      return ref
          .read(paymentServiceProvider)
          .createPayment(
            certificateItemId: args.certificateItemId!,
            option: session.selectedPayment,
            legalEntityId: session.legalEntityId,
          );
    }

    return ref
        .read(paymentServiceProvider)
        .buyAndCreatePayment(
          offerId: args.offerId,
          option: session.selectedPayment,
          legalEntityId: session.legalEntityId,
          certificateId: args.certificateId,
        );
  }
}
