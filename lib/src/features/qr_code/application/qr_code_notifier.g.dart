// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(QrCodeFlow)
final qrCodeFlowProvider = QrCodeFlowFamily._();

final class QrCodeFlowProvider
    extends $NotifierProvider<QrCodeFlow, QrCodeUiState> {
  QrCodeFlowProvider._({
    required QrCodeFlowFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'qrCodeFlowProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$qrCodeFlowHash();

  @override
  String toString() {
    return r'qrCodeFlowProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QrCodeFlow create() => QrCodeFlow();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QrCodeUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QrCodeUiState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QrCodeFlowProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$qrCodeFlowHash() => r'5dd6f742575bc3e1ff2597021eafb0800897816d';

final class QrCodeFlowFamily extends $Family
    with
        $ClassFamilyOverride<
          QrCodeFlow,
          QrCodeUiState,
          QrCodeUiState,
          QrCodeUiState,
          int
        > {
  QrCodeFlowFamily._()
    : super(
        retry: null,
        name: r'qrCodeFlowProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  QrCodeFlowProvider call(int paymentId) =>
      QrCodeFlowProvider._(argument: paymentId, from: this);

  @override
  String toString() => r'qrCodeFlowProvider';
}

abstract class _$QrCodeFlow extends $Notifier<QrCodeUiState> {
  late final _$args = ref.$arg as int;
  int get paymentId => _$args;

  QrCodeUiState build(int paymentId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<QrCodeUiState, QrCodeUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QrCodeUiState, QrCodeUiState>,
              QrCodeUiState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
