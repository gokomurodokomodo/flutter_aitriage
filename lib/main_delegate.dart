import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_env.dart';
import 'package:flutter_aitriage/aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import 'package:flutter_aitriage/aitriage_example_module/config/example_module.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';
import 'aitriage_core/common/app_module.dart';
import 'aitriage_core/route/app_router.dart';
import 'aitriage_core/service/localization_service.dart';
import 'package:get_storage/get_storage.dart';
import 'aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';

void mainDelegate(AppEnvironmentType appEnvironment) async {
  final appEventChannel = AppEventChannel();
  final pages = _initAppModule();
  WidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.setEnvironment(appEnvironment);
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
      builder: (_, __) {
        return Sizer(
            builder: (_, __, ___) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                smartManagement: SmartManagement.full,
                //init page route
                initialRoute: AppRoute.initialRoute,
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

List<GetPage> _initAppModule() {
  final pages = AppRoute.getPages;
  final module = <AppModule>[];
  module.add(ExampleModule());

  for(var item in module){
    pages.addAll(item.createRoutes());
  }

  return pages;
}

Future _initService() async {}

Future<void> _initLocalStorage() async{
  await GetStorage.init();
}

Future _initFirebase() async {}

Future<void> _initLocalization() async => LocalizationService.loadLanguage();



