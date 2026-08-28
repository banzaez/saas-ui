// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pincodes_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pinCodesRepository)
final pinCodesRepositoryProvider = PinCodesRepositoryProvider._();

final class PinCodesRepositoryProvider
    extends
        $FunctionalProvider<
          PinCodesRepository,
          PinCodesRepository,
          PinCodesRepository
        >
    with $Provider<PinCodesRepository> {
  PinCodesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinCodesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinCodesRepositoryHash();

  @$internal
  @override
  $ProviderElement<PinCodesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PinCodesRepository create(Ref ref) {
    return pinCodesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinCodesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinCodesRepository>(value),
    );
  }
}

String _$pinCodesRepositoryHash() =>
    r'0745cc5ba40b2db93041a4f73ebfac8cb4bb599e';
