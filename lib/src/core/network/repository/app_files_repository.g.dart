// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_files_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appFilesRepository)
final appFilesRepositoryProvider = AppFilesRepositoryProvider._();

final class AppFilesRepositoryProvider
    extends
        $FunctionalProvider<
          AppFilesRepository,
          AppFilesRepository,
          AppFilesRepository
        >
    with $Provider<AppFilesRepository> {
  AppFilesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appFilesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appFilesRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppFilesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppFilesRepository create(Ref ref) {
    return appFilesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppFilesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppFilesRepository>(value),
    );
  }
}

String _$appFilesRepositoryHash() =>
    r'8bbe69edc7ff7bff92de8a2bd3f38c928457213b';
