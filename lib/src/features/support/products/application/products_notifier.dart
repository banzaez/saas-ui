import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/base/notifiers/async_crud_notifier.dart';
import 'package:saas_ui/src/core/base/notifiers/async_read_only_notifier.dart';
import 'package:saas_ui/src/core/models/controller/app_table_source_mixin.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/repository/products_repository.dart';
import 'package:saas_ui/src/features/support/products/application/settings/product_settings.dart';

part 'products_notifier.g.dart';

@riverpod
class Products extends _$Products
    with
        AsyncReadOnlyNotifierMixin<Product, int, ProductSettings>,
        AsyncCrudNotifierMixin<Product, int, ProductSettings>,
        AppTableSourceMixin<Product, ProductSettings> {
  ProductSettings _settings = ProductSettings();
  @override
  ProductSettings get settings => _settings;
  @override
  set settings(ProductSettings value) => _settings = value;

  @override
  ProductsRepository get repository => ref.read(productsRepositoryProvider);

  @override
  FutureOr<List<Product>> build() => reloadItems();

  @override
  Product createNewInstance() => const Product();

  Future<void> setActiveOnly(bool value) =>
      applyFilter(() => settings.filter.activeOnly = value);
}
