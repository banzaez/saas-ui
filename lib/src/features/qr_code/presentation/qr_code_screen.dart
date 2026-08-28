import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/qr_code/application/qr_code_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/app_progress_indicator.dart';

class QrCodeScreen extends ConsumerWidget {
  const QrCodeScreen({super.key, required this.paymentId});

  final int paymentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ui = ref.watch(qrCodeFlowProvider(paymentId));
    final notifier = ref.read(qrCodeFlowProvider(paymentId).notifier);

    final Widget centerChild;
    if (!ui.initialized || ui.payment == null) {
      centerChild = const AppProgressIndicator();
    } else {
      centerChild = _QrCodeContent(
        payment: ui.payment!,
        ui: ui,
        onOpenLink: notifier.openPaymentLink,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(child: centerChild),
          Positioned(
            bottom: 64,
            left: 0,
            right: 0,
            child: _buildBackButton(context),
          ),
        ],
      ),
    );
  }

  static Widget _buildBackButton(BuildContext context) => CircleAvatar(
    backgroundColor: AppColors.primary,
    radius: 32,
    child: IconButton(
      onPressed: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(MainRouters.home.route);
        }
      },
      icon: const Icon(Icons.arrow_back),
      iconSize: 24,
    ),
  );
}

class _QrCodeContent extends StatelessWidget {
  const _QrCodeContent({
    required this.payment,
    required this.ui,
    required this.onOpenLink,
  });

  final Payment payment;
  final QrCodeUiState ui;
  final VoidCallback onOpenLink;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      AppContainer(
        child: payment.qrCodeImage != null
            ? Image.memory(payment.qrCodeImage!, height: 364, width: 364)
            : const SizedBox(
                height: 364,
                width: 364,
                child: Center(
                  child: Icon(Icons.qr_code_2, size: 128, color: Colors.grey),
                ),
              ),
      ),
      const SizedBox(height: 32),
      _buildQrCodeTitle(),
      const SizedBox(height: 64),
      ui.isPaid
          ? _statusWidget(isPaid: true)
          : _HeartbeatIcon(child: _statusWidget(isPaid: false)),
    ],
  );

  Widget _statusWidget({required bool isPaid}) => Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 8,
    children: [
      isPaid
          ? const Icon(Icons.check_circle, color: Colors.green, size: 48)
          : const CircularProgressIndicator(color: Colors.orange, strokeWidth: 4),
      Text(
        isPaid ? 'Оплачено' : 'Ожидает оплаты',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: isPaid ? Colors.green : Colors.orange,
        ),
      ),
    ],
  );

  Widget _buildQrCodeTitle() => Column(
    spacing: 12,
    children: [
      Text(
        payment.paymentLink != null
            ? 'Отсканируйте QR-код или перейдите по ссылке'
            : 'Сканируйте QR-код для оплаты',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      Text(
        'Действует: ${ui.qrLifeTimeDisplay}',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey[600],
        ),
      ),
      if (payment.paymentLink != null) ...[
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: onOpenLink,
          icon: const Icon(Icons.open_in_new, size: 18),
          label: const Text(
            'Открыть ссылку на оплату',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    ],
  );
}

class _HeartbeatIcon extends StatefulWidget {
  final Widget child;

  const _HeartbeatIcon({required this.child});

  @override
  State<_HeartbeatIcon> createState() => _HeartbeatIconState();
}

class _HeartbeatIconState extends State<_HeartbeatIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  )..repeat(reverse: true);

  late final Animation<double> _scale = Tween<double>(
    begin: 1.0,
    end: 1.2,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      ScaleTransition(scale: _scale, child: widget.child);
}
