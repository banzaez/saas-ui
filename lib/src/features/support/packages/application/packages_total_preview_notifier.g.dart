// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_total_preview_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PackagesTotalPreview)
final packagesTotalPreviewProvider = PackagesTotalPreviewProvider._();

final class PackagesTotalPreviewProvider
    extends $NotifierProvider<PackagesTotalPreview, AsyncValue<double>> {
  PackagesTotalPreviewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'packagesTotalPreviewProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$packagesTotalPreviewHash();

  @$internal
  @override
  PackagesTotalPreview create() => PackagesTotalPreview();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<double>>(value),
    );
  }
}

String _$packagesTotalPreviewHash() =>
    r'49de9510ec2086fbad35d3f438def6de7309bcb7';

abstract class _$PackagesTotalPreview extends $Notifier<AsyncValue<double>> {
  AsyncValue<double> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<double>, AsyncValue<double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<double>, AsyncValue<double>>,
              AsyncValue<double>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
