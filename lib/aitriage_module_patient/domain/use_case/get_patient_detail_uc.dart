import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../data/api/response/patient_detail_response.dart';
import '../repository/patient_repository.dart';

abstract class GetPatientDetailUseCase {
  Future<PatientDetailResponse> execute(String customerId);
}

class GetPatientDetailUseCaseImpl extends GetPatientDetailUseCase {
  final PatientRepository _repository;

  GetPatientDetailUseCaseImpl(this._repository);

  @override
  Future<PatientDetailResponse> execute(String customerId) async {
    final userInfo = await ActiveUserUtil.userInfo;
    return await _repository.getPatientDetail(userInfo.accountId.toString(), customerId);
  }
}