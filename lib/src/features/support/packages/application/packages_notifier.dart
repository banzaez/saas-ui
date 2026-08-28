import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_crud_notifier.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/features/support/packages/application/settings/product_offer_settings.dart';

part 'packages_notifier.g.dart';

@riverpod
class Packages extends _$Packages
    with
        AsyncReadOnlyNotifierMixin<ProductOffer, int, ProductOfferSettings>,
        AsyncCrudNotifierMixin<ProductOffer, int, ProductOfferSettings>,
        AppTableSourceMixin<ProductOffer, ProductOfferSettings> {
  ProductOfferSettings _settings = ProductOfferSettings();
  @override
  ProductOfferSettings get settings => _settings;
  @override
  set settings(ProductOfferSettings value) => _settings = value;

  @override
  ProductOffersRepository get repository =>
      ref.read(productOffersRepositoryProvider);

  @override
  FutureOr<List<ProductOffer>> build() => reloadItems();

  @override
  ProductOffer createNewInstance() => const ProductOffer();

  Future<void> setActiveOnly(bool value) =>
      applyFilter(() => settings.filter.activeOnly = value);

  void notifyItemsChanged() {
    notifyTableSourceChanged();
  }
}
