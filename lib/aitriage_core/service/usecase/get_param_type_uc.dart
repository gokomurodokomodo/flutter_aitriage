import 'package:flutter_aitriage/aitriage_core/service/entity/param_type.dart';
import '../service/api_service/get_param_type/get_param_type_repository.dart';
import '../service/api_service/get_param_type/get_param_type_response.dart';
import '../service/local_storage_service/database/repository/isar_database_repository.dart';

class GetParamTypeUseCase {
  final _repository = GetParamTypeRepository();
  // final _dbRepository = DatabaseRepository<ParamType>();

  Future<GetParamTypeResponse> execute() async {
    return await _repository.getParamType();
  }
}