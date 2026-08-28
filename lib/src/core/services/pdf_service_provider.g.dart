// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pdfService)
final pdfServiceProvider = PdfServiceProvider._();

final class PdfServiceProvider
    extends $FunctionalProvider<PdfService, PdfService, PdfService>
    with $Provider<PdfService> {
  PdfServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pdfServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pdfServiceHash();

  @$internal
  @override
  $ProviderElement<PdfService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PdfService create(Ref ref) {
    return pdfService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PdfService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PdfService>(value),
    );
  }
}

String _$pdfServiceHash() => r'225b76e1a1ef6f2b05fac940bc1f434c117e5a88';
