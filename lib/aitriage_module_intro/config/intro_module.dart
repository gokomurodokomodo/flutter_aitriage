import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'intro_page_router.dart';

class IntroModule extends AppModule {
  @override
  List<GetPage> createRoutes() => IntroPageRoute.createRoutes();
}