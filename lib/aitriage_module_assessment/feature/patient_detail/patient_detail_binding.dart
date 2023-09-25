import 'package:flutter_aitriage/aitriage_module_assessment/feature/patient_detail/patient_detail_controller.dart';
import 'package:get/get.dart';

class PatientDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PatientDetailController());
  }
}