import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/repository/companies_repository.dart';
import 'package:saas_ui/src/features/home/companies/application/settings/company_settings.dart';
import 'package:saas_ui/src/shared/widgets/fields/reference/base/base_reference_widget.dart';

class CompanyReferenceField extends BaseReferenceWidget<Company> {
  const CompanyReferenceField({
    super.key,
    super.onChanged,
    super.initialValue,
    super.decoration,
    super.enabled,
    super.validator,
    super.showClearButton,
    this.isSeller,
  });

  final bool? isSeller;

  @override
  Future<List<Company>> getItems(WidgetRef ref) async {
    final repo = ref.read(companiesRepositoryProvider);
    final response = await repo.listAll(
      CompanySettings(isSeller: isSeller)..loadAll(),
    );
    return response.result ?? <Company>[];
  }
}
