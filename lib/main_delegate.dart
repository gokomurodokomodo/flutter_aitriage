import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_aitriage/aitriage_core/util/device_util.dart';
import 'package:flutter_aitriage/aitriage_example_module/config/example_module.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_module.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_module.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'aitriage_core/common/app_module.dart';
import 'aitriage_core/service/localization_service.dart';
import 'package:get_storage/get_storage.dart';
import 'aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';
import 'aitriage_module_main/config/main_module.dart';
import 'aitriage_module_main/config/main_page_router.dart';

void mainDelegate(AppEnvironmentType appEnvironment) async {
  // If you are using the async keyword in your main function,
  // you will need to call WidgetsFlutterBinding.ensureInitialized()
  // before calling await any other methods.
  // This is because the await keyword will not work until the WidgetsBinding has been initialized.
  WidgetsFlutterBinding.ensureInitialized();
  final appEventChannel = AppEventChannel();
  final pages = _initAppModule();
  AppEnvironment.setEnvironment(appEnvironment);
  await _setPreferOrientation();
  // Using Future.wait to avoid blocking UI before launch splash screen
  // After all async func done, notify splash screen by AppEventChannel
  Future.wait([
    _initLocalization(),
    _initLocalStorage(),
    _initService(),
    _initFirebase()
  ]).then((value) => appEventChannel.addEvent(FinishInitEvent('')));

  runApp(App(pages: pages));
}

class App extends StatelessWidget {
  final List<GetPage> pages;

  const App({
    super.key,
    required this.pages
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: DeviceUtil.isTablet ? const Size(1440, 1024) : const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            smartManagement: SmartManagement.full,
            // Init page route
            initialRoute: MainPageRoute.initialRoute,
            getPages: pages,
            theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
            // Init localize
            translations: LocalizationService(),
            locale: LocalizationService.currentLocale,
            fallbackLocale: LocalizationService.fallbackLocale,
          );
        }
    );
  }
}

Future<void> _setPreferOrientation() async{
  DeviceUtil.isTablet
      ? SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

List<GetPage> _initAppModule() {
  final pages = <GetPage<dynamic>>[];
  final module = <AppModule>[];
  module.add(MainModule());
  module.add(AssessmentModule());
  module.add(OverviewModule());
  module.add(SettingModule());

  for(var item in module){
    pages.addAll(item.createRoutes());
  }

  return pages;
}

Future _initService() async {}

Future<void> _initLocalStorage() async{
  GetStorage.init();
}

Future _initFirebase() async {}

Future<void> _initLocalization() async => LocalizationService.loadLanguage();



