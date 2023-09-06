import 'package:flutter_aitriage/aitriage_core/service/api_service/get_param_type/get_param_type_response.dart';

import 'get_param_type_repository.dart';

class GetParamTypeUseCase {
  final _repository = GetParamTypeRepository();

  Future<GetParamTypeResponse> execute() async {
    return await _repository.getParamType();
  }
}