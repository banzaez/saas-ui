import 'package:flutter/material.dart';
import 'package:saas_ui/src/core/network/models/user.dart';

extension WidgetExtension on Widget {
  /// Показывает элемент только для указанных ролей
  ///
  /// [roles] - список ролей, для которых будет показан элемент
  ///
  /// Возвращает элемент, если текущая роль пользователя содержится в списке [roles],
  /// иначе возвращает пустое пространство.
  ///
  Widget visibleFor({required UserRole? role, required List<UserRole> roles}) =>
    role != null && roles.contains(role) ? this : const SizedBox.shrink();

  /// НЕ показывает элемент только для указанных ролей
  ///
  /// [roles] - список ролей, для которых НЕ будет показан элемент
  ///
  /// Возвращает элемент, если текущая роль пользователя НЕ содержится в списке [roles],
  /// иначе возвращает пустое пространство.
  ///
  Widget invisibleFor({
    required UserRole? role,
    required List<UserRole> roles,
  }) => role != null && roles.contains(role) ? const SizedBox.shrink() : this;

  /// Показывает элемент только для админа
  Widget visibleForAdmin({required UserRole? role}) =>
      visibleFor(role: role, roles: [UserRole.admin]);

  /// Показывает элемент для support
  Widget visibleForSupport({required UserRole? role}) =>
      visibleFor(role: role, roles: [UserRole.admin, UserRole.support]);
}
