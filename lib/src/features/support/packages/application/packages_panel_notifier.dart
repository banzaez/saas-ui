import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_notifier.dart';
import 'package:saas_ui/src/features/support/packages/application/packages_total_preview_notifier.dart';

part 'packages_panel_notifier.g.dart';

@riverpod
class PackagesPanel extends _$PackagesPanel with PanelActions<ProductOffer> {
  @override
  ProductOffer? build() => null;

  void openCreate() {
    final draft = ref.read(packagesProvider.notifier).createNewInstance();
    state = draft;
    ref.read(packagesTotalPreviewProvider.notifier).recompute(draft);
  }

  @override
  void open(ProductOffer item) {
    super.open(item);
    ref.read(packagesTotalPreviewProvider.notifier).recompute(item);
  }
}
