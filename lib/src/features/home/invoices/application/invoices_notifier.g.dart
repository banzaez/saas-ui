// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Invoices)
final invoicesProvider = InvoicesProvider._();

final class InvoicesProvider
    extends $AsyncNotifierProvider<Invoices, List<Invoice>> {
  InvoicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'invoicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoicesHash();

  @$internal
  @override
  Invoices create() => Invoices();
}

String _$invoicesHash() => r'07e04630cb371749376293b756f70ea1dc2acf90';

abstract class _$Invoices extends $AsyncNotifier<List<Invoice>> {
  FutureOr<List<Invoice>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Invoice>>, List<Invoice>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Invoice>>, List<Invoice>>,
              AsyncValue<List<Invoice>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
