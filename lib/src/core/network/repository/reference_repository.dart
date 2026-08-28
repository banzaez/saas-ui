import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/models/legal_entity.dart';
import 'package:saas_ui/src/core/network/models/product_offer.dart';
import 'package:saas_ui/src/core/network/models/product.dart';
import 'package:saas_ui/src/core/network/repository/companies_repository.dart';
import 'package:saas_ui/src/core/network/repository/legal_entities_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/core/network/repository/product_offers_repository.dart';
import 'package:saas_ui/src/core/network/repository/products_repository.dart';

part 'reference_repository.g.dart';

@Riverpod(keepAlive: true)
ReferenceRepository referenceRepository(Ref ref) => ReferenceRepository(
  ref.watch(companiesRepositoryProvider),
  ref.watch(legalEntitiesRepositoryProvider),
  ref.watch(productsRepositoryProvider),
  ref.watch(productOffersRepositoryProvider),
);

class ReferenceRepository {
  final CompaniesRepository _companiesRepository;
  final LegalEntitiesRepository _legalEntitiesRepository;
  final ProductsRepository _productsRepository;
  final ProductOffersRepository _packagesRepository;

  ReferenceRepository(
    this._companiesRepository,
    this._legalEntitiesRepository,
    this._productsRepository,
    this._packagesRepository,
  );

  Future<RequestResult<List<Company>>> listCompanies() async =>
      await _companiesRepository.listAll();

  Future<RequestResult<List<LegalEntity>>> listLegalEntities() async =>
      await _legalEntitiesRepository.listAll();

  Future<RequestResult<List<Product>>> listProducts() async =>
      await _productsRepository.listAll();

  Future<RequestResult<List<ProductOffer>>> listPackages() async =>
      await _packagesRepository.listAll();
}
