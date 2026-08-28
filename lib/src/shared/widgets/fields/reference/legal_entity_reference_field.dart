import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/repository/legal_entities_repository.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/legal_entities_panel_notifier.dart';
import 'package:saas_ui/src/features/home/legal_entities/application/settings/legal_entity_settings.dart';
import 'package:saas_ui/src/features/home/legal_entities/presentation/legal_entities_edit_panel.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/base/base_reference_widget.dart';

class LegalEntityReferenceField extends BaseReferenceWidget<LegalEntity> {
  const LegalEntityReferenceField({
    super.key,
    super.onChanged,
    super.initialValue,
    super.decoration,
    super.validator,
    this.sellersOnly = false,
  });

  final bool sellersOnly;

  @override
  Future<List<LegalEntity>> getItems(WidgetRef ref) async {
    final repo = ref.read(legalEntitiesRepositoryProvider);
    final response = sellersOnly
        ? await repo.listSellersOnly()
        : await repo.listAll(LegalEntitySettings()..loadAll());
    return response.result ?? <LegalEntity>[];
  }

  @override
  bool get supportsCreate => true;

  @override
  Widget buildEditPanel(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(legalEntitiesPanelProvider.notifier).openCreate();
        });
        return LegalEntitiesEditPanel(
          onAfterSave: (LegalEntity? item) {
            if (context.mounted) context.pop(item);
          },
          onAfterCancel: () {
            if (context.mounted) context.pop(null);
          },
        );
      },
    );
  }
}
