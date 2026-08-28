import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/extensions/ext_widget.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';
import 'package:saas_ui/src/features/home/payments/application/payments_notifier.dart';
import 'package:saas_ui/src/features/home/payments/presentation/payments_edit_panel.dart';
import 'package:saas_ui/src/features/home/payments/presentation/payments_table.dart';
import 'package:saas_ui/src/shared/widgets/app_screen_with_panel.dart';
import 'package:saas_ui/src/shared/widgets/app_container.dart';
import 'package:saas_ui/src/shared/widgets/fields/date_range_picker.dart';
import 'package:saas_ui/src/shared/widgets/fields/dropdown.dart';
import 'package:saas_ui/src/shared/widgets/app_header.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

T? _firstOrNull<T>(List<T>? list) =>
    list != null && list.isNotEmpty ? list.first : null;

class PaymentsScreen extends ConsumerWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listNotifier = ref.read(paymentsProvider.notifier);

    return Scaffold(
      appBar: const AppHomeHeader(
        title: 'Взаиморасчеты',
      ),
      body: AppScreenWithPanel(
        screen: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
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
                      child: AppDateRangePicker(
                        onSubmit: listNotifier.setDateRangeFilter,
                      ),
                    ),
                    Flexible(
                      child: AppDropdown<PaymentMethod>(
                        initialValue: _firstOrNull(
                          listNotifier.settings.filter.methods,
                        ),
                        onChanged: listNotifier.setMethodFilter,
                        enumValues: PaymentMethod.values,
                        hint: 'Все способы оплаты',
                      ),
                    ),
                    Flexible(
                      child: AppDropdown<PaymentStatus>(
                        initialValue: _firstOrNull(
                          listNotifier.settings.filter.statuses,
                        ),
                        onChanged: listNotifier.setStatusFilter,
                        enumValues: PaymentStatus.values,
                        hint: 'Все статусы',
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: PaymentsTable()),
            ],
          ),
        ),
        editPanel: const PaymentsEditPanel().visibleForSupport(
          role: ref.watch(userServiceProvider).value?.role,
        ),
      ),
    );
  }
}
