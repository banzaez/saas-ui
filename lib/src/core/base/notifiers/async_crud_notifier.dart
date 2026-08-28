import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/base_model.dart';
import '../../models/base_list_settings.dart';
import '../crud_repository.dart';
import 'async_read_only_notifier.dart';

/// Базовый миксин для CRUD операций в Riverpod.
mixin AsyncCrudNotifierMixin<
  T extends BaseModel,
  ID,
  S extends BaseListSettings<T, S>
>
    on AsyncReadOnlyNotifierMixin<T, ID, S> {
  @override
  CrudRepository<T, ID, S> get repository;

  /// Фабричный метод для создания нового пустого экземпляра модели.
  T createNewInstance();

  /// Сохранение элемента (создание или обновление).
  ///
  /// Не переводит список в [AsyncLoading]: уже загруженные строки остаются на
  /// экране до завершения запроса и [reloadItems]. При ошибке API, если список
  /// уже был в [AsyncData], состояние сохраняется (ошибку обрабатывает вызывающий
  /// код по [null] и при необходимости snackbar / диалог).
  Future<T?> saveItem(T item) async {
    final previous = state;

    final response = (item.id == null || item.id == -1)
        ? await repository.create(item)
        : await repository.update(item.id as ID, item);

    if (!ref.mounted) return null;

    if (response.isSuccess) {
      final newList = await reloadItems();
      if (!ref.mounted) return null;
      state = AsyncData(newList);
      return response.result;
    } else {
      final existing = previous.value;
      state = existing != null
          ? AsyncData(List<T>.from(existing))
          : AsyncError(response.errorString, StackTrace.current);
      return null;
    }
  }

  /// Удаление элемента по ID.
  ///
  /// См. [saveItem] — список не уходит в глобальный loading, при ошибке с
  /// уже показанными данными список не затирается.
  Future<bool> deleteItem(ID id) async {
    final previous = state;

    final response = await repository.delete(id);

    if (!ref.mounted) return false;

    if (response.isSuccess) {
      final newList = await reloadItems();
      if (!ref.mounted) return false;
      state = AsyncData(newList);
      return true;
    } else {
      final existing = previous.value;
      state = existing != null
          ? AsyncData(List<T>.from(existing))
          : AsyncError(response.errorString, StackTrace.current);
      return false;
    }
  }
}
