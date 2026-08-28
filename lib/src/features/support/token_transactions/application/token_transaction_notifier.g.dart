// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_transaction_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenTransactionCertificates)
final tokenTransactionCertificatesProvider =
    TokenTransactionCertificatesProvider._();

final class TokenTransactionCertificatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Certificate>>,
          List<Certificate>,
          FutureOr<List<Certificate>>
        >
    with
        $FutureModifier<List<Certificate>>,
        $FutureProvider<List<Certificate>> {
  TokenTransactionCertificatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenTransactionCertificatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenTransactionCertificatesHash();

  @$internal
  @override
  $FutureProviderElement<List<Certificate>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Certificate>> create(Ref ref) {
    return tokenTransactionCertificates(ref);
  }
}

String _$tokenTransactionCertificatesHash() =>
    r'60f8b0cc94d3f32894b9b83afb1c71bb4d44bdc8';

@ProviderFor(TokenTransactions)
final tokenTransactionsProvider = TokenTransactionsProvider._();

final class TokenTransactionsProvider
    extends $AsyncNotifierProvider<TokenTransactions, List<TokenTransaction>> {
  TokenTransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenTransactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenTransactionsHash();

  @$internal
  @override
  TokenTransactions create() => TokenTransactions();
}

String _$tokenTransactionsHash() => r'c49345ec1fba0582bf172a66a5baa945449d9178';

abstract class _$TokenTransactions
    extends $AsyncNotifier<List<TokenTransaction>> {
  FutureOr<List<TokenTransaction>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<TokenTransaction>>, List<TokenTransaction>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<TokenTransaction>>,
                List<TokenTransaction>
              >,
              AsyncValue<List<TokenTransaction>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
