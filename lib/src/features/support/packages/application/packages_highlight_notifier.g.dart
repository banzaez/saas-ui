// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_highlight_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PackagesHighlight)
final packagesHighlightProvider = PackagesHighlightProvider._();

final class PackagesHighlightProvider
    extends $NotifierProvider<PackagesHighlight, Map<String, HighlightLevel>> {
  PackagesHighlightProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packagesHighlightProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packagesHighlightHash();

  @$internal
  @override
  PackagesHighlight create() => PackagesHighlight();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, HighlightLevel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, HighlightLevel>>(value),
    );
  }
}

String _$packagesHighlightHash() => r'42f6684b39d1b06fac6e10ab7488f7fdf53bd5a4';

abstract class _$PackagesHighlight
    extends $Notifier<Map<String, HighlightLevel>> {
  Map<String, HighlightLevel> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<Map<String, HighlightLevel>, Map<String, HighlightLevel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, HighlightLevel>,
                Map<String, HighlightLevel>
              >,
              Map<String, HighlightLevel>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
