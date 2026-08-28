// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductsPanel)
final productsPanelProvider = ProductsPanelProvider._();

final class ProductsPanelProvider
    extends $NotifierProvider<ProductsPanel, Product?> {
  ProductsPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsPanelHash();

  @$internal
  @override
  ProductsPanel create() => ProductsPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Product? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Product?>(value),
    );
  }
}

String _$productsPanelHash() => r'0d6b6f075cdc9a8f14d51c1db8c879a702e6924d';

abstract class _$ProductsPanel extends $Notifier<Product?> {
  Product? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Product?, Product?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Product?, Product?>,
              Product?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
