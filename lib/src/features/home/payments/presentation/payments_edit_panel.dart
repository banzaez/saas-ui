import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/features/home/payments/application/payments_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_status.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/numeric_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/company_reference_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/legal_entity_reference_field.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

/// Панель деталей платежа (без сохранения на сервер).
class PaymentsEditPanel extends ConsumerWidget {
  const PaymentsEditPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(paymentsPanelProvider);
    if (item == null) return const SizedBox.shrink();

    void setItem(Payment p) =>
        ref.read(paymentsPanelProvider.notifier).open(p);

    return AppEditPanel(
      key: ValueKey(item.id ?? 'new'),
      title: 'Детали платежа',
      info: [
        EditPanelInfoItem(title: 'ID', value: item.id.toString()),
        EditPanelInfoItem(
          title: 'Способ оплаты',
          value: item.method.toString(),
        ),
        EditPanelInfoItem(
          title: 'Статус',
          valueWidget: AppStatus(
            status: item.status.toString(),
            color: item.status.color,
          ),
        ),
      ],
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CompanyReferenceField(
            onChanged: (value) => setItem(item.copyWith(companyId: value!.id!)),
            decoration: const InputDecoration(labelText: 'Компания'),
            initialValue: item.companyId,
          ).visibleForSupport(
            role: ref.watch(userServiceProvider).value?.role,
          ),
        ),
        LegalEntityReferenceField(
          onChanged: (value) =>
              setItem(item.copyWith(legalEntityId: value!.id!)),
          decoration: const InputDecoration(labelText: 'Юрлицо'),
          initialValue: item.legalEntityId,
        ),
        const SizedBox(height: 16),
        NumericField(
          onChanged: (value) =>
              setItem(item.copyWith(amount: value.toDouble())),
          initialValue: item.amount,
          decoration: InputDecoration(
            labelText: 'Сумма',
            prefixText: '${item.currency} ',
          ),
        ),
        const SizedBox(height: 16),
        AppDropdown<PaymentMethod>(
          initialValue: item.method,
          enumValues: PaymentMethod.values,
          onChanged: (value) => setItem(item.copyWith(method: value!)),
        ),
      ],
    );
  }
}
