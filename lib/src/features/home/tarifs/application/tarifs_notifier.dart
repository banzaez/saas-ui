import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/core/network/repository/products_repository.dart';
import 'package:saas_ui/src/features/support/packages/application/settings/product_offer_settings.dart';
import 'package:saas_ui/src/features/support/products/application/settings/product_settings.dart';

part 'tarifs_notifier.g.dart';

class TarifsData {
  const TarifsData({
    required this.products,
    required this.packages,
    this.selectedProduct,
  });

  final List<Product> products;
  final List<ProductOffer> packages;
  final Product? selectedProduct;

  List<ProductOffer> get packagesForSelectedProduct =>
      packages.where((p) => p.productId == selectedProduct?.id).toList();

  TarifsData copyWith({
    List<Product>? products,
    List<ProductOffer>? packages,
    Product? selectedProduct,
  }) => TarifsData(
    products: products ?? this.products,
    packages: packages ?? this.packages,
    selectedProduct: selectedProduct ?? this.selectedProduct,
  );
}

@riverpod
class Tarifs extends _$Tarifs {
  ProductsRepository get _productsRepo => ref.read(productsRepositoryProvider);
  ProductOffersRepository get _offersRepo =>
      ref.read(productOffersRepositoryProvider);

  @override
  FutureOr<TarifsData> build() async {
    final productsRes = await _productsRepo.listAll(
      ProductSettings(activeOnly: true),
    );
    final packagesRes = await _offersRepo.listAll(
      ProductOfferSettings(activeOnly: true),
    );

    final products = productsRes.result ?? [];
    final packages = List<ProductOffer>.from(packagesRes.result ?? [])
      ..sort((a, b) => a.price.compareTo(b.price));

    return TarifsData(
      products: products,
      packages: packages,
      selectedProduct: products.isNotEmpty ? products.first : null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final productsRepo = ref.read(productsRepositoryProvider);
      final offersRepo = ref.read(productOffersRepositoryProvider);
      final productsRes = await productsRepo.listAll(
        ProductSettings(activeOnly: true),
      );
      final packagesRes = await offersRepo.listAll(
        ProductOfferSettings(activeOnly: true),
      );
      final products = productsRes.result ?? [];
      final packages = List<ProductOffer>.from(packagesRes.result ?? [])
        ..sort((a, b) => a.price.compareTo(b.price));
      final prev = state.value;
      final selected =
          prev?.selectedProduct != null &&
              products.any((p) => p.id == prev!.selectedProduct!.id)
          ? prev!.selectedProduct
          : (products.isNotEmpty ? products.first : null);
      return TarifsData(
        products: products,
        packages: packages,
        selectedProduct: selected,
      );
    });
  }

  void selectProduct(Product? product) {
    final v = state.value;
    if (v == null) return;
    state = AsyncData(
      TarifsData(
        products: v.products,
        packages: v.packages,
        selectedProduct: product,
      ),
    );
  }
}
