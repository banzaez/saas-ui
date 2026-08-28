import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/models/highlight_level.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_highlight_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_panel_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_total_preview_notifier.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/section_header.dart';
import 'package:saas_ui/src/shared/widgets/formula/formula_widgets.dart';

/// Секция «Итоговые расчеты» в панели редактирования пакета.
///
/// Отображает формулы с интерактивной hover-подсветкой связанных полей.
class PackagesCalculationsSection extends ConsumerWidget {
  const PackagesCalculationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(packagesPanelProvider);
    final totalAsync = ref.watch(packagesTotalPreviewProvider);
    ref.watch(packagesHighlightProvider);
    if (item == null) return const SizedBox.shrink();
    return _buildContent(ref, item, totalAsync);
  }

  Widget _buildContent(
    WidgetRef ref,
    ProductOffer item,
    AsyncValue<double> totalAsync,
  ) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8,
    children: [
      const EditPanelSectionHeader(
        title: 'Итоговые расчеты',
        icon: Icons.analytics_outlined,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: _buildPeriodPreview(ref, item),
      ),
      if (item.type == PackageType.tokenBased) _buildTokensPreview(ref, item),
      if (item.type == PackageType.tokenBased)
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: _buildPricePerToken(ref, item, totalAsync),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: _buildTotalSumPreview(ref, totalAsync),
      ),
    ],
  );

  Widget _buildPeriodPreview(WidgetRef ref, ProductOffer item) =>
      FormulaContainer(
        label: 'Общий период',
        onEnter: () => ref.read(packagesHighlightProvider.notifier).setFields({
          'periodValue': HighlightLevel.normal,
          'periodCount': HighlightLevel.normal,
        }),
        onExit: ref.read(packagesHighlightProvider.notifier).clear,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormulaPart(
              value: item.periodValue.toString(),
              label: item.periodType?.plural(item.periodValue) ?? 'none',
              onHover: (s) => ref
                  .read(packagesHighlightProvider.notifier)
                  .setField(
                    'periodValue',
                    s ? HighlightLevel.strong : HighlightLevel.normal,
                  ),
            ),
            const FormulaSymbol('×'),
            FormulaPart(
              value: item.periodCount.toString(),
              label: 'обнов',
              onHover: (s) => ref
                  .read(packagesHighlightProvider.notifier)
                  .setField(
                    'periodCount',
                    s ? HighlightLevel.strong : HighlightLevel.normal,
                  ),
            ),
            const FormulaSymbol('='),
            Text(
              item.totalPeriodValue.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              item.periodType?.plural(item.totalPeriodValue) ?? '',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      );

  Widget _buildTokensPreview(WidgetRef ref, ProductOffer item) =>
      FormulaContainer(
        label: 'Всего токенов',
        onEnter: () => ref.read(packagesHighlightProvider.notifier).setFields({
          'tokensPerPeriod': HighlightLevel.normal,
          'periodValue': HighlightLevel.normal,
          'periodCount': HighlightLevel.normal,
        }),
        onExit: ref.read(packagesHighlightProvider.notifier).clear,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FormulaPart(
              value: item.tokensPerPeriod.formatSum,
              label: 'токенов',
              onHover: (s) => ref
                  .read(packagesHighlightProvider.notifier)
                  .setField(
                    'tokensPerPeriod',
                    s ? HighlightLevel.strong : HighlightLevel.normal,
                  ),
            ),
            const FormulaSymbol('на'),
            FormulaPart(
              value: item.periodValue.toString(),
              label: item.periodType?.plural(item.periodValue) ?? 'none',
              onHover: (s) => ref
                  .read(packagesHighlightProvider.notifier)
                  .setField(
                    'periodValue',
                    s ? HighlightLevel.strong : HighlightLevel.normal,
                  ),
            ),
            const FormulaSymbol('×'),
            FormulaPart(
              value: item.periodCount.toString(),
              label: 'обнов',
              onHover: (s) => ref
                  .read(packagesHighlightProvider.notifier)
                  .setField(
                    'periodCount',
                    s ? HighlightLevel.strong : HighlightLevel.normal,
                  ),
            ),
            const FormulaSymbol('='),
            Text(
              item.totalTokens.formatSum,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              item.pluralTokens,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),
      );

  Widget _buildTotalSumPreview(WidgetRef ref, AsyncValue<double> totalAsync) =>
      FormulaContainer(
        label: 'Итоговая цена',
        hint: 'Расчет выполняется на стороне сервера',
        onEnter: () => ref.read(packagesHighlightProvider.notifier).setFields({
          'price': HighlightLevel.normal,
          'discount': HighlightLevel.normal,
          'periodCount': HighlightLevel.normal,
        }),
        onExit: ref.read(packagesHighlightProvider.notifier).clear,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            switch (totalAsync) {
              AsyncLoading() => const SizedBox(
                width: 20,
                height: 20,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              AsyncData(:final value) => Text(
                '${value.formatSum} ₽',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              _ => const SizedBox.shrink(),
            },
          ],
        ),
      );

  Widget _buildPricePerToken(
    WidgetRef ref,
    ProductOffer item,
    AsyncValue<double> totalAsync,
  ) {
    final sumText = switch (totalAsync) {
      AsyncData(:final value) => '${value.formatSum} ₽',
      _ => '…',
    };
    return FormulaContainer(
      label: 'Стоимость одного токена',
      onEnter: () => ref.read(packagesHighlightProvider.notifier).setFields({
        'price': HighlightLevel.normal,
        'discount': HighlightLevel.normal,
        'periodCount': HighlightLevel.normal,
        'tokensPerPeriod': HighlightLevel.normal,
        'periodValue': HighlightLevel.normal,
      }),
      onExit: ref.read(packagesHighlightProvider.notifier).clear,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormulaPart(
            value: sumText,
            label: 'Итоговая цена',
            onHover: (s) {
              final hl = ref.read(packagesHighlightProvider.notifier);
              hl.setField(
                'price',
                s ? HighlightLevel.strong : HighlightLevel.normal,
              );
              hl.setField(
                'discount',
                s ? HighlightLevel.strong : HighlightLevel.normal,
              );
              hl.setField(
                'periodCount',
                s ? HighlightLevel.strong : HighlightLevel.normal,
              );
            },
          ),
          const FormulaSymbol('÷'),
          FormulaPart(
            value: item.totalTokens.formatSum,
            label: 'Всего токенов',
            onHover: (s) {
              final hl = ref.read(packagesHighlightProvider.notifier);
              hl.setField(
                'tokensPerPeriod',
                s ? HighlightLevel.strong : HighlightLevel.normal,
              );
              hl.setField(
                'periodValue',
                s ? HighlightLevel.strong : HighlightLevel.normal,
              );
              hl.setField(
                'periodCount',
                s ? HighlightLevel.strong : HighlightLevel.normal,
              );
            },
          ),
          const FormulaSymbol('='),
          Text(
            '${item.pricePerToken.formatSum} ₽',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '/ токен',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}
