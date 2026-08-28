// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeService)
final themeServiceProvider = ThemeServiceProvider._();

final class ThemeServiceProvider
    extends $NotifierProvider<ThemeService, ThemeMode> {
  ThemeServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeServiceHash();

  @$internal
  @override
  ThemeService create() => ThemeService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeServiceHash() => r'caa3bdf78a3111943230dbfe6587a2a75c27798f';

abstract class _$ThemeService extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
