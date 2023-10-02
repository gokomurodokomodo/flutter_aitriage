import '../repository/get_app_param_repository.dart';
import '../response/get_role_response.dart';

class GetListRoleUseCase {
  final _repository = GetAppParamRepository();

  Future<GetRoleResponse> execute() {
    return _repository.getRole();
  }
}