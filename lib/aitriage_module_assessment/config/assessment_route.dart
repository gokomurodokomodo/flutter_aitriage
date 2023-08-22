import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/work_flow/workflow_screen.dart';
import 'package:get/get.dart';
import '../feature/add_new_note/add_new_note_screen.dart';
import '../feature/add_new_patient/add_new_patient_screen.dart';
import '../feature/all_patients/all_patients_screen.dart';
import '../feature/assessment_result/assessment_result_screen.dart';
import '../feature/home_assessment/home_assessment_controller.dart';
import '../feature/home_assessment/home_assessment_screen.dart';
import '../feature/note/note_screen.dart';
import '../feature/record_vital_signs/record_vital_signs_screen.dart';

class AssessmentRoute {
  AssessmentRoute._();
  // Key for nestedNavigation
  static const nestedId = 1000;
  static final nestedKey = Get.nestedKey(nestedId);
  // Route name
  static const _root = '/assessment';
  static const initialRoute = '$_root/home';
  static const allPatients = '$_root/all_patients';
  static const addNewPatients = '$_root/add_new_patient';
  static const recordVitalSigns = '$_root/record_vital_signs';
  static const assessmentResult = '$_root/assessment_result';
  static const note = '$_root/note';
  static const addNewNote = '$_root/add_new_note';
  static const connectingDevice = '$_root/connecting_device';
  static const workflow = '$_root/workflow';
  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return GetPageRoute(
            settings: settings,
            page: () => const HomeAssessmentScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => HomeAssessmentController());
            })
        );
      case allPatients:
        return GetPageRoute(
            settings: settings,
            page: () => const AllPatientsScreen(),
            binding: BindingsBuilder(() {
            })
        );
      case addNewPatients:
        return GetPageRoute(
            settings: settings,
            page: () => const AddNewPatientScreen(),
            binding: BindingsBuilder(() {
            }),
            opaque: false,
            // fullscreenDialog: true
        );
      case recordVitalSigns:
        return GetPageRoute(
            settings: settings,
            page: () => const RecordVitalSignsScreen()
        );
      case assessmentResult:
        return GetPageRoute(
            settings: settings,
            page: () => const AssessmentResultScreen()
        );
      case note:
        return GetPageRoute(
            settings: settings,
            page: () => const NoteScreen()
        );
      case addNewNote:
        return GetPageRoute(
            settings: settings,
            page: () => const AddNewNoteScreen()
        );
      case workflow:
        return GetPageRoute(
            settings: settings,
            page: () => const WorkflowScreen()
        );
      default:
        return null;
    }
  }

  // when navigate without id
  static List<GetPage> createRoutes() => [
    GetPage(
        name: addNewPatients,
        page: () => const AddNewPatientScreen(),
        // opaque = false and change screen background color to transparent
        // to make screen look like a dialog - for tablet dialog
        opaque: false,
        fullscreenDialog: true
    )
  ];
}