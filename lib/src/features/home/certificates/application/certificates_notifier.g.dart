// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Реактивный провайдер списка сертификатов на базе Riverpod 3.x.

@ProviderFor(Certificates)
final certificatesProvider = CertificatesProvider._();

/// Реактивный провайдер списка сертификатов на базе Riverpod 3.x.
final class CertificatesProvider
    extends $AsyncNotifierProvider<Certificates, List<Certificate>> {
  /// Реактивный провайдер списка сертификатов на базе Riverpod 3.x.
  CertificatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'certificatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$certificatesHash();

  @$internal
  @override
  Certificates create() => Certificates();
}

String _$certificatesHash() => r'74bd79783c7aef575cc0d9182b21f77753d1d2ad';

/// Реактивный провайдер списка сертификатов на базе Riverpod 3.x.

abstract class _$Certificates extends $AsyncNotifier<List<Certificate>> {
  FutureOr<List<Certificate>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Certificate>>, List<Certificate>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Certificate>>, List<Certificate>>,
              AsyncValue<List<Certificate>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
