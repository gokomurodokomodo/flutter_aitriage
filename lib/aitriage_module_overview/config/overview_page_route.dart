import 'package:flutter_aitriage/aitriage_module_assessment/feature/home_assessment/home_assessment_screen.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class OverviewPageRoute {
  OverviewPageRoute._();

  static const initialRoute = '/overview';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: initialRoute,
        page: () => const HomeAssessmentScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeOverviewController());
        })),
  ];
}