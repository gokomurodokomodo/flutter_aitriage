import '../../data/api/response/get_list_location_response.dart';

abstract class GetListLocationRepository {
  Future<GetListLocationResponse> getListLocation(String userId);
}