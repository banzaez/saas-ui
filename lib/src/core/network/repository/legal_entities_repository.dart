import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/settings/legal_entity_settings.dart';

part 'legal_entities_repository.g.dart';

@Riverpod(keepAlive: true)
LegalEntitiesRepository legalEntitiesRepository(Ref ref) =>
    LegalEntitiesRepository(ref.watch(serverApiProvider));

class LegalEntitiesRepository
    extends CrudRepository<LegalEntity, int, LegalEntitySettings> {
  LegalEntitiesRepository(super.api);
  @override
  Future<RequestResult<LegalEntity>> create(LegalEntity legalEntity) =>
      sendRequest<LegalEntity>(() => api.createLegalEntity(legalEntity));

  @override
  Future<RequestResult<List<LegalEntity>>> listAll([
    LegalEntitySettings? filter,
  ]) => sendRequest<List<LegalEntity>>(
    () => api.getLegalEntities(filter?.offset, filter?.limit),
  );

  @override
  Future<RequestResult<LegalEntity>> getById(int id) =>
      sendRequest<LegalEntity>(() => api.getLegalEntity(id));

  @override
  Future<RequestResult<LegalEntity>> update(int id, LegalEntity legalEntity) =>
      sendRequest<LegalEntity>(() => api.updateLegalEntity(id, legalEntity));

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteLegalEntity(id));

  Future<RequestResult<List<LegalEntity>>> listSellersOnly({
    dynamic param1,
    dynamic param2,
  }) => sendRequest<List<LegalEntity>>(() => api.getLegalEntitiesSellersOnly());
}
