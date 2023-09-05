import 'package:flutter_aitriage/aitriage_module_auth/domain/repository/sign_up_repository.dart';
import '../../data/api/query/register_account_query.dart';
import '../../data/api/response/register_account_param_response.dart';

abstract class GetRegisterAccountParamUseCase {
  Future<RegisterAccountParamResponse> execute(RegisterAccountQuery query);
}

class GetRegisterAccountParamUseCaseImpl extends GetRegisterAccountParamUseCase {
  final SignUpRepository _repository;

  GetRegisterAccountParamUseCaseImpl(this._repository);

  @override
  Future<RegisterAccountParamResponse> execute(RegisterAccountQuery query) async {
    return await _repository.getRegisterAccountParam(query);
  }
}
