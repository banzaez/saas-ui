// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_entities_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LegalEntitiesPanel)
final legalEntitiesPanelProvider = LegalEntitiesPanelProvider._();

final class LegalEntitiesPanelProvider
    extends $NotifierProvider<LegalEntitiesPanel, LegalEntity?> {
  LegalEntitiesPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'legalEntitiesPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$legalEntitiesPanelHash();

  @$internal
  @override
  LegalEntitiesPanel create() => LegalEntitiesPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LegalEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LegalEntity?>(value),
    );
  }
}

String _$legalEntitiesPanelHash() =>
    r'eec684ed32d38e9256c0c37e324e10b13724be70';

abstract class _$LegalEntitiesPanel extends $Notifier<LegalEntity?> {
  LegalEntity? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LegalEntity?, LegalEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LegalEntity?, LegalEntity?>,
              LegalEntity?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
