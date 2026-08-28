// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Statistics)
final statisticsProvider = StatisticsProvider._();

final class StatisticsProvider
    extends $AsyncNotifierProvider<Statistics, List<Statistic>> {
  StatisticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statisticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statisticsHash();

  @$internal
  @override
  Statistics create() => Statistics();
}

String _$statisticsHash() => r'9115a72e52e76951142f269277b5d6a0944cc994';

abstract class _$Statistics extends $AsyncNotifier<List<Statistic>> {
  FutureOr<List<Statistic>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Statistic>>, List<Statistic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Statistic>>, List<Statistic>>,
              AsyncValue<List<Statistic>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
