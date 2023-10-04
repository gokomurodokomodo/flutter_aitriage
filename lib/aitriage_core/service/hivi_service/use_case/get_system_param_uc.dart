import '../repository/get_app_param_repository.dart';
import '../response/get_system_param_response.dart';

class GetSystemParamUseCase {
  final _repository = GetAppParamRepository();

  Future<GetSystemParamResponse> execute() {
    return _repository.getSystemParam();
  }
}