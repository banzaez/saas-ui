import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/services/payment_service.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/features/buy/application/buy_notifier.dart';
import 'package:saas_ui/src/features/buy/application/buy_route_args.dart';
import 'package:saas_ui/src/features/home/tarifs/presentation/widgets/package_card.dart';
import 'package:saas_ui/src/shared/widgets/app_progress_indicator.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/legal_entity_reference_field.dart';

class BuyScreen extends ConsumerStatefulWidget {
  const BuyScreen({
    super.key,
    this.offerId,
    this.certificateId,
    this.certificateItemId,
  });

  final String? offerId;
  final String? certificateId;
  final String? certificateItemId;

  @override
  ConsumerState<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends ConsumerState<BuyScreen> {
  final _formKeyCash = GlobalKey<FormState>();

  BuyRouteArgs get _args => BuyRouteArgs(
    offerId: widget.offerId,
    certificateId: widget.certificateId,
    certificateItemId: widget.certificateItemId,
  );

  @override
  Widget build(BuildContext context) {
    final asyncSession = ref.watch(buyFlowProvider(_args));

    return Scaffold(
      backgroundColor: AppColors.backgroundScreen,
      body: Stack(
        children: [
          _buildBackgroundDecoration(),
          asyncSession.when(
            data: (session) {
              if (session == null) {
                return const Center(child: AppProgressIndicator());
              }
              return _buildBody(context, session);
            },
            loading: () => const Center(child: AppProgressIndicator()),
            error: (_, _) => const Center(child: AppProgressIndicator()),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundDecoration() {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            top: -150,
            right: -100,
            child: _buildBlurBlob(
              width: 600,
              height: 600,
              color: AppColors.primary.withAlpha(40),
            ),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: _buildBlurBlob(
              width: 500,
              height: 500,
              color: AppColors.secondary.withAlpha(30),
            ),
          ),
          Positioned(
            top: -50,
            left: -50,
            child: _buildBlurBlob(
              width: 300,
              height: 300,
              color: const Color(0xFF06B6D4).withAlpha(15),
            ),
          ),
          Positioned(
            top: 300,
            right: -50,
            child: _buildBlurBlob(
              width: 400,
              height: 400,
              color: const Color(0xFF6366F1).withAlpha(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurBlob({
    required double width,
    required double height,
    required Color color,
  }) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );

  Widget _buildBody(BuildContext context, BuySession session) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(240),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(15),
                  blurRadius: 40,
                  offset: const Offset(0, 10),
                ),
              ],
              border: Border.all(color: Colors.white.withAlpha(150)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                spacing: 32,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildOrderSummary(session),
                  _buildPaymentSection(context, session),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuySession session) => Column(
    spacing: 24,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Ваш заказ',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textBold,
        ),
      ),
      PackageCard(package: session.offer, isPreview: true),
      _buildPriceBreakdown(session),
    ],
  );

  Widget _buildPriceBreakdown(BuySession session) {
    final offer = session.offer;
    final hasDiscount = offer.hasDiscount && offer.originalPrice > 0;

    final isTokenBased = offer.type == PackageType.tokenBased;

    final tokensCount = offer.totalTokens > 0
        ? offer.totalTokens
        : offer.tokensPerPeriod;

    String totalLabel = 'Итого к оплате';
    if (isTokenBased) {
      if (tokensCount > 0) {
        totalLabel += ' за ${tokensCount.formatSum} ${offer.pluralTokens}';
      }
    } else if (offer.periodType != null && offer.totalPeriodValue > 0) {
      final periodUnit = offer.periodType!.plural(offer.totalPeriodValue);
      totalLabel += ' за ${offer.totalPeriodValue} $periodUnit';
    }

    final periodName = isTokenBased
        ? (tokensCount > 0
              ? '${tokensCount.formatSum} ${offer.pluralTokens}'
              : 'токены')
        : (offer.periodType?.text().toLowerCase() ?? 'период');

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withAlpha(20)),
      ),
      child: Column(
        spacing: 12,
        children: [
          _buildPriceRow(
            'Стоимость за $periodName',
            '${offer.originalPrice.formatSum} ₽',
          ),
          if (hasDiscount)
            _buildPriceRow(
              'Скидка (${offer.discount.formatSum}%)',
              '- ${(offer.originalPrice - offer.discountedPrice).formatSum} ₽',
              color: Colors.green.shade600,
            ),
          if (hasDiscount && !isTokenBased && offer.totalPeriodValue > 1)
            _buildPriceRow(
              'Цена со скидкой за $periodName',
              '${offer.discountedPrice.formatSum} ₽',
            ),
          _buildPriceRow(
            totalLabel,
            '${offer.totalSum.formatSum} ₽',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    Color? color,
    bool isTotal = false,
  }) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: isTotal
            ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
            : TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
              ),
      ),
      Text(
        value,
        style: isTotal
            ? const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              )
            : TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color ?? AppColors.textColor,
              ),
      ),
    ],
  );

  Widget _buildPaymentSection(BuildContext context, BuySession session) =>
      Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Способ оплаты',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textBold,
            ),
          ),
          _buildPayTypeGrid(session),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.05),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: Padding(
              key: ValueKey(session.selectedPayment),
              padding: const EdgeInsets.only(top: 8),
              child: _buildSelectedPaymentFields(context, session),
            ),
          ),
        ],
      );

  Widget _buildPayTypeGrid(BuySession session) => LayoutBuilder(
    builder: (context, constraints) => GridView.count(
      crossAxisCount: constraints.maxWidth > 300 ? 3 : 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.9,
      children: PaymentOption.values
          .map(
            (option) => _PayTypeCard(
              selected: session.selectedPayment == option,
              customIcon: _CustomPaymentIcon(
                iconPath: option.iconPath,
                isSelected: session.selectedPayment == option,
              ),
              label: option.label,
              description: option.description,
              onTap: () => ref
                  .read(buyFlowProvider(_args).notifier)
                  .setPaymentOption(option),
            ),
          )
          .toList(),
    ),
  );

  Widget _buildSelectedPaymentFields(BuildContext context, BuySession session) {
    return session.selectedPayment.isBankTransfer
        ? _buildBankFields(session)
        : _buildCardFields(session);
  }

  Widget _buildCardFields(BuySession session) => Column(
    spacing: 24,
    children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withAlpha(30)),
        ),
        child: const Row(
          spacing: 12,
          children: [
            Icon(Icons.lock_outline, color: AppColors.primary),
            Expanded(
              child: Text(
                "Оплата будет произведена на защищенной странице банка",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
      _buildActionButton(
        session: session,
        title: 'Оплатить безопасно',
        icon: Icons.shield_outlined,
      ),
    ],
  );

  Widget _buildBankFields(BuySession session) => Column(
    spacing: 24,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Form(
        key: _formKeyCash,
        child: LegalEntityReferenceField(
          onChanged: (value) => ref
              .read(buyFlowProvider(_args).notifier)
              .setLegalEntityId(value?.id),
          decoration: InputDecoration(
            labelText: 'Выберите юридическое лицо',
            prefixIcon: const Icon(Icons.business_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          validator: _legalEntityValidator,
        ),
      ),
      _buildActionButton(
        session: session,
        title: 'Сформировать счет',
        icon: Icons.receipt_long_outlined,
      ),
    ],
  );

  Widget _buildActionButton({
    required BuySession session,
    required String title,
    required IconData icon,
  }) => session.isSubmitting
      ? const Center(child: AppProgressIndicator())
      : Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primary.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(80),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
            border: Border.all(color: Colors.white.withAlpha(50)),
          ),
          child: ElevatedButton.icon(
            onPressed: () => _createPayment(session),
            icon: Icon(icon, color: Colors.white),
            label: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );

  bool _validateForm(BuySession session) {
    if (session.selectedPayment.isBankTransfer) {
      return _formKeyCash.currentState?.validate() ?? false;
    }
    return true;
  }

  Future<void> _createPayment(BuySession session) async {
    if (!_validateForm(session)) return;
    await ref.read(buyFlowProvider(_args).notifier).fullPaymentProcess();
  }

  String? _legalEntityValidator(LegalEntity? value) {
    if (value == null) {
      return 'Выберите юридическое лицо';
    }
    return null;
  }
}

class _PayTypeCard extends StatelessWidget {
  final bool selected;
  final Widget customIcon;
  final String label;
  final String description;
  final VoidCallback onTap;

  const _PayTypeCard({
    required this.selected,
    required this.customIcon,
    required this.label,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: selected ? AppColors.primary.withAlpha(15) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? AppColors.primary : Colors.grey.withAlpha(50),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              spacing: 2,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                customIcon,
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: selected ? AppColors.primary : AppColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey.withAlpha(180),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          if (selected)
            const Positioned(
              top: 12,
              right: 12,
              child: Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 20,
              ),
            ),
        ],
      ),
    ),
  );
}

class _CustomPaymentIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const _CustomPaymentIcon({required this.iconPath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withAlpha(20)
            : Colors.grey.withAlpha(20),
        shape: BoxShape.circle,
      ),
      child: Center(child: _buildIconContent()),
    );
  }

  Widget _buildIconContent() {
    final color = isSelected ? AppColors.primary : Colors.grey.shade600;

    return SvgPicture.asset(
      iconPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
