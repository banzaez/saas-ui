import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/network/models/company.dart';
import 'package:saas_ui/src/core/network/repository/companies_repository.dart';
import 'package:saas_ui/src/core/services/user_service.dart';

part 'referrals_company_notifier.g.dart';

@riverpod
class ReferralsCompany extends _$ReferralsCompany {
  @override
  FutureOr<Company?> build() async {
    final companyId = ref.watch(userServiceProvider.select((s) => s.value?.companyId ?? 0));
    if (companyId == 0) return null;
    final res = await ref.read(companiesRepositoryProvider).getById(companyId);
    if (res.isSuccess) return res.result;
    throw res.errorString;
  }

  Future<bool> attachPartner(String code) async {
    final res = await ref.read(companiesRepositoryProvider).attachPartner(code);
    if (!ref.mounted) return false;
    if (res.isSuccess) {
      ref.invalidateSelf();
      return true;
    }
    res.showError();
    return false;
  }
}
