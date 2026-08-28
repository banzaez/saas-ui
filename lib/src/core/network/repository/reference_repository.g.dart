// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(referenceRepository)
final referenceRepositoryProvider = ReferenceRepositoryProvider._();

final class ReferenceRepositoryProvider
    extends
        $FunctionalProvider<
          ReferenceRepository,
          ReferenceRepository,
          ReferenceRepository
        >
    with $Provider<ReferenceRepository> {
  ReferenceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referenceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referenceRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReferenceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReferenceRepository create(Ref ref) {
    return referenceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReferenceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReferenceRepository>(value),
    );
  }
}

String _$referenceRepositoryHash() =>
    r'7cd8111a91c85b9f5cde49aea5251dffe135ac4c';
