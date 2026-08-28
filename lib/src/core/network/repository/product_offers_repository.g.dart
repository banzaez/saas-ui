// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_offers_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productOffersRepository)
final productOffersRepositoryProvider = ProductOffersRepositoryProvider._();

final class ProductOffersRepositoryProvider
    extends
        $FunctionalProvider<
          ProductOffersRepository,
          ProductOffersRepository,
          ProductOffersRepository
        >
    with $Provider<ProductOffersRepository> {
  ProductOffersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productOffersRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productOffersRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductOffersRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductOffersRepository create(Ref ref) {
    return productOffersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductOffersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductOffersRepository>(value),
    );
  }
}

String _$productOffersRepositoryHash() =>
    r'8ac0a9b96c51720dc517e6f8b29af29169a2eb42';
