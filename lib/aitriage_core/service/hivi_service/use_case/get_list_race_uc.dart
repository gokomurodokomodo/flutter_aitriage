import '../repository/get_app_param_repository.dart';
import '../response/get_race_response.dart';

class GetListRaceUseCase {
  final _repository = GetAppParamRepository();

  Future<GetRaceResponse> execute() {
    return _repository.getRace();
  }
}