// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(certificatesRepository)
final certificatesRepositoryProvider = CertificatesRepositoryProvider._();

final class CertificatesRepositoryProvider
    extends
        $FunctionalProvider<
          CertificatesRepository,
          CertificatesRepository,
          CertificatesRepository
        >
    with $Provider<CertificatesRepository> {
  CertificatesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'certificatesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$certificatesRepositoryHash();

  @$internal
  @override
  $ProviderElement<CertificatesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CertificatesRepository create(Ref ref) {
    return certificatesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CertificatesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CertificatesRepository>(value),
    );
  }
}

String _$certificatesRepositoryHash() =>
    r'f9d168f8b4370f1eb66afc364a2fd049f56c6762';
