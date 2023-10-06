import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../feature/add_new_note/add_new_note_binding.dart';
import '../feature/add_new_note/add_new_note_screen.dart';
import '../feature/add_new_patient/add_new_patient_binding.dart';
import '../feature/add_new_patient/add_new_patient_screen.dart';
import '../feature/all_patients/all_patients_screen.dart';
import '../feature/assessment_result/assessment_result_screen.dart';
import '../feature/home_assessment/home_assessment_binding.dart';
import '../feature/home_assessment/home_assessment_screen.dart';
import '../feature/note/note_screen.dart';
import '../feature/patient_detail/patient_detail_binding.dart';
import '../feature/patient_detail/patient_detail_screen.dart';
import '../feature/record_vital_signs/record_vital_signs_screen.dart';
import '../feature/work_flow/workflow_screen.dart';

class PatientModulePageRoute {
  PatientModulePageRoute._();
  // Key for nestedNavigation
  static const nestedId = 2000;
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
  static const patientDetail = '$_root/patient_detail';
  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
          settings: settings,
          page: () => const HomeAssessmentScreen(),
          binding: HomeAssessmentBinding()),
      allPatients => GetPageRoute(
          settings: settings,
          page: () => const AllPatientsScreen()),
      addNewPatients => GetPageRoute(
          settings: settings,
          page: () => const AddNewPatientScreen(),
          // binding: AddNewPatientBinding(),
          opaque: false),
      recordVitalSigns => GetPageRoute(
          settings: settings,
          page: () => const RecordVitalSignsScreen()),
      assessmentResult => GetPageRoute(
          settings: settings,
          page: () => const AssessmentResultScreen()),
      note => GetPageRoute(
          settings: settings,
          page: () => const NoteScreen()),
      addNewNote => GetPageRoute(
          settings: settings,
          page: () => const AddNewNoteScreen()),
      workflow => GetPageRoute(
          settings: settings,
          page: () => const WorkflowScreen()),
      patientDetail => GetPageRoute(
          settings: settings,
          binding: PatientDetailBinding(settings.arguments),
          page: () => const PatientDetailScreen()),
      _ => null
    };
  }

  // when navigate without id
  static List<GetPage> createRoutes() => [
    GetPage(
        name: addNewPatients,
        page: () => const AddNewPatientScreen(),
        // opaque = false and change screen background color to transparent
        // to make screen look like a dialog - for tablet dialog
        opaque: false,
        transition: Transition.fadeIn,
        fullscreenDialog: true,
        binding: AddNewPatientBinding()
    ),
    GetPage(
        name: addNewNote,
        page: () => const AddNewNoteScreen(),
        // opaque = false and change screen background color to transparent
        // to make screen look like a dialog - for tablet dialog
        opaque: false,
        transition: Transition.fadeIn,
        fullscreenDialog: true,
        binding: AddNewNoteBinding()
    )
  ];
}