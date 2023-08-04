import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'main_page_router.dart';

class MainModule extends AppModule {
  @override
  List<GetPage> createRoutes() => MainPageRoute.createRoutes();
}