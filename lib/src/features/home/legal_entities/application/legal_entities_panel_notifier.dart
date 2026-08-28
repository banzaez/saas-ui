import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_notifier.dart';

part 'legal_entities_panel_notifier.g.dart';

@riverpod
class LegalEntitiesPanel extends _$LegalEntitiesPanel
    with PanelActions<LegalEntity> {
  @override
  LegalEntity? build() => null;

  void openCreate() {
    state = ref.read(legalEntitiesProvider.notifier).createNewInstance();
  }
}
