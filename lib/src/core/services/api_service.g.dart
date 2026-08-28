// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
final dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'744cb70a62a9a26ca3f677943d239fede8d5df8f';

@ProviderFor(serverApi)
final serverApiProvider = ServerApiProvider._();

final class ServerApiProvider
    extends $FunctionalProvider<ServerApi, ServerApi, ServerApi>
    with $Provider<ServerApi> {
  ServerApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverApiHash();

  @$internal
  @override
  $ProviderElement<ServerApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerApi create(Ref ref) {
    return serverApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerApi>(value),
    );
  }
}

String _$serverApiHash() => r'6a3e8044fdc90bac3df4d9d2ef45870047607c99';
