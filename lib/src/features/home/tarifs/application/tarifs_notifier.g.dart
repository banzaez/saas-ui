// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarifs_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tarifs)
final tarifsProvider = TarifsProvider._();

final class TarifsProvider extends $AsyncNotifierProvider<Tarifs, TarifsData> {
  TarifsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tarifsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tarifsHash();

  @$internal
  @override
  Tarifs create() => Tarifs();
}

String _$tarifsHash() => r'90c9b6c3e3be283ee6d6c4177d081200dc901a6a';

abstract class _$Tarifs extends $AsyncNotifier<TarifsData> {
  FutureOr<TarifsData> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TarifsData>, TarifsData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TarifsData>, TarifsData>,
              AsyncValue<TarifsData>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
