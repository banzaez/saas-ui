import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/core/styles/app_widget_styles.dart';

class PackageCard extends StatefulWidget {
  final ProductOffer package;
  final VoidCallback? onTap;
  final bool isRecommended;
  final bool isPreview;
  final bool isMini;

  const PackageCard({
    super.key,
    required this.package,
    this.onTap,
    this.isRecommended = false,
    this.isPreview = false,
    this.isMini = false,
  });

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool _isHovered = false;

  static const _borderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) => Transform.scale(
          scale: value,
          child: Opacity(opacity: value, child: child),
        ),
        child: AnimatedScale(
          scale: _isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(_borderRadius),
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration:
                      AppWidgetStyles.packageCardDecoration(
                        context,
                        isRecommended: widget.isRecommended,
                      ).copyWith(
                        boxShadow: _isHovered
                            ? [
                                BoxShadow(
                                  color: widget.isRecommended
                                      ? AppColors.secondary.withValues(
                                          alpha: 50 / 255,
                                        )
                                      : Colors.black.withValues(
                                          alpha: 30 / 255,
                                        ),
                                  blurRadius: 30,
                                  offset: const Offset(0, 15),
                                ),
                              ]
                            : null,
                      ),
                  child: _buildCardContent(),
                ),
                if (widget.isRecommended) _buildRecommendedBadge(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent() => Container(
    padding: EdgeInsets.all(widget.isMini ? 16 : 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: widget.isPreview ? MainAxisSize.min : MainAxisSize.max,
      children: [
        _buildHeader(),
        const SizedBox(height: 8),
        if (widget.isMini || widget.isPreview)
          _buildDescription()
        else
          Expanded(child: _buildDescription()),
        if (widget.isMini && !widget.isPreview)
          const Spacer()
        else
          const SizedBox(height: 16),
        if (widget.package.discount > 0)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _buildDiscountBadge(),
          ),
        _buildPriceSection(),
        if (!widget.isPreview)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: _buildActionButton(),
          ),
      ],
    ),
  );

  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        widget.package.name,
        style: widget.isMini
            ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)
            : const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      if (widget.package.tokensPerPeriod > 0)
        Text(
          '${widget.package.tokensPerPeriod.formatSum} токенов',
          style: widget.isMini
              ? const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                )
              : const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
        ),
    ],
  );

  Widget _buildDescription() => Text(
    widget.package.description,
    style: widget.isMini
        ? TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          )
        : TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColors.textGrey,
          ),
    maxLines: widget.isMini ? 7 : null,
    overflow: widget.isMini ? TextOverflow.ellipsis : null,
  );

  Widget _buildPriceSection() {
    final discountedPrice = widget.package.discountedPrice;
    final originalPrice = widget.package.originalPrice;
    final hasDiscount = widget.package.hasDiscount && originalPrice > 0;

    final pricePerItem = widget.package.tokensPerPeriod > 0
        ? discountedPrice / widget.package.tokensPerPeriod
        : 0.0;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.2),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Column(
        key: ValueKey('price_${discountedPrice}_${widget.package.id}'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              if (discountedPrice > 0 && pricePerItem > 0)
                Text(
                  '${pricePerItem.formatSum} ₽ за шт.',
                  style: widget.isMini
                      ? TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                        )
                      : TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                        ),
                ),
              const Spacer(),
              if (hasDiscount)
                Text(
                  '${originalPrice.formatSum} ₽',
                  style:
                      (widget.isMini
                              ? const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )
                              : const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ))
                          .copyWith(
                            color: AppColors.textGrey,
                            decoration: TextDecoration.lineThrough,
                          ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                discountedPrice == 0
                    ? 'Индивидуально'
                    : '${discountedPrice.formatSum} ₽',
                style: widget.isMini
                    ? const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
                    : const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),

              if (discountedPrice > 0)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    widget.package.type == PackageType.tokenBased
                        ? (widget.package.totalTokens > 0
                              ? 'за ${widget.package.totalTokens.formatSum} ${widget.package.pluralTokens}'
                              : (widget.package.tokensPerPeriod > 0
                                    ? 'за ${widget.package.tokensPerPeriod.formatSum} ${widget.package.pluralTokens}'
                                    : 'за токены'))
                        : (widget.package.periodType != null
                              ? 'за ${widget.package.periodType!.text().toLowerCase()}'
                              : ''),
                    style: widget.isMini
                        ? TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          )
                        : TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    final buttonText = widget.isMini
        ? 'Выбрать'
        : (widget.package.discountedPrice == 0
              ? 'Связаться с нами'
              : 'Выбрать');

    if (widget.isRecommended) return _buildGradientButton(buttonText);

    return SizedBox(
      height: widget.isMini ? 40 : 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => widget.onTap?.call(),
        style: AppWidgetStyles.packageButtonStyle(
          context,
          isRecommended: widget.isRecommended,
          isMini: widget.isMini,
        ),
        child: Text(buttonText),
      ),
    );
  }

  Widget _buildGradientButton(String text) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    height: widget.isMini ? 40 : 54,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: const LinearGradient(
        colors: [Color(0xFFF2994A), Color(0xFFF2C94C)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.orange.withValues(alpha: (_isHovered ? 120 : 80) / 255),
          blurRadius: _isHovered ? 18 : 12,
          offset: Offset(0, _isHovered ? 6 : 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => widget.onTap?.call(),
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );

  Widget _buildRecommendedBadge() => Positioned(
    top: 0,
    right: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius),
          topRight: Radius.circular(_borderRadius),
        ),
      ),
      child: const Text(
        'Рекомендуем',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),
  );

  Widget _buildDiscountBadge() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFF27AE60).withValues(alpha: 10 / 255),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      'Экономия ${widget.package.discount}% от базовой цены',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Color(0xFF27AE60),
      ),
    ),
  );
}
