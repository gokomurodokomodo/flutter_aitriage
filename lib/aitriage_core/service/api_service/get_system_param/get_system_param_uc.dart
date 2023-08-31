import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/get_system_param_repository.dart';
import 'package:flutter_aitriage/aitriage_core/service/api_service/get_system_param/get_system_param_response.dart';

class GetSystemParamUseCase {
  final _repository = GetSystemParamRepository();

  Future<GetSystemParamResponse> execute() async {
    return await _repository.getSystemParam();
  }
}