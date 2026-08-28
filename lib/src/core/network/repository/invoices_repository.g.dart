// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(invoicesRepository)
final invoicesRepositoryProvider = InvoicesRepositoryProvider._();

final class InvoicesRepositoryProvider
    extends
        $FunctionalProvider<
          InvoicesRepository,
          InvoicesRepository,
          InvoicesRepository
        >
    with $Provider<InvoicesRepository> {
  InvoicesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'invoicesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoicesRepositoryHash();

  @$internal
  @override
  $ProviderElement<InvoicesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InvoicesRepository create(Ref ref) {
    return invoicesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoicesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoicesRepository>(value),
    );
  }
}

String _$invoicesRepositoryHash() =>
    r'3e060f070ec2b3183adafb983cc06677175bfe11';
