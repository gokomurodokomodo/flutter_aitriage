import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'setting_page_route.dart';

class SettingModule extends AppModule {
  @override
  List<GetPage> createRoutes() => SettingPageRoute.createRoutes();
}