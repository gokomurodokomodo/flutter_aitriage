import 'package:flutter_aitriage/aitriage_module_main/domain/repository/get_list_location_repository.dart';
import '../../data/api/response/get_list_location_response.dart';

abstract class GetListLocationUseCase {
  Future<GetListLocationResponse> execute(String userId);
}

class GetListLocationUseCaseImpl extends GetListLocationUseCase {
  final GetListLocationRepository _repository;

  GetListLocationUseCaseImpl(this._repository);

  @override
  Future<GetListLocationResponse> execute(String userId) async {
    return await _repository.getListLocation(userId);
  }
}