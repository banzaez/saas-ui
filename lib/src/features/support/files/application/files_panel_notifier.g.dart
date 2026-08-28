// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FilesPanel)
final filesPanelProvider = FilesPanelProvider._();

final class FilesPanelProvider extends $NotifierProvider<FilesPanel, AppFile?> {
  FilesPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filesPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filesPanelHash();

  @$internal
  @override
  FilesPanel create() => FilesPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppFile? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppFile?>(value),
    );
  }
}

String _$filesPanelHash() => r'dbd526919b56c1b619f1adb1546a67c158088249';

abstract class _$FilesPanel extends $Notifier<AppFile?> {
  AppFile? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AppFile?, AppFile?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppFile?, AppFile?>,
              AppFile?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
