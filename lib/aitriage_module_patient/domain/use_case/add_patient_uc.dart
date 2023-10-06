import '../../../aitriage_core/network/common/base_response.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../data/api/request/add_patient_request.dart';
import '../repository/patient_repository.dart';

abstract class AddPatientUseCase {
  Future<BaseResponse> execute(AddPatientRequest request);
}

class AddPatientUseCaseImpl extends AddPatientUseCase {
  final PatientRepository _repository;

  AddPatientUseCaseImpl(this._repository);

  @override
  Future<BaseResponse> execute(AddPatientRequest request) async {
    final user = await ActiveUserUtil.userInfo;
    return await _repository.addPatient(request, user.accountId.toString());
  }
}
