import '../../../aitriage_core/network/common/base_response.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../repository/patient_repository.dart';

abstract class DeletePatientUseCase {
  Future<BaseResponse> execute(String patientId);
}

class DeletePatientUseCaseImpl extends DeletePatientUseCase {
  final PatientRepository _repository;

  DeletePatientUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(String patientId) async {
    final userInfo = await ActiveUserUtil.userInfo;
    return await _repository.deletePatient(userInfo.accountId.toString(), patientId);
  }
}