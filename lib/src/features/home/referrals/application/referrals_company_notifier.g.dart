// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referrals_company_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReferralsCompany)
final referralsCompanyProvider = ReferralsCompanyProvider._();

final class ReferralsCompanyProvider
    extends $AsyncNotifierProvider<ReferralsCompany, Company?> {
  ReferralsCompanyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referralsCompanyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referralsCompanyHash();

  @$internal
  @override
  ReferralsCompany create() => ReferralsCompany();
}

String _$referralsCompanyHash() => r'23b371fddce5a531e715fc732daed1fd90ee1831';

abstract class _$ReferralsCompany extends $AsyncNotifier<Company?> {
  FutureOr<Company?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Company?>, Company?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Company?>, Company?>,
              AsyncValue<Company?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
