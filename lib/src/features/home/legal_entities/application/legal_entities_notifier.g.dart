// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_entities_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LegalEntities)
final legalEntitiesProvider = LegalEntitiesProvider._();

final class LegalEntitiesProvider
    extends $AsyncNotifierProvider<LegalEntities, List<LegalEntity>> {
  LegalEntitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'legalEntitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$legalEntitiesHash();

  @$internal
  @override
  LegalEntities create() => LegalEntities();
}

String _$legalEntitiesHash() => r'144037bd13d56aa9dc9bf7d842f7f1aad6b2d48c';

abstract class _$LegalEntities extends $AsyncNotifier<List<LegalEntity>> {
  FutureOr<List<LegalEntity>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<LegalEntity>>, List<LegalEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<LegalEntity>>, List<LegalEntity>>,
              AsyncValue<List<LegalEntity>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
