// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Packages)
final packagesProvider = PackagesProvider._();

final class PackagesProvider
    extends $AsyncNotifierProvider<Packages, List<ProductOffer>> {
  PackagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packagesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packagesHash();

  @$internal
  @override
  Packages create() => Packages();
}

String _$packagesHash() => r'f7edc7ee9f9f1f38bcee375e7a371f0e44c9a2e1';

abstract class _$Packages extends $AsyncNotifier<List<ProductOffer>> {
  FutureOr<List<ProductOffer>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProductOffer>>, List<ProductOffer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProductOffer>>, List<ProductOffer>>,
              AsyncValue<List<ProductOffer>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
