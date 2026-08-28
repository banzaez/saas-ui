// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PaymentsPanel)
final paymentsPanelProvider = PaymentsPanelProvider._();

final class PaymentsPanelProvider
    extends $NotifierProvider<PaymentsPanel, Payment?> {
  PaymentsPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentsPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentsPanelHash();

  @$internal
  @override
  PaymentsPanel create() => PaymentsPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Payment? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Payment?>(value),
    );
  }
}

String _$paymentsPanelHash() => r'2eb22bfa6cd8aba10111d47963c09310e9359160';

abstract class _$PaymentsPanel extends $Notifier<Payment?> {
  Payment? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Payment?, Payment?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Payment?, Payment?>,
              Payment?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
