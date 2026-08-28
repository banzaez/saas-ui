// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Auth)
final authProvider = AuthProvider._();

final class AuthProvider extends $AsyncNotifierProvider<Auth, AuthUiState> {
  AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  Auth create() => Auth();
}

String _$authHash() => r'18fe71d66a2cc44eaf8aed28e4107b3f2da5ce29';

abstract class _$Auth extends $AsyncNotifier<AuthUiState> {
  FutureOr<AuthUiState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthUiState>, AuthUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthUiState>, AuthUiState>,
              AsyncValue<AuthUiState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
