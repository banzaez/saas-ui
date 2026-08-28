// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_entities_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(legalEntitiesRepository)
final legalEntitiesRepositoryProvider = LegalEntitiesRepositoryProvider._();

final class LegalEntitiesRepositoryProvider
    extends
        $FunctionalProvider<
          LegalEntitiesRepository,
          LegalEntitiesRepository,
          LegalEntitiesRepository
        >
    with $Provider<LegalEntitiesRepository> {
  LegalEntitiesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'legalEntitiesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$legalEntitiesRepositoryHash();

  @$internal
  @override
  $ProviderElement<LegalEntitiesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LegalEntitiesRepository create(Ref ref) {
    return legalEntitiesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LegalEntitiesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LegalEntitiesRepository>(value),
    );
  }
}

String _$legalEntitiesRepositoryHash() =>
    r'6ecace1a232fd343c0ce7e1ba4e7d3d0f91127f8';
