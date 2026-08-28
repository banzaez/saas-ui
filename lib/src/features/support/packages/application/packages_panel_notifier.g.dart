// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PackagesPanel)
final packagesPanelProvider = PackagesPanelProvider._();

final class PackagesPanelProvider
    extends $NotifierProvider<PackagesPanel, ProductOffer?> {
  PackagesPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packagesPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packagesPanelHash();

  @$internal
  @override
  PackagesPanel create() => PackagesPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductOffer? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductOffer?>(value),
    );
  }
}

String _$packagesPanelHash() => r'a100a77e4cff73d544b8152ec74f07372ec00653';

abstract class _$PackagesPanel extends $Notifier<ProductOffer?> {
  ProductOffer? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ProductOffer?, ProductOffer?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductOffer?, ProductOffer?>,
              ProductOffer?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
