import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'main_route.dart';

class AuthenModule extends AppModule {
  @override
  List<GetPage> createRoutes() => AuthenRoute.createRoutes();
}