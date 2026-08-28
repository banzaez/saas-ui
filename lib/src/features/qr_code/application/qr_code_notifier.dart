import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/network/models/response/payment_qr_status_response.dart';
import 'package:saas_ui/src/core/network/repository/payments_repository.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart'
    show routerProvider, MainRouters, HomeRouters;
import 'package:saas_ui/src/core/services/navigation_service.dart';
import 'package:saas_ui/src/core/util/app_logger.dart';

part 'qr_code_notifier.g.dart';

class QrCodeUiState {
  const QrCodeUiState({
    this.initialized = false,
    this.payment,
    this.qrStatus,
    this.qrLifeTimeDisplay = '00:00',
  });

  final bool initialized;
  final Payment? payment;
  final PaymentQrStatusResponse? qrStatus;
  final String qrLifeTimeDisplay;

  bool get isPaid => qrStatus?.status == PaymentStatus.paid;

  QrCodeUiState copyWith({
    bool? initialized,
    Payment? payment,
    PaymentQrStatusResponse? qrStatus,
    String? qrLifeTimeDisplay,
  }) => QrCodeUiState(
    initialized: initialized ?? this.initialized,
    payment: payment ?? this.payment,
    qrStatus: qrStatus ?? this.qrStatus,
    qrLifeTimeDisplay: qrLifeTimeDisplay ?? this.qrLifeTimeDisplay,
  );
}

@riverpod
class QrCodeFlow extends _$QrCodeFlow {
  static const _qrTtlMinutes = 30;
  static const _pollEverySeconds = 5;

  Timer? _timer;
  int _tickCount = 0;
  bool _isPolling = false;
  DateTime? _qrLifeTimeEnd;

  @override
  QrCodeUiState build(int paymentId) {
    ref.onDispose(_cancelTimer);

    if (paymentId <= 0) {
      scheduleMicrotask(() {
        AppLogger.error('QrCodeFlow: paymentId is null or invalid');
        ref.read(routerProvider).go(MainRouters.home.route);
      });
      return const QrCodeUiState();
    }

    // Защита от повторного вызова build — второй таймер не создастся
    if (_timer == null) {
      _qrLifeTimeEnd = DateTime.now().add(
        const Duration(minutes: _qrTtlMinutes),
      );
      _tickCount = 0;
      _startTimer();
      scheduleMicrotask(() => _loadPayment(paymentId));
    }

    return const QrCodeUiState(qrLifeTimeDisplay: '00:00');
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateQrLifeTimeDisplay();
      if (++_tickCount % _pollEverySeconds == 0) {
        unawaited(_pollPaymentStatus());
      }
    });
  }

  void _updateQrLifeTimeDisplay() {
    final end = _qrLifeTimeEnd;
    if (end == null) {
      state = state.copyWith(qrLifeTimeDisplay: '00:00');
      return;
    }
    final difference = end.difference(DateTime.now());
    if (difference.isNegative) {
      state = state.copyWith(qrLifeTimeDisplay: '00:00');
      _cancelTimer();
      return;
    }
    final totalSeconds = difference.inSeconds;
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    state = state.copyWith(qrLifeTimeDisplay: '$minutes:$seconds');
  }

  Future<void> _loadPayment(int paymentId) async {
    final response = await ref
        .read(paymentsRepositoryProvider)
        .getById(paymentId);
    if (!ref.mounted) return;
    if (response.isSuccess) {
      state = state.copyWith(initialized: true, payment: response.result);
    } else {
      response.showError();
    }
  }

  Future<void> _pollPaymentStatus() async {
    if (_isPolling) return;
    final id = state.payment?.id;
    if (id == null) return;

    _isPolling = true;
    try {
      final response = await ref
          .read(paymentsRepositoryProvider)
          .getPaymentStatus(id);
      if (!ref.mounted) return;
      if (response.isSuccess) {
        state = state.copyWith(qrStatus: response.result);
        if (state.isPaid) {
          _cancelTimer();
          await Future<void>.delayed(const Duration(seconds: 2));
          if (!ref.mounted) return;
          ref.read(routerProvider).go(HomeRouters.certificates.fullroute);
        }
      } else {
        response.showError();
      }
    } finally {
      _isPolling = false;
    }
  }

  void openPaymentLink() {
    final link = state.payment?.paymentLink;
    if (link != null) {
      ref.read(navigationServiceProvider).launchExternalUrl(link);
      ref.read(routerProvider).go(HomeRouters.payments.fullroute);
    }
  }
}
