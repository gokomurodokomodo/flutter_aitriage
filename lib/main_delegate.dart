import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_example_module/config/example_module.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';
import 'aitriage_core/common/app_module.dart';
import 'aitriage_core/route/routers.dart';
import 'aitriage_core/service/localization_service.dart';
import 'package:get_storage/get_storage.dart';

void mainDelegate(AppEnvironmentType appEnvironment) async {
  WidgetsFlutterBinding.ensureInitialized();
  final pages = initAppModule();
  AppEnvironment.setEnvironment(appEnvironment);
  _initService();
  await _initLocalStorage();
  _initFirebase();
  await _initLocalization();

  runApp(App(pages: pages));
}

List<GetPage> initAppModule() {
  final pages = Routers.getPages;
  final module = <AppModule>[];

  //TODO: remove add example module
  module.add(ExampleModule());

  for(var item in module){
    pages.addAll(item.createRoutes());
  }
  return pages;
}

void _initService() async{}

Future<void> _initLocalStorage() async{
  await GetStorage.init();
}

void _initFirebase() {}

Future<void> _initLocalization() async => LocalizationService.loadLanguage();

class App extends StatelessWidget {
  final List<GetPage> pages;

  const App({
    super.key,
    required this.pages
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Sizer(
            builder: (context, orientation, deviceType) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                smartManagement: SmartManagement.full,
                //init page route
                initialRoute: Routers.initialRoute,
                getPages: pages,
                theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
                //init localize
                translations: LocalizationService(),
                locale: LocalizationService.currentLocale,
                fallbackLocale: LocalizationService.fallbackLocale,
              );
            }
        );
      }
    );
  }
}



