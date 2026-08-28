import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/invoice.dart';

part 'invoices_panel_notifier.g.dart';

@riverpod
class InvoicesPanel extends _$InvoicesPanel with PanelActions<Invoice> {
  @override
  Invoice? build() => null;
}
