import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/assessment_detail/assessment_detail_binding.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/assessment_detail/assessment_detail_screen.dart';
import 'package:get/get.dart';
import '../feature/home_assessment/home_assessment_binding.dart';
import '../feature/home_assessment/home_assessment_screen.dart';

class AssessmentModulePageRoute {
  AssessmentModulePageRoute._();
  // Key for nestedNavigation
  static const nestedId = 1000;
  static final nestedKey = Get.nestedKey(nestedId);
  // Route name
  static const _root = '/assessment';
  static const initialRoute = '$_root/home';
  static const assessmentDetail = '$_root/assessment_detail';

  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
          settings: settings,
          page: () => const HomeAssessmentScreen(),
          binding: HomeAssessmentBinding()),
      assessmentDetail => GetPageRoute(
          settings: settings,
          page: () => const AssessmentDetailScreen(),
          binding: AssessmentDetailBinding()),
      _ => null
    };
  }

  // when navigate without id
  static List<GetPage> createRoutes() => [

  ];
}