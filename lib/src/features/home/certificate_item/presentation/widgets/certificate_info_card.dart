import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/extensions/ext_datetime.dart';
import 'package:saas_ui/src/core/network/models/certificate_item.dart';
import 'package:saas_ui/src/core/services/pdf_service_provider.dart';
import 'package:saas_ui/src/core/services/pdf_viewer_launcher.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/routers/app_routers.dart';
import 'package:saas_ui/src/shared/widgets/app_expansion_tile.dart';

class CertificateInfoCard extends ConsumerWidget {
  const CertificateInfoCard({super.key, required this.certificateItem});

  final CertificateItem certificateItem;

  Color _titleColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.grey.shade500
      : Colors.grey.shade600;

  Color _textColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? Colors.grey.shade300
      : Colors.grey.shade900;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppExpansionTile(
      title: _buildHeader(context),
      childrenPadding: const EdgeInsets.all(20),
      children: [
        _buildMainSegments(context),
        if (certificateItem.invoices.isNotEmpty ||
            certificateItem.status == CertificateItemStatus.created ||
            certificateItem.status == CertificateItemStatus.pending) ...[
          const SizedBox(height: 16),
          _buildInvoicesAndPay(context, ref),
        ],
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final expiresInfo = _formatDuration(certificateItem.expiresAt);
    final isExpired =
        certificateItem.status == CertificateItemStatus.exhausted ||
        (certificateItem.expiresAt?.isBefore(DateTime.now()) ?? false);

    final showProgress =
        (certificateItem.status == CertificateItemStatus.active ||
            certificateItem.status == CertificateItemStatus.exhausted) &&
        certificateItem.tokensRemaining > 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Expanded(
              child: Text(
                certificateItem.productOfferName,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _statusBadge(certificateItem.status),
          ],
        ),
        if (showProgress) _buildTokenProgressHeader(context),
        Row(
          spacing: 4,
          children: [
            Icon(
              Icons.access_time_rounded,
              size: 14,
              color: isExpired ? Colors.red : Colors.green,
            ),
            Text(
              isExpired ? 'Срок истек' : 'До конца: $expiresInfo',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isExpired ? Colors.red : Colors.green,
              ),
            ),
            const Spacer(),
            Text(
              '${certificateItem.tokensRemaining} токенов',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: certificateItem.tokensRemaining > 0
                    ? Theme.of(context).colorScheme.primary
                    : Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTokenProgressHeader(BuildContext context) {
    final total = certificateItem.tokensTotal;
    final remaining = certificateItem.tokensRemaining;
    final used = certificateItem.tokensUsed;

    double progress = 0.0;
    if (total > 0) {
      if (remaining <= 0) {
        progress = 1.0;
      } else {
        progress = (used / total).clamp(0.0, 1.0);
      }
    }

    final isExhausted = remaining <= 0;
    final isLow = !isExhausted && total > 0 && (remaining <= total * 0.2);

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 6,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(30),
        valueColor: AlwaysStoppedAnimation<Color>(
          isExhausted
              ? Colors.red
              : isLow
              ? Colors.orange
              : Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _statusBadge(CertificateItemStatus status) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      color: status.color.withAlpha(30),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: status.color.withAlpha(100), width: 0.5),
    ),
    child: Text(
      status.toString().toUpperCase(),
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: status.color,
      ),
    ),
  );

  Widget _buildMainSegments(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withAlpha(5)
                : Colors.grey.withAlpha(10),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? Colors.white.withAlpha(10)
                  : Colors.black.withAlpha(10),
            ),
          ),
          child: Column(
            spacing: 6,
            children: [
              _infoRowWithIcon(
                context,
                Icons.fingerprint_rounded,
                "ID транзакции",
                '#${certificateItem.id}',
              ),
              _infoRowWithIcon(
                context,
                Icons.calendar_month_rounded,
                "Дата создания",
                certificateItem.createdAt?.formatDDMMYYYY ?? '-',
              ),
              _infoRowWithIcon(
                context,
                Icons.account_balance_wallet_rounded,
                "Стоимость",
                '${certificateItem.amount} ${certificateItem.currency}',
              ),
              if (certificateItem.activatedAt != null)
                _infoRowWithIcon(
                  context,
                  Icons.verified_rounded,
                  "Активирован",
                  certificateItem.activatedAt!.formatDDMMYYYY,
                ),
              if (certificateItem.expiresAt != null) ...[
                () {
                  final isExpired = certificateItem.expiresAt!.isBefore(
                    DateTime.now(),
                  );
                  return _infoRowWithIcon(
                    context,
                    Icons.timer_off_rounded,
                    isExpired ? "Истек" : "Истекает",
                    certificateItem.expiresAt!.formatDDMMYYYY,
                    color: isExpired ? Colors.red : null,
                  );
                }(),
              ],
            ],
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: _statBox(
                context,
                "Всего",
                certificateItem.tokensTotal.toString(),
                Icons.toll_rounded,
              ),
            ),
            Expanded(
              child: _statBox(
                context,
                "Использовано",
                certificateItem.tokensUsed.toString(),
                Icons.history_toggle_off_rounded,
              ),
            ),
            () {
              final total = certificateItem.tokensTotal;
              final remaining = certificateItem.tokensRemaining;
              final status = certificateItem.status;

              final isWaitingPayment =
                  status == CertificateItemStatus.created ||
                  status == CertificateItemStatus.pending;

              final isError = !isWaitingPayment && remaining == 0;
              final isWarning =
                  !isWaitingPayment &&
                  !isError &&
                  total > 0 &&
                  (remaining <= total * 0.2);

              return Expanded(
                child: _statBox(
                  context,
                  "Доступно",
                  remaining.toString(),
                  Icons.stars_rounded,
                  isPrimary: !isWaitingPayment && !isError && !isWarning,
                  isWarning: isWarning,
                  isError: isError,
                ),
              );
            }(),
          ],
        ),
      ],
    );
  }

  Widget _statBox(
    BuildContext context,
    String label,
    String value,
    IconData icon, {
    bool isPrimary = false,
    bool isWarning = false,
    bool isError = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final errorColor = Theme.of(context).colorScheme.error;
    const warningColor = Colors.orange;

    final Color accentColor = isError
        ? errorColor
        : isWarning
        ? warningColor
        : primaryColor;
    final bool hasAccent = isPrimary || isWarning || isError;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: hasAccent
            ? accentColor.withAlpha(isDark ? 40 : 20)
            : (isDark ? Colors.white.withAlpha(5) : Colors.white),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasAccent
              ? accentColor.withAlpha(100)
              : (isDark ? Colors.white.withAlpha(10) : Colors.grey.shade200),
        ),
      ),
      child: Column(
        spacing: 6,
        children: [
          Icon(
            icon,
            size: 18,
            color: hasAccent
                ? accentColor
                : _titleColor(context).withAlpha(150),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: hasAccent ? accentColor : _textColor(context),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isError
                  ? errorColor
                  : isWarning
                  ? warningColor
                  : _titleColor(context),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _infoRowWithIcon(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            icon,
            size: 16,
            color: color ?? _titleColor(context).withAlpha(150),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: color ?? _titleColor(context),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: color ?? _textColor(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoicesAndPay(BuildContext context, WidgetRef ref) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    spacing: 10,
    children: [
      if (certificateItem.invoices.isNotEmpty) ...[
        Row(
          spacing: 8,
          children: [
            const Icon(
              Icons.receipt_long_rounded,
              size: 16,
              color: Colors.grey,
            ),
            Text(
              "Финансовые документы",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _titleColor(context),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: certificateItem.invoices.map((invoice) {
            final fileName = 'Счет_${invoice.invoiceNumber}.pdf';
            return InkWell(
              onTap: () =>
                  _onInvoiceButtonPressed(context, ref, invoice.id!, fileName),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6,
                  children: [
                    const Icon(
                      Icons.picture_as_pdf_rounded,
                      size: 14,
                      color: Colors.red,
                    ),
                    Text(
                      fileName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
      if (certificateItem.status == CertificateItemStatus.created ||
          certificateItem.status == CertificateItemStatus.pending)
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  AppColors.secondary.shade400,
                  AppColors.secondary.shade600,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withAlpha(100),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => _onPayButtonPressed(context, certificateItem),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Icon(Icons.payment_rounded, size: 20),
                  Text(
                    'Перейти к оплате',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded, size: 16),
                ],
              ),
            ),
          ),
        ),
    ],
  );

  String _formatDuration(DateTime? date) {
    if (date == null) return '-';
    final now = DateTime.now();
    final difference = date.difference(now);
    if (difference.isNegative) return 'Истек';

    final days = difference.inDays;
    if (days > 365) return '${(days / 365).floor()} г.';
    if (days > 30) return '${(days / 30).floor()} мес.';
    if (days > 0) return '$days дн.';
    if (difference.inHours > 0) return '${difference.inHours} ч.';
    return 'Менее часа';
  }

  Future<void> _onPayButtonPressed(
    BuildContext context,
    CertificateItem certificateItem,
  ) async {
    AppRouters.goToBuy(
      context.go,
      offerId: certificateItem.productOfferId,
      certificateId: certificateItem.certificateId,
      certificateItemId: certificateItem.id,
    );
  }

  Future<void> _onInvoiceButtonPressed(
    BuildContext context,
    WidgetRef ref,
    int invoiceId,
    String fileName,
  ) async {
    await ref.read(pdfServiceProvider).showDialogPdf(invoiceId, fileName);
  }
}
