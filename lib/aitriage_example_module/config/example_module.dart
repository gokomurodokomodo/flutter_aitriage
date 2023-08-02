import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../aitriage_core/common/app_module.dart';
import 'example_module_page_route.dart';

class ExampleModule extends AppModule {
  @override
  List<GetPage> createRoutes() => ExampleModulePageRoute.createRoutes();
}