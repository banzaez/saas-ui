import 'package:saas_ui/src/core/models/settings/group_settings.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

/// Настройки группировки платежей в табличном отображении.
class PaymentGroupSettings extends GroupSettings<Payment> {
  @override
  final List<GroupField<Payment>> availableGroupFields = [
    GroupField(id: 'none', name: 'Без группировки', groupBy: (_) => null),
    GroupField(
      id: 'company',
      name: 'По компании',
      groupBy: (item) => '${item.companyName} (${item.companyId})',
    ),
  ];

  @override
  String? get initialGroupFieldId => 'none';

  PaymentGroupSettings({super.groupBy});

  @override
  PaymentGroupSettings createCopy({GroupField<Payment>? groupBy}) =>
      PaymentGroupSettings(groupBy: groupBy);
}
