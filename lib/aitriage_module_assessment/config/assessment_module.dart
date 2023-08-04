import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'assessment_page_route.dart';

class AssessmentModule extends AppModule {
  @override
  List<GetPage> createRoutes() => AssessmentPageRoute.createRoutes();
}