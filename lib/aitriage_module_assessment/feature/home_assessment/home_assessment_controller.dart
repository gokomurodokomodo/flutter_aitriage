import 'package:flutter_aitriage/aitriage_core/util/active_user/active_user.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/domain/use_case/get_list_patient_uc.dart';
import 'package:get/get.dart';

class HomeAssessmentController extends GetxController {
  final GetListPatientUseCase _getListPatientUC;
  var totalPage = 10.obs;
  var selectedIndex = 0.obs;

  HomeAssessmentController(this._getListPatientUC);

  @override
  void onInit() async {
    super.onInit();
    final user = await ActiveUserUtil.userInfo;
    _getListPatientUC.execute(user.id.toString(), 1, 5);
  }
}