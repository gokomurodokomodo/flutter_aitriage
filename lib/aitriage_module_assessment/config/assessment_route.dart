import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_note/add_new_note_screen.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/connecting_device/connecting_device_screen.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_screen.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/note/note_screen.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/record_vital_signs/record_vital_signs_screen.dart';
import 'package:get/get.dart';

import '../feature/assessment_result/assessment_result_screen.dart';

class AssessmentRoute {
  AssessmentRoute._();

  static const nestedId = 2000;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/assessment';
  static const initialRoute = '$_root/home';
  static const recordVitalSigns = '$_root/record_vital_signs';
  static const assessmentResult = '$_root/assessment_result';
  static const note = '$_root/note';
  static const addNewNote = '$_root/add_new_note';
  static const connectingDevice = '$_root/connecting_device';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return GetPageRoute(
            settings: settings,
            page: () => const HomeAssessmentScreen()
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
      default:
        return GetPageRoute(
            page: () => const Scaffold());
    }
  }

  static List<GetPage> createRoutes() => [
    GetPage(
        name: connectingDevice,
        page: () => const ConnectingDeviceScreen()
    )
  ];
}