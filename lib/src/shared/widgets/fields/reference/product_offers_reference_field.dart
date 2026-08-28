import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/features/support/packages/application/settings/product_offer_settings.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/base/base_reference_widget.dart';

class ProductOffersReferenceField extends BaseReferenceWidget<ProductOffer> {
  const ProductOffersReferenceField({
    super.key,
    super.onChanged,
    super.enabled,
    super.initialValue,
    super.decoration,
    super.validator,
    super.showClearButton,
    this.productId,
  });

  final int? productId;

  @override
  Future<List<ProductOffer>> getItems(WidgetRef ref) async {
    final repo = ref.read(productOffersRepositoryProvider);
    final response = await repo.listAll(
      ProductOfferSettings(productId: productId),
    );
    return response.result ?? <ProductOffer>[];
  }
}
