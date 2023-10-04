import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_note/add_new_note_controller.dart';
import 'package:get/get.dart';

class AddNewNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewNoteController());
  }
}