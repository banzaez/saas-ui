// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CertificateDetail)
final certificateDetailProvider = CertificateDetailFamily._();

final class CertificateDetailProvider
    extends $AsyncNotifierProvider<CertificateDetail, CertificatePageData?> {
  CertificateDetailProvider._({
    required CertificateDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'certificateDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$certificateDetailHash();

  @override
  String toString() {
    return r'certificateDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CertificateDetail create() => CertificateDetail();

  @override
  bool operator ==(Object other) {
    return other is CertificateDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$certificateDetailHash() => r'75bf368ec11e030fd962c929e6748075e36db940';

final class CertificateDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          CertificateDetail,
          AsyncValue<CertificatePageData?>,
          CertificatePageData?,
          FutureOr<CertificatePageData?>,
          int
        > {
  CertificateDetailFamily._()
    : super(
        retry: null,
        name: r'certificateDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CertificateDetailProvider call(int certificateId) =>
      CertificateDetailProvider._(argument: certificateId, from: this);

  @override
  String toString() => r'certificateDetailProvider';
}

abstract class _$CertificateDetail
    extends $AsyncNotifier<CertificatePageData?> {
  late final _$args = ref.$arg as int;
  int get certificateId => _$args;

  FutureOr<CertificatePageData?> build(int certificateId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<CertificatePageData?>, CertificatePageData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CertificatePageData?>,
                CertificatePageData?
              >,
              AsyncValue<CertificatePageData?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
