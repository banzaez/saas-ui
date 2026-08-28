// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompaniesPanel)
final companiesPanelProvider = CompaniesPanelProvider._();

final class CompaniesPanelProvider
    extends $NotifierProvider<CompaniesPanel, Company?> {
  CompaniesPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companiesPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companiesPanelHash();

  @$internal
  @override
  CompaniesPanel create() => CompaniesPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Company? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Company?>(value),
    );
  }
}

String _$companiesPanelHash() => r'd9464923512f1894ad75665a77f8f373463f65d8';

abstract class _$CompaniesPanel extends $Notifier<Company?> {
  Company? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Company?, Company?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Company?, Company?>,
              Company?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
