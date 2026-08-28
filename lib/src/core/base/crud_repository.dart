import 'package:saas_ui/src/core/base/base_repository.dart';

/// Миксин для операций чтения данных.
///
/// Предоставляет стандартные методы для получения одного элемента и списка.
/// Используется в связке с [BaseRepository].
///
/// - [T] — тип модели
/// - [ID] — тип идентификатора
/// - [F] — тип настроек/фильтра
mixin ReadRepositoryMixin<T, ID, F> on BaseRepository {
  /// Возвращает один элемент по его идентификатору.
  Future<RequestResult<T>> getById(ID id);

  /// Возвращает список всех элементов с учётом переданных [filter] настроек.
  Future<RequestResult<List<T>>> listAll([F? filter]);
}

/// Миксин для операций записи данных.
///
/// Предоставляет стандартные методы для создания, обновления и удаления.
/// Используется в связке с [BaseRepository].
///
/// - [T] — тип модели
/// - [ID] — тип идентификатора
mixin WriteRepositoryMixin<T, ID> on BaseRepository {
  /// Создаёт новый элемент на сервере.
  Future<RequestResult<T>> create(T item);

  /// Обновляет существующий элемент.
  Future<RequestResult<T>> update(ID id, T item);

  /// Удаляет элемент.
  Future<RequestResult<void>> delete(ID id);
}

/// Базовый класс для репозиториев только для чтения.
/// Комбинирует [BaseRepository] и функционал чтения.
abstract class ReadOnlyRepository<T, ID, F> extends BaseRepository
    with ReadRepositoryMixin<T, ID, F> {
  ReadOnlyRepository(super.serverApi);
}

/// Базовый класс для полных CRUD-репозиториев.
/// Комбинирует операции чтения и записи через миксины.
abstract class CrudRepository<T, ID, F> extends ReadOnlyRepository<T, ID, F>
    with WriteRepositoryMixin<T, ID> {
  CrudRepository(super.serverApi);
}
