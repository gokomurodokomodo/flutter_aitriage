import 'package:get/get.dart';
import '../../../aitriage_module_main/feature/home_main/home_main_controller.dart';
import '../../data/api/query/list_assessment_by_location_query.dart';
import '../repository/assessment_repository.dart';

abstract class GetListAssessmentByLocationUseCase {
  Future execute(int page, int limit, {String? search});
}

class GetListAssessmentByLocationUseCaseImpl extends GetListAssessmentByLocationUseCase {
  final AssessmentRepository _repository;

  GetListAssessmentByLocationUseCaseImpl(this._repository);

  @override
  Future execute(int page, int limit, {String? search}) {
    final selectedLocation = Get.isRegistered<HomeMainController>()
        ? Get.find<HomeMainController>().currentLocation
        : null;
    final locationId = selectedLocation?.id;
    final query = ListAssessmentByLocationQuery(page, limit, search: search, locationId: locationId.toString());
    return _repository.getListAssessment(query);
  }
}