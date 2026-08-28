// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Payments)
final paymentsProvider = PaymentsProvider._();

final class PaymentsProvider
    extends $AsyncNotifierProvider<Payments, List<Payment>> {
  PaymentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentsHash();

  @$internal
  @override
  Payments create() => Payments();
}

String _$paymentsHash() => r'f39eb914bed297351cf49cc8bb04e482e46c47c7';

abstract class _$Payments extends $AsyncNotifier<List<Payment>> {
  FutureOr<List<Payment>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Payment>>, List<Payment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Payment>>, List<Payment>>,
              AsyncValue<List<Payment>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
