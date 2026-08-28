import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/models/highlight_level.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_highlight_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_panel_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_total_preview_notifier.dart';
import 'package:saas_ui/src/features/support/packages/presentation/packages_validators.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/section_header.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/numeric_field.dart';

/// Секция «Логика начисления» в панели редактирования пакета.
class PackagesAccrualSection extends ConsumerWidget {
  const PackagesAccrualSection({super.key});

  void _set(WidgetRef ref, ProductOffer item, {bool recomputeTotals = false}) {
    ref.read(packagesPanelProvider.notifier).open(item);
    if (recomputeTotals) {
      ref.read(packagesTotalPreviewProvider.notifier).recompute(item);
    }
  }

  void _changeTypePackage(
    WidgetRef ref,
    ProductOffer item,
    PackageType? value,
  ) {
    if (value == null) return;
    final next = item.copyWith(type: value, tokensPerPeriod: 0);
    _set(ref, next, recomputeTotals: true);
  }

  void _changeRenewalPeriodType(
    WidgetRef ref,
    ProductOffer item,
    PeriodType? value,
  ) {
    var next = item.copyWith(periodType: value);
    if (value == null) {
      next = next.copyWith(periodValue: 0, periodCount: 0);
    }
    _set(ref, next, recomputeTotals: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(packagesPanelProvider);
    if (item == null) return const SizedBox.shrink();
    return _buildContent(ref, item);
  }

  Widget _buildContent(WidgetRef ref, ProductOffer item) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 12,
    children: [
      const EditPanelSectionHeader(
        title: 'Логика начисления',
        icon: Icons.auto_awesome_outlined,
      ),
      _buildPackageTypeBlock(ref, item),
      _buildPeriodBlock(ref, item),
    ],
  );

  Widget _buildPackageTypeBlock(WidgetRef ref, ProductOffer item) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 12,
    children: [
      Text(
        '1. Наполнение пакета',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textGrey,
        ),
      ),
      AppDropdown<PackageType?>(
        onChanged: (v) => _changeTypePackage(ref, item, v),
        initialValue: item.type,
        enumValues: PackageType.values,
        label: 'Тип содержимого',
        showClearButton: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.category_outlined,
            size: 18,
            color: AppColors.textGrey,
          ),
        ),
      ),
      if (item.type == PackageType.tokenBased)
        _buildNumericField(
          ref,
          label: 'Токенов за цикл',
          fieldId: 'tokensPerPeriod',
          value: item.tokensPerPeriod,
          onChanged: (v) => _set(
            ref,
            item.copyWith(tokensPerPeriod: v.toInt()),
            recomputeTotals: true,
          ),
          prefixIcon: Icons.token_outlined,
          validator: (v) => PackagesValidators.tokensPerPeriod(v, item.type),
        ),
    ],
  );

  Widget _buildPeriodBlock(WidgetRef ref, ProductOffer item) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 12,
    children: [
      Text(
        '2. Периодичность и срок',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.textGrey,
        ),
      ),
      AppDropdown<PeriodType>(
        onChanged: (v) => _changeRenewalPeriodType(ref, item, v),
        enumValues: PeriodType.values,
        label: 'Тип периода',
        initialValue: item.periodType,
        showClearButton: false,
        validator: PackagesValidators.periodType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.calendar_today_outlined,
            size: 18,
            color: AppColors.textGrey,
          ),
        ),
      ),
      _buildNumericField(
        ref,
        label: 'Длительность периода',
        fieldId: 'periodValue',
        value: item.periodValue,
        onChanged: (v) => _set(
          ref,
          item.copyWith(periodValue: v.toInt()),
          recomputeTotals: true,
        ),
        prefixIcon: _getPeriodIcon(item.periodType),
        validator: (v) => PackagesValidators.periodValue(v, item.periodType),
      ),
      _buildNumericField(
        ref,
        label: 'Обновлений',
        fieldId: 'periodCount',
        value: item.periodCount,
        onChanged: (v) => _set(
          ref,
          item.copyWith(periodCount: v.toInt()),
          recomputeTotals: true,
        ),
        prefixIcon: Icons.repeat_outlined,
        validator: (v) => PackagesValidators.periodCount(v, item.periodType),
      ),
    ],
  );

  Widget _buildNumericField(
    WidgetRef ref, {
    required String label,
    required String fieldId,
    required num? value,
    required ValueChanged<num> onChanged,
    String? helperText,
    IconData? prefixIcon,
    FormFieldValidator<num>? validator,
  }) {
    final hl = ref.watch(packagesHighlightProvider);
    final highlightLevel = hl[fieldId] ?? HighlightLevel.none;
    return NumericField(
      highlightLevel: highlightLevel,
      onChanged: onChanged,
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        helperText: helperText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 18, color: AppColors.textGrey)
            : null,
      ),
      decimals: 0,
      validator: validator,
    );
  }

  IconData _getPeriodIcon(PeriodType? periodType) => switch (periodType) {
    PeriodType.day => Icons.today_outlined,
    PeriodType.month => Icons.calendar_month_outlined,
    _ => Icons.calendar_today_outlined,
  };
}
