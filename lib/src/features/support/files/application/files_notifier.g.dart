// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filesProducts)
final filesProductsProvider = FilesProductsProvider._();

final class FilesProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  FilesProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filesProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filesProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return filesProducts(ref);
  }
}

String _$filesProductsHash() => r'1470f08db7cbfa8d679a8c510efc7c8f7107fc86';

@ProviderFor(Files)
final filesProvider = FilesProvider._();

final class FilesProvider extends $AsyncNotifierProvider<Files, List<AppFile>> {
  FilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filesHash();

  @$internal
  @override
  Files create() => Files();
}

String _$filesHash() => r'fc78d4dd83f58d330a430c8b2424d1f97e9ba92c';

abstract class _$Files extends $AsyncNotifier<List<AppFile>> {
  FutureOr<List<AppFile>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<AppFile>>, List<AppFile>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<AppFile>>, List<AppFile>>,
              AsyncValue<List<AppFile>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
