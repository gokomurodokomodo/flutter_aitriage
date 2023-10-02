import '../repository/get_app_param_repository.dart';
import '../response/get_param_type_response.dart';

class GetListParamTypeUseCase {
  final _repository = GetAppParamRepository();

  Future<GetParamTypeResponse> execute() {
    return _repository.getParamType();
  }
}