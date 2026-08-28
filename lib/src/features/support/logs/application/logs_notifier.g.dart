// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logsFilterProducts)
final logsFilterProductsProvider = LogsFilterProductsProvider._();

final class LogsFilterProductsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Product>>,
          List<Product>,
          FutureOr<List<Product>>
        >
    with $FutureModifier<List<Product>>, $FutureProvider<List<Product>> {
  LogsFilterProductsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsFilterProductsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsFilterProductsHash();

  @$internal
  @override
  $FutureProviderElement<List<Product>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Product>> create(Ref ref) {
    return logsFilterProducts(ref);
  }
}

String _$logsFilterProductsHash() =>
    r'8043f6ab6d93f338ccf90819625e1dd1c307218f';

@ProviderFor(logsFilterCertificates)
final logsFilterCertificatesProvider = LogsFilterCertificatesProvider._();

final class LogsFilterCertificatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Certificate>>,
          List<Certificate>,
          FutureOr<List<Certificate>>
        >
    with
        $FutureModifier<List<Certificate>>,
        $FutureProvider<List<Certificate>> {
  LogsFilterCertificatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsFilterCertificatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsFilterCertificatesHash();

  @$internal
  @override
  $FutureProviderElement<List<Certificate>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Certificate>> create(Ref ref) {
    return logsFilterCertificates(ref);
  }
}

String _$logsFilterCertificatesHash() =>
    r'1963e2a228fd9097be8e1bc842789bbb0fba5121';

@ProviderFor(logsFilterRequestPaths)
final logsFilterRequestPathsProvider = LogsFilterRequestPathsProvider._();

final class LogsFilterRequestPathsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  LogsFilterRequestPathsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsFilterRequestPathsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsFilterRequestPathsHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return logsFilterRequestPaths(ref);
  }
}

String _$logsFilterRequestPathsHash() =>
    r'bb08cdfd807983deb813ffc1aab52916bb63966c';

@ProviderFor(Logs)
final logsProvider = LogsProvider._();

final class LogsProvider extends $AsyncNotifierProvider<Logs, List<Log>> {
  LogsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsHash();

  @$internal
  @override
  Logs create() => Logs();
}

String _$logsHash() => r'dc698eef800afbeab6439dbecfee775dc86b8922';

abstract class _$Logs extends $AsyncNotifier<List<Log>> {
  FutureOr<List<Log>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Log>>, List<Log>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Log>>, List<Log>>,
              AsyncValue<List<Log>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
