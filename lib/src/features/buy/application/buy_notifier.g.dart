// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BuyFlow)
final buyFlowProvider = BuyFlowFamily._();

final class BuyFlowProvider
    extends $AsyncNotifierProvider<BuyFlow, BuySession?> {
  BuyFlowProvider._({
    required BuyFlowFamily super.from,
    required BuyRouteArgs super.argument,
  }) : super(
         retry: null,
         name: r'buyFlowProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$buyFlowHash();

  @override
  String toString() {
    return r'buyFlowProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BuyFlow create() => BuyFlow();

  @override
  bool operator ==(Object other) {
    return other is BuyFlowProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$buyFlowHash() => r'aa58095b6c77598548b28774e2b2510741bae801';

final class BuyFlowFamily extends $Family
    with
        $ClassFamilyOverride<
          BuyFlow,
          AsyncValue<BuySession?>,
          BuySession?,
          FutureOr<BuySession?>,
          BuyRouteArgs
        > {
  BuyFlowFamily._()
    : super(
        retry: null,
        name: r'buyFlowProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BuyFlowProvider call(BuyRouteArgs routeArgs) =>
      BuyFlowProvider._(argument: routeArgs, from: this);

  @override
  String toString() => r'buyFlowProvider';
}

abstract class _$BuyFlow extends $AsyncNotifier<BuySession?> {
  late final _$args = ref.$arg as BuyRouteArgs;
  BuyRouteArgs get routeArgs => _$args;

  FutureOr<BuySession?> build(BuyRouteArgs routeArgs);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<BuySession?>, BuySession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BuySession?>, BuySession?>,
              AsyncValue<BuySession?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
