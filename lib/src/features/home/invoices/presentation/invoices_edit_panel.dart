import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/features/home/invoices/application/invoices_notifier.dart';
import 'package:saas_ui/src/features/home/invoices/application/invoices_panel_notifier.dart';
import 'package:saas_ui/src/shared/widgets/app_status.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/base_riverpod_crud_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/edit_panel/info_item.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/fields/numeric_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/company_reference_field.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/legal_entity_reference_field.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

class InvoicesEditPanel extends BaseRiverpodCrudEditPanel<Invoice> {
  const InvoicesEditPanel({super.key});

  @override
  Invoice? watchPanel(WidgetRef ref) => ref.watch(invoicesPanelProvider);

  @override
  String get createTitle => 'Создание платежа';

  @override
  String get editTitle => 'Редактирование платежа';

  @override
  Future<Invoice?> performSave(WidgetRef ref, Invoice item) =>
      ref.read(invoicesProvider.notifier).saveItem(item);

  @override
  void closePanel(WidgetRef ref) =>
      ref.read(invoicesPanelProvider.notifier).close();

  @override
  List<EditPanelInfoItem>? buildInfo(WidgetRef ref, Invoice item) => [
    if (item.id != null)
      EditPanelInfoItem(title: 'ID', value: item.id.toString()),
    EditPanelInfoItem(title: 'Способ оплаты', value: item.method.toString()),
    EditPanelInfoItem(
      title: 'Статус',
      valueWidget: AppStatus(
        status: item.status.toString(),
        color: item.status.color,
      ),
    ),
  ];

  void _set(WidgetRef ref, Invoice item) =>
      ref.read(invoicesPanelProvider.notifier).open(item);

  @override
  List<Widget> buildFormChildren(
    BuildContext context,
    WidgetRef ref,
    Invoice item,
  ) => [
    Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CompanyReferenceField(
        onChanged: (value) => _set(ref, item.copyWith(companyId: value!.id!)),
        decoration: const InputDecoration(labelText: 'Компания'),
        initialValue: item.companyId,
      ).visibleForSupport(
        role: ref.watch(userServiceProvider).value?.role,
      ),
    ),
    LegalEntityReferenceField(
      onChanged: (value) => _set(ref, item.copyWith(legalEntityId: value!.id!)),
      decoration: const InputDecoration(labelText: 'Юрлицо'),
      initialValue: item.legalEntityId,
    ),
    const SizedBox(height: 16),
    NumericField(
      onChanged: (value) => _set(ref, item.copyWith(amount: value.toDouble())),
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
      onChanged: (value) => _set(ref, item.copyWith(method: value!)),
    ),
  ];
}
