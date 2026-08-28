import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/response/user_token.dart';
import 'package:saas_ui/src/core/services/shared_preferences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'token_service.g.dart';

/// Сервис для работы с токенами авторизации.
/// Отвечает за сохранение, восстановление и удаление токенов.
@Riverpod(keepAlive: true)
class TokenService extends _$TokenService {
  static const String _tokenKey = 'token';
  static const String _typeKey = 'type';

  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  UserToken? build() {
    final token = _prefs.getString(_tokenKey);
    final type = _prefs.getString(_typeKey);

    if (token != null && type != null) {
      return UserToken(token: token, type: type);
    }
    return null;
  }

  /// Сохранение токена в хранилище и обновление состояния.
  Future<void> save(UserToken? token) async {
    if (token == null) {
      await Future.wait([_prefs.remove(_tokenKey), _prefs.remove(_typeKey)]);
    } else {
      await Future.wait([
        _prefs.setString(_tokenKey, token.token),
        _prefs.setString(_typeKey, token.type),
      ]);
    }

    state = token;
  }

  /// Очистка токена (логаут).
  Future<void> clear() => save(null);
}
