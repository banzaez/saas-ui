// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogsPanel)
final logsPanelProvider = LogsPanelProvider._();

final class LogsPanelProvider
    extends $NotifierProvider<LogsPanel, AsyncValue<Log?>> {
  LogsPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logsPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logsPanelHash();

  @$internal
  @override
  LogsPanel create() => LogsPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Log?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Log?>>(value),
    );
  }
}

String _$logsPanelHash() => r'd349beddf9fe4aa6576ac1345fe3a185e1099909';

abstract class _$LogsPanel extends $Notifier<AsyncValue<Log?>> {
  AsyncValue<Log?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Log?>, AsyncValue<Log?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Log?>, AsyncValue<Log?>>,
              AsyncValue<Log?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
