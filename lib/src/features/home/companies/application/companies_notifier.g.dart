// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Companies)
final companiesProvider = CompaniesProvider._();

final class CompaniesProvider
    extends $AsyncNotifierProvider<Companies, List<Company>> {
  CompaniesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companiesHash();

  @$internal
  @override
  Companies create() => Companies();
}

String _$companiesHash() => r'726081f71c8ca5c30a2fccc33db98d78ac5a9581';

abstract class _$Companies extends $AsyncNotifier<List<Company>> {
  FutureOr<List<Company>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Company>>, List<Company>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Company>>, List<Company>>,
              AsyncValue<List<Company>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
