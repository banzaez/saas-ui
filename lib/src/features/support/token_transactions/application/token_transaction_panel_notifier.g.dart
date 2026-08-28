// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_transaction_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TokenTransactionPanel)
final tokenTransactionPanelProvider = TokenTransactionPanelProvider._();

final class TokenTransactionPanelProvider
    extends $NotifierProvider<TokenTransactionPanel, TokenTransaction?> {
  TokenTransactionPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenTransactionPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenTransactionPanelHash();

  @$internal
  @override
  TokenTransactionPanel create() => TokenTransactionPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenTransaction? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenTransaction?>(value),
    );
  }
}

String _$tokenTransactionPanelHash() =>
    r'8f023b528b52e511e7eb43daadc9aaafcbf62d31';

abstract class _$TokenTransactionPanel extends $Notifier<TokenTransaction?> {
  TokenTransaction? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TokenTransaction?, TokenTransaction?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TokenTransaction?, TokenTransaction?>,
              TokenTransaction?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
