import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/features/home/invoices/application/invoices_notifier.dart';
import 'package:saas_ui/src/features/home/invoices/presentation/invoices_edit_panel.dart';
import 'package:saas_ui/src/features/home/invoices/presentation/invoices_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/date_range_picker.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

class InvoicesScreen extends ConsumerWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNotifier = ref.read(invoicesProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(title: 'Платежи (Счета)'),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            AppContainer(
              padding: const EdgeInsets.all(20),
              child: Row(
                spacing: 16,
                children: [
                  Flexible(
                    child: AppDropdown<PaymentMethod>(
                      initialValue: listNotifier.settings.filter.method,
                      onChanged: listNotifier.setMethodFilter,
                      enumValues: PaymentMethod.values,
                      hint: 'Все способы оплаты',
                    ),
                  ),
                  Flexible(
                    child: AppDropdown<InvoiceStatus>(
                      initialValue: listNotifier.settings.filter.status,
                      onChanged: listNotifier.setStatusFilter,
                      enumValues: InvoiceStatus.values,
                      hint: 'Все статусы',
                    ),
                  ),
                  Flexible(
                    child: AppDateRangePicker(
                      onSubmit: listNotifier.setDateRangeFilter,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AppScreenWithPanel(
                screen: const InvoicesTable(),
                editPanel: const InvoicesEditPanel().visibleForSupport(
                  role: ref.watch(userServiceProvider).value?.role,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
