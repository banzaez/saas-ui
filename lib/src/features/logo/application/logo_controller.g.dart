// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogoController)
final logoControllerProvider = LogoControllerProvider._();

final class LogoControllerProvider
    extends $NotifierProvider<LogoController, void> {
  LogoControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoControllerHash();

  @$internal
  @override
  LogoController create() => LogoController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$logoControllerHash() => r'db556cbc215cfc8a56088f49a4637ca336524517';

abstract class _$LogoController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
