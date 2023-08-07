import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/add_new_patient/add_new_patient_screen.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/all_patients/all_patients_screen.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_screen.dart';
import 'package:get/get.dart';

class OverviewRoute {
  OverviewRoute._();
  // Key for nestedNavigation
  static const nestedId = 1000;
  static final nestedKey = Get.nestedKey(nestedId);
  // Route name
  static const _root = '/overview';
  static const initialRoute = '$_root/home';
  static const allPatients = '$_root/all_patients';
  static const addNewPatients = '$_root/add_new_patient';
  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case initialRoute:
        return GetPageRoute(
            page: () => const HomeOverviewScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => HomeOverviewController());
            })
        );
      case allPatients:
        return GetPageRoute(
            page: () => const AllPatientsScreen(),
            binding: BindingsBuilder(() {
            })
        );
      case addNewPatients:
        return GetPageRoute(
            page: () => const AddNewPatientScreen(),
            binding: BindingsBuilder(() {
            }),
            opaque: false,
            // fullscreenDialog: true
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