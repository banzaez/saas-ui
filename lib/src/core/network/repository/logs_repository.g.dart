// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(logsRepository)
final logsRepositoryProvider = LogsRepositoryProvider._();

final class LogsRepositoryProvider
    extends $FunctionalProvider<LogsRepository, LogsRepository, LogsRepository>
    with $Provider<LogsRepository> {
  LogsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsRepositoryHash();

  @$internal
  @override
  $ProviderElement<LogsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogsRepository create(Ref ref) {
    return logsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogsRepository>(value),
    );
  }
}

String _$logsRepositoryHash() => r'eebcbeb8d179ad1f75321959602244b1b03e32fd';
