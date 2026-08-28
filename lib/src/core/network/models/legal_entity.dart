import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saas_ui/src/core/models/base_model.dart';

part 'legal_entity.freezed.dart';
part 'legal_entity.g.dart';

@freezed
sealed class LegalEntity with _$LegalEntity implements BaseModel {
  const LegalEntity._();

  const factory LegalEntity({
    int? id,
    @JsonKey(name: 'company_id') @Default(0) int companyId,
    @JsonKey(name: 'company_name', includeToJson: false)
    @Default("")
    String companyName,
    @Default("") String inn,
    @Default("") String kpp,
    @JsonKey(name: 'full_name') @Default("") String fullName,
    @Default("") String bank,
    @JsonKey(name: 'bank_account') @Default("") String bankAccount,
    @JsonKey(name: 'korr_account') @Default("") String korrAccount,
    @Default("") String bik,
    @Default("") String address,
    @Default("") String phone,
    @Default("") String email,
    @JsonKey(name: 'is_seller') @Default(false) bool isSeller,
  }) = _LegalEntity;

  factory LegalEntity.fromJson(Map<String, dynamic> json) =>
      _$LegalEntityFromJson(json);

  @override
  String get getName => fullName;
}
