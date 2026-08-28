import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/services/api_service.dart';
import 'package:saas_ui/src/core/network/models/pin_code.dart';
import 'package:saas_ui/src/core/base/crud_repository.dart';
import 'package:saas_ui/src/core/base/base_repository.dart';
import 'package:saas_ui/src/features/home/certificate_item/application/settings/pin_code_settings.dart';

part 'pincodes_repository.g.dart';

@Riverpod(keepAlive: true)
PinCodesRepository pinCodesRepository(Ref ref) =>
    PinCodesRepository(ref.watch(serverApiProvider));

class PinCodesRepository extends CrudRepository<PinCode, int, PinCodeSettings> {
  PinCodesRepository(super.api);
  @override
  Future<RequestResult<List<PinCode>>> listAll([
    PinCodeSettings? filter,
  ]) async => sendRequest<List<PinCode>>(
    () => api.getPinCodes(filter?.filter.certificateId ?? 0),
  );

  @override
  Future<RequestResult<PinCode>> create(PinCode pinCode) async =>
      sendRequest<PinCode>(() => api.createPinCode(pinCode));

  @override
  Future<RequestResult<PinCode>> getById(int id) async =>
      sendRequest<PinCode>(() => api.getPinCode(id));

  @override
  Future<RequestResult<PinCode>> update(int id, PinCode pinCode) async =>
      sendRequest<PinCode>(() => api.updatePinCode(id, pinCode));

  @override
  Future<RequestResult<void>> delete(int id) async =>
      sendRequest<void>(() => api.deletePinCode(id));

  Future<RequestResult<bool>> validate(String pin) async =>
      sendRequest<bool>(() => api.validatePinCode(pin));
}
