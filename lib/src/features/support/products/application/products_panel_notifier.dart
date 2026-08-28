import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/panel_actions_mixin.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/features/support/products/application/products_notifier.dart';

part 'products_panel_notifier.g.dart';

@riverpod
class ProductsPanel extends _$ProductsPanel with PanelActions<Product> {
  @override
  Product? build() => null;

  void openCreate() {
    state = ref.read(productsProvider.notifier).createNewInstance();
  }
}
