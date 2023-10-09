import 'package:get/get.dart';
import '../../../aitriage_module_main/feature/home_main/home_main_controller.dart';
import '../../data/api/query/list_assessment_by_location_query.dart';
import '../../../aitriage_module_assessment/data/api/response/get_list_assessment_response.dart';
import '../../../aitriage_module_assessment/domain/repository/assessment_repository.dart';

abstract class GetListAssessmentByLocationUseCase {
  Future<GetListAssessmentResponse> execute(int page, int limit, {String? search});
}

class GetListAssessmentByLocationUseCaseImpl extends GetListAssessmentByLocationUseCase {
  final AssessmentRepository _repository;

  GetListAssessmentByLocationUseCaseImpl(this._repository);

  @override
  Future<GetListAssessmentResponse> execute(int page, int limit, {String? search}) {
    final selectedLocation = Get.isRegistered<HomeMainController>()
        ? Get.find<HomeMainController>().currentLocation
        : null;
    final locationId = selectedLocation?.id;
    final query = ListAssessmentByLocationQuery(page, limit, search: search, locationId: locationId);
    return _repository.getListAssessment(query);
  }
}