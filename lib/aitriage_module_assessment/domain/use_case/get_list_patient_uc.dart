import 'package:flutter_aitriage/aitriage_module_assessment/domain/repository/patient_repository.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../data/api/response/patient_response.dart';

abstract class GetListPatientUseCase {
  Future<PatientResponse> execute(int page, int limit, {String? searchParam});
}

class GetListPatientUseCaseImpl extends GetListPatientUseCase {
  final PatientRepository _repository;

  GetListPatientUseCaseImpl(this._repository);

  @override
  Future<PatientResponse> execute(int page, int limit, {String? searchParam}) async {
    final user = await ActiveUserUtil.userInfo;
    final resp = await _repository.getListPatient(user.accountId.toString(), page, limit, searchParam: searchParam);
    return resp;
  }
}