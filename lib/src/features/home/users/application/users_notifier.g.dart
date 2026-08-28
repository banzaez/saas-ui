// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Users)
final usersProvider = UsersProvider._();

final class UsersProvider extends $AsyncNotifierProvider<Users, List<User>> {
  UsersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersHash();

  @$internal
  @override
  Users create() => Users();
}

String _$usersHash() => r'ed91ec1c9b03f39e2861db92e457e58391243ed3';

abstract class _$Users extends $AsyncNotifier<List<User>> {
  FutureOr<List<User>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<User>>, List<User>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<User>>, List<User>>,
              AsyncValue<List<User>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
