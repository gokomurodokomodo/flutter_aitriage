import 'package:flutter_aitriage/aitriage_module_main/domain/repository/get_list_location_repository.dart';
import '../../../aitriage_core/util/active_user/active_user.dart';
import '../../data/api/response/get_list_location_response.dart';

abstract class GetListLocationUseCase {
  Future<GetListLocationResponse> execute();
}

class GetListLocationUseCaseImpl extends GetListLocationUseCase {
  final GetListLocationRepository _repository;

  GetListLocationUseCaseImpl(this._repository);

  @override
  Future<GetListLocationResponse> execute() async {
    final userInfo = await ActiveUserUtil.userInfo;
    return await _repository.getListLocation(userInfo.id.toString());
  }
}