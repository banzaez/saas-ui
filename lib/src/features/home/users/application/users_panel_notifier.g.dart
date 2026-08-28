// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_panel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UsersPanel)
final usersPanelProvider = UsersPanelProvider._();

final class UsersPanelProvider extends $NotifierProvider<UsersPanel, User?> {
  UsersPanelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersPanelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersPanelHash();

  @$internal
  @override
  UsersPanel create() => UsersPanel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(User? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<User?>(value),
    );
  }
}

String _$usersPanelHash() => r'd245c4d490d98b1a38a6e136c62373c56c8a34c2';

abstract class _$UsersPanel extends $Notifier<User?> {
  User? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<User?, User?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<User?, User?>,
              User?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
