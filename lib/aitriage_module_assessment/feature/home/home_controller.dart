import 'package:flutter_aitriage/aitriage_core/common/app_constant.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home/home_vm.dart';
import 'package:flutter_aitriage/aitriage_module_patient/domain/use_case/get_list_assessment_by_location_uc.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetListAssessmentByLocationUseCase _getListAssessmentByLocationUC;
  final vm = HomeVM().obs;

  HomeController(this._getListAssessmentByLocationUC);

  @override
  void onInit() {
    super.onInit();
    _getListAssessmentByLocationUC.execute(1, AppConstant.pageLimit);
  }
}