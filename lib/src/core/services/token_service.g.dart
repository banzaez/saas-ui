// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Сервис для работы с токенами авторизации.
/// Отвечает за сохранение, восстановление и удаление токенов.

@ProviderFor(TokenService)
final tokenServiceProvider = TokenServiceProvider._();

/// Сервис для работы с токенами авторизации.
/// Отвечает за сохранение, восстановление и удаление токенов.
final class TokenServiceProvider
    extends $NotifierProvider<TokenService, UserToken?> {
  /// Сервис для работы с токенами авторизации.
  /// Отвечает за сохранение, восстановление и удаление токенов.
  TokenServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenServiceHash();

  @$internal
  @override
  TokenService create() => TokenService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserToken? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserToken?>(value),
    );
  }
}

String _$tokenServiceHash() => r'd73c5eaa3fed8d15d9a5fd986985884aae97077a';

/// Сервис для работы с токенами авторизации.
/// Отвечает за сохранение, восстановление и удаление токенов.

abstract class _$TokenService extends $Notifier<UserToken?> {
  UserToken? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<UserToken?, UserToken?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserToken?, UserToken?>,
              UserToken?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
