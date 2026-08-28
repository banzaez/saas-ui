import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';

part 'packages_total_preview_notifier.g.dart';

@Riverpod(keepAlive: true)
class PackagesTotalPreview extends _$PackagesTotalPreview {
  @override
  AsyncValue<double> build() => const AsyncData(0);

  Future<void> recompute(ProductOffer item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .read(productOffersRepositoryProvider)
          .calcTotalSum(item);
      return response.result?.totalSum ?? 0;
    });
  }
}
