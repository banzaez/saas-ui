// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppTableNotifier)
final appTableProvider = AppTableNotifierFamily._();

final class AppTableNotifierProvider<T>
    extends $NotifierProvider<AppTableNotifier<T>, TableState<T>> {
  AppTableNotifierProvider._({
    required AppTableNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'appTableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$appTableNotifierHash();

  @override
  String toString() {
    return r'appTableProvider'
        '<${T}>'
        '($argument)';
  }

  @$internal
  @override
  AppTableNotifier<T> create() => AppTableNotifier<T>();

  $R _captureGenerics<$R>($R Function<T>() cb) {
    return cb<T>();
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TableState<T> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TableState<T>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AppTableNotifierProvider &&
        other.runtimeType == runtimeType &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, argument);
  }
}

String _$appTableNotifierHash() => r'cebb4dfbbe400986c2c57db1b77758e4d1eb0f32';

final class AppTableNotifierFamily extends $Family {
  AppTableNotifierFamily._()
    : super(
        retry: null,
        name: r'appTableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AppTableNotifierProvider<T> call<T>(String tag) =>
      AppTableNotifierProvider<T>._(argument: tag, from: this);

  @override
  String toString() => r'appTableProvider';

  /// {@macro riverpod.override_with}
  Override overrideWith(AppTableNotifier<T> Function<T>() create) =>
      $FamilyOverride(
        from: this,
        createElement: (pointer) {
          final provider = pointer.origin as AppTableNotifierProvider;
          return provider._captureGenerics(<T>() {
            provider as AppTableNotifierProvider<T>;
            return provider.$view(create: create<T>).$createElement(pointer);
          });
        },
      );

  /// {@macro riverpod.override_with_build}
  Override overrideWithBuild(
    TableState<T> Function<T>(Ref ref, AppTableNotifier<T> notifier) build,
  ) => $FamilyOverride(
    from: this,
    createElement: (pointer) {
      final provider = pointer.origin as AppTableNotifierProvider;
      return provider._captureGenerics(<T>() {
        provider as AppTableNotifierProvider<T>;
        return provider
            .$view(runNotifierBuildOverride: build<T>)
            .$createElement(pointer);
      });
    },
  );
}

abstract class _$AppTableNotifier<T> extends $Notifier<TableState<T>> {
  late final _$args = ref.$arg as String;
  String get tag => _$args;

  TableState<T> build(String tag);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TableState<T>, TableState<T>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TableState<T>, TableState<T>>,
              TableState<T>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
