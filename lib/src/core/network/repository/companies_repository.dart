import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/home/companies/application/settings/company_settings.dart';
import 'package:saas_ui/src/core/network/models/requests/attach_partner_request.dart';
import 'package:saas_ui/src/core/services/api_service.dart';

part 'companies_repository.g.dart';

@Riverpod(keepAlive: true)
CompaniesRepository companiesRepository(Ref ref) =>
    CompaniesRepository(ref.watch(serverApiProvider));

class CompaniesRepository
    extends CrudRepository<Company, int, CompanySettings> {
  CompaniesRepository(super.api);

  @override
  Future<RequestResult<Company>> create(Company company) =>
      sendRequest<Company>(() => api.createCompany(company));

  @override
  Future<RequestResult<List<Company>>> listAll([CompanySettings? filter]) =>
      sendRequest<List<Company>>(
        () => api.getCompanies(
          filter?.filter.isSeller,
          filter?.offset,
          filter?.limit,
        ),
      );

  @override
  Future<RequestResult<Company>> getById(int id) =>
      sendRequest<Company>(() => api.getCompany(id));

  @override
  Future<RequestResult<Company>> update(int id, Company company) =>
      sendRequest<Company>(() => api.updateCompany(id, company));

  @override
  Future<RequestResult<void>> delete(int id) =>
      sendRequest<void>(() => api.deleteCompany(id));

  Future<RequestResult<void>> attachPartner(String referralCode) =>
      sendRequest<void>(
        () =>
            api.attachPartner(AttachPartnerRequest(referralCode: referralCode)),
      );

  Future<RequestResult<void>> attachPartnerXApi(
    String apiKey,
    String referralCode,
  ) => sendRequest<void>(
    () => api.attachPartnerXApi(
      apiKey,
      AttachPartnerRequest(referralCode: referralCode),
    ),
  );
}
