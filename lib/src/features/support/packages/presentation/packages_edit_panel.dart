import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_num.dart';
import 'package:saas_ui/src/core/models/highlight_level.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/styles/app_colors.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_highlight_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_panel_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_total_preview_notifier.dart';
import 'package:saas_ui/src/features/support/packages/presentation/packages_validators.dart';
import 'package:saas_ui/src/features/support/packages/presentation/widgets/edit_panel/packages_accrual_section.dart';
import 'package:saas_ui/src/features/support/packages/presentation/widgets/edit_panel/packages_calculations_section.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/base_riverpod_crud_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/integration_section.dart';
import 'package:saas_ui/src/core/gen/assets.gen.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/section_header.dart';
import 'package:saas_ui/src/shared/widgets/fields/numeric_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/company_reference_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/product_reference_field.dart';

class PackagesEditPanel extends BaseRiverpodCrudEditPanel<ProductOffer> {
  const PackagesEditPanel({super.key});

  @override
  ProductOffer? watchPanel(WidgetRef ref) => ref.watch(packagesPanelProvider);

  @override
  String get createTitle => 'Создание пакета';

  @override
  String get editTitle => 'Редактирование пакета';

  @override
  double get maxWidth => 800;

  void _set(WidgetRef ref, ProductOffer item, {bool recomputeTotals = false}) {
    ref.read(packagesPanelProvider.notifier).open(item);
    if (recomputeTotals) {
      ref.read(packagesTotalPreviewProvider.notifier).recompute(item);
    }
  }

  @override
  void afterCancel(WidgetRef ref) {
    ref.read(packagesHighlightProvider.notifier).clear();
  }

  @override
  Future<ProductOffer?> performSave(WidgetRef ref, ProductOffer item) =>
      ref.read(packagesProvider.notifier).saveItem(item);

  @override
  void closePanel(WidgetRef ref) {
    ref.read(packagesHighlightProvider.notifier).clear();
    ref.read(packagesPanelProvider.notifier).close();
  }

  @override
  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, ProductOffer item) => [
    EditPanelInfoItem(title: 'ID', value: '${item.id ?? ''}'),
  ];

  @override
  Widget? buildActionsPrefix(BuildContext context, WidgetRef ref) {
    final item = watchPanel(ref);
    if (item == null) return null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Активен',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 8),
        Switch(
          value: item.isActive,
          onChanged: (v) => _set(ref, item.copyWith(isActive: v)),
        ),
      ],
    );
  }

  @override
  List<Widget> buildFormChildren(
    BuildContext context,
    WidgetRef ref,
    ProductOffer item,
  ) => [
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        _buildMainSection(context, ref, item),
        _buildPricingSection(context, ref, item),
      ],
    ),
  ];

  Widget _buildMainSection(
    BuildContext context,
    WidgetRef ref,
    ProductOffer item,
  ) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        const EditPanelSectionHeader(
          title: 'Основная информация',
          icon: Icons.info_outline,
        ),
        ProductReferenceField(
          onChanged: (value) => _set(ref, item.copyWith(productId: value!.id!)),
          initialValue: item.productId,
          decoration: const InputDecoration(labelText: 'Продукт'),
          validator: PackagesValidators.product,
          enabled: item.id == null,
        ),
        TextFormField(
          onChanged: (value) => _set(ref, item.copyWith(name: value)),
          initialValue: item.name,
          decoration: const InputDecoration(labelText: 'Наименование'),
          maxLines: null,
          validator: PackagesValidators.name,
        ),
        TextFormField(
          onChanged: (value) => _set(ref, item.copyWith(description: value)),
          initialValue: item.description,
          decoration: const InputDecoration(labelText: 'Описание'),
          maxLines: null,
          minLines: 3,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          validator: PackagesValidators.description,
        ),
        CompanyReferenceField(
          onChanged: (value) => _set(ref, item.copyWith(companyId: value?.id)),
          initialValue: item.companyId,
          decoration: const InputDecoration(
            labelText: 'Для компании',
            helperText: 'Эксклюзивный доступ для выбранной компании',
          ),
          showClearButton: true,
        ),
        IntegrationSection(
          children: [
            IntegrationGroup(
              title: 'МойСклад',
              logo: Assets.integrations.moysklad.image(),
              children: [
                ConfirmedTextField(
                  initialValue: item.mystockTariffId,
                  onChanged: (value) =>
                      _set(ref, item.copyWith(mystockTariffId: value.isEmpty ? null : value)),
                  label: 'ID тарифа МойСклад',
                  helperText: 'Идентификатор тарифа в сервисе МойСклад',
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildPricingSection(
    BuildContext context,
    WidgetRef ref,
    ProductOffer item,
  ) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const PackagesAccrualSection(),
        const EditPanelSectionHeader(
          title: 'Ценообразование',
          icon: Icons.payments_outlined,
        ),
        Row(
          spacing: 12,
          children: [
            Flexible(
              child: _buildNumericField(
                ref,
                label: 'Цена',
                fieldId: 'price',
                value: item.price,
                onChanged: (v) => _set(
                  ref,
                  item.copyWith(price: v.toDouble()),
                  recomputeTotals: true,
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: _buildNumericField(
                ref,
                label: 'Скидка %',
                fieldId: 'discount',
                value: item.discount,
                onChanged: (v) => _set(
                  ref,
                  item.copyWith(discount: v.toDouble()),
                  recomputeTotals: true,
                ),
              ),
            ),
            Flexible(
              child: Consumer(
                builder: (context, ref, _) {
                  final current = ref.watch(packagesPanelProvider);
                  return _buildReadOnlyField(
                    label: 'Цена со скидкой',
                    value: '${current?.discountedPrice.formatSum ?? 0}',
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Цена указывается за один период',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
            ),
          ),
        ),
        const PackagesCalculationsSection(),
      ],
    ),
  );

  Widget _buildNumericField(
    WidgetRef ref, {
    required String label,
    required String fieldId,
    required num? value,
    required ValueChanged<num> onChanged,
    String? helperText,
    int decimals = 0,
  }) {
    final hl = ref.watch(packagesHighlightProvider);
    final highlightLevel = hl[fieldId] ?? HighlightLevel.none;
    return NumericField(
      highlightLevel: highlightLevel,
      onChanged: onChanged,
      initialValue: value,
      decoration: InputDecoration(labelText: label, helperText: helperText),
      decimals: decimals,
    );
  }

  Widget _buildReadOnlyField({required String label, required String value}) =>
      TextFormField(
        initialValue: value,
        key: ValueKey(value),
        readOnly: true,
        decoration: InputDecoration(labelText: label),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );
}
