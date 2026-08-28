import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/shared/widgets/app_status.dart';

class BadgeSettings extends StatelessWidget {
  final ProductOffer item;

  const BadgeSettings({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 8 / 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 15 / 255),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 0. Тип (Т/В)
          AppStatus(
            status: item.type.textShort,
            color: item.type.color,
            isUppercase: true,
          ),

          _divider(),

          // 1. Токены
          SizedBox(
            width: 80,
            child: _iconText(
              Icons.token_outlined,
              '${item.totalTokens}',
              'ток.',
              color: AppColors.primary,
              subText: item.periodCount > 1
                  ? '${item.tokensPerPeriod}×${item.periodCount}'
                  : null,
            ),
          ),

          _divider(),

          // 2. Период
          SizedBox(
            width: 90,
            child: item.periodType != null
                ? _iconText(
                    item.periodType == PeriodType.day
                        ? Icons.today
                        : Icons.calendar_month,
                    '${item.totalPeriodValue}',
                    item.periodType!.plural(item.totalPeriodValue),
                    subText: '${item.periodValue}×${item.periodCount}',
                  )
                : const SizedBox.shrink(),
          ),

          _divider(),

          // 3. Цена и Скидка
          SizedBox(width: 110, child: _priceSection()),
        ],
      ),
    );
  }

  Widget _iconText(
    IconData icon,
    String value,
    String unit, {
    Color? color,
    String? subText,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Icon(icon, size: 14, color: color ?? AppColors.textGrey),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              spacing: 2,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                Text(
                  unit,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: (color ?? AppColors.textGrey).withValues(
                      alpha: 180 / 255,
                    ),
                  ),
                ),
              ],
            ),
            if (subText != null)
              Text(
                subText,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey.withValues(alpha: 120 / 255),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _priceSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              '${item.totalSum.formatSum} ₽',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
            if (item.hasDiscount) _discountBadge(item.discount),
          ],
        ),
        Text(
          '${item.pricePerToken.formatSum} ₽/токен',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: AppColors.textGrey.withValues(alpha: 180 / 255),
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(
      height: 18,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.primary.withValues(alpha: 25 / 255),
    );
  }

  Widget _discountBadge(double discount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 30 / 255),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '-${discount.formatSum}%',
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Colors.red,
        ),
      ),
    );
  }
}
