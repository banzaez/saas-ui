// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoicesPanel)
final invoicesPanelProvider = InvoicesPanelProvider._();

final class InvoicesPanelProvider
    extends $NotifierProvider<InvoicesPanel, Invoice?> {
  InvoicesPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'invoicesPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoicesPanelHash();

  @$internal
  @override
  InvoicesPanel create() => InvoicesPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Invoice? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Invoice?>(value),
    );
  }
}

String _$invoicesPanelHash() => r'61d20a842a3d37256bdf1ff36acff3d7b6215a5e';

abstract class _$InvoicesPanel extends $Notifier<Invoice?> {
  Invoice? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Invoice?, Invoice?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Invoice?, Invoice?>,
              Invoice?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
