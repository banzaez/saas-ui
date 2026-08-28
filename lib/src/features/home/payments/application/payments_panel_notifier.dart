import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/payment.dart';

part 'payments_panel_notifier.g.dart';

@riverpod
class PaymentsPanel extends _$PaymentsPanel with PanelActions<Payment> {
  @override
  Payment? build() => null;
}
