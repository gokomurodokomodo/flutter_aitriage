import 'package:flutter_aitriage/aitriage_core/service/entity/param_type.dart';
import '../service/api_service/repository/get_system_param_repository.dart';
import '../service/api_service/response/get_param_type_response.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetParamTypeUseCase {
  final _repository = GetSystemParamRepository();
  // final _dbRepository = DatabaseRepository<ParamType>();

  Future<GetParamTypeResponse> execute() async {
    return await _repository.getParamType();
  }
}