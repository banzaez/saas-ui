import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/token_transaction.dart';

part 'token_transaction_panel_notifier.g.dart';

@riverpod
class TokenTransactionPanel extends _$TokenTransactionPanel
    with PanelActions<TokenTransaction> {
  @override
  TokenTransaction? build() => null;
}
