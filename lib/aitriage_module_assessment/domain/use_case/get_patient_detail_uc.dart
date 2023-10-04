import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../data/api/response/patient_detail_response.dart';

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