import 'package:get/get.dart';
import 'add_new_note_controller.dart';

class AddNewNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewNoteController());
  }
}