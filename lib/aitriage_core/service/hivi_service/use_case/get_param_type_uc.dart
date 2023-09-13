import '../repository/get_system_param_repository.dart';
import '../response/get_param_type_response.dart';

class GetParamTypeUseCase {
  final _repository = GetSystemParamRepository();
  // final _dbRepository = DatabaseRepository<ParamType>();

  Future<GetParamTypeResponse> execute() async {
    return await _repository.getParamType();
  }
}