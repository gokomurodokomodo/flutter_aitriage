import 'package:flutter_aitriage/aitriage_core/service/entity/system_param.dart';
import '../service/api_service/repository/get_system_param_repository.dart';
import '../service/api_service/response/get_system_param_response.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetSystemParamUseCase {
  final _repository = GetSystemParamRepository();

  Future<GetSystemParamResponse> execute() async {
    return await _repository.getSystemParam();
  }
}