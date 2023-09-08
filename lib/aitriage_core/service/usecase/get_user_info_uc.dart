import '../service/api_service/get_user_info/get_user_info_repository.dart';
import '../service/api_service/get_user_info/get_user_info_response.dart';

class GetUserInfoUseCase {
  final _repository = GetUserInfoRepository();

  Future<GetUserInfoResponse> execute(int id) async {
    return await _repository.getUserInfo(id);
  }
}