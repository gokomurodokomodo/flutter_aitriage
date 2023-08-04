import 'package:flutter_aitriage/aitriage_intro/config/intro_page_router.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';

class IntroModule extends AppModule {
  @override
  List<GetPage> createRoutes() => IntroPageRoute.createRoutes();
}