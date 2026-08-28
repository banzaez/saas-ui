// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_transaction_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tokenTransactionsRepository)
final tokenTransactionsRepositoryProvider =
    TokenTransactionsRepositoryProvider._();

final class TokenTransactionsRepositoryProvider
    extends
        $FunctionalProvider<
          TokenTransactionsRepository,
          TokenTransactionsRepository,
          TokenTransactionsRepository
        >
    with $Provider<TokenTransactionsRepository> {
  TokenTransactionsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenTransactionsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenTransactionsRepositoryHash();

  @$internal
  @override
  $ProviderElement<TokenTransactionsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TokenTransactionsRepository create(Ref ref) {
    return tokenTransactionsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenTransactionsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenTransactionsRepository>(value),
    );
  }
}

String _$tokenTransactionsRepositoryHash() =>
    r'6f67daa26df561ed56f72d507fcdce68c773b231';
