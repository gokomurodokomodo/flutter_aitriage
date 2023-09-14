import 'package:get/get.dart';
import 'home_assessment_controller.dart';

class HomeAssessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAssessmentController());
  }
}