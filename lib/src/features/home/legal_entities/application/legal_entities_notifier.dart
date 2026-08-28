import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_crud_notifier.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/repository/legal_entities_repository.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/settings/legal_entity_settings.dart';

part 'legal_entities_notifier.g.dart';

@riverpod
class LegalEntities extends _$LegalEntities
    with
        AsyncReadOnlyNotifierMixin<LegalEntity, int, LegalEntitySettings>,
        AsyncCrudNotifierMixin<LegalEntity, int, LegalEntitySettings>,
        AppTableSourceMixin<LegalEntity, LegalEntitySettings> {
  LegalEntitySettings _settings = LegalEntitySettings();
  @override
  LegalEntitySettings get settings => _settings;
  @override
  set settings(LegalEntitySettings value) => _settings = value;

  @override
  LegalEntitiesRepository get repository =>
      ref.read(legalEntitiesRepositoryProvider);

  @override
  FutureOr<List<LegalEntity>> build() => reloadItems();

  @override
  LegalEntity createNewInstance() => const LegalEntity();
}
