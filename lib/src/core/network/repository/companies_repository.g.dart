// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(companiesRepository)
final companiesRepositoryProvider = CompaniesRepositoryProvider._();

final class CompaniesRepositoryProvider
    extends
        $FunctionalProvider<
          CompaniesRepository,
          CompaniesRepository,
          CompaniesRepository
        >
    with $Provider<CompaniesRepository> {
  CompaniesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companiesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companiesRepositoryHash();

  @$internal
  @override
  $ProviderElement<CompaniesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompaniesRepository create(Ref ref) {
    return companiesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompaniesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompaniesRepository>(value),
    );
  }
}

String _$companiesRepositoryHash() =>
    r'c47928efafbc3f34f8eb5ec4b57722bf0fd62116';
