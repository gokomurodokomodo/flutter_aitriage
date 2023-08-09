import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../aitriage_core/service/localization_service.dart';
import '../../../aitriage_core/util/app_event_channel/core/app_event_channel.dart';
import '../../../aitriage_core/util/app_event_channel/custom_event/finish_init_event.dart';
import '../../../aitriage_core/util/device_util.dart';
import '../../../aitriage_core/util/subscription_collector/subcription_collector.dart';
import '../../config/main_route.dart';
import '../splash_screen/splash_screen.dart';

class App extends StatefulWidget {
  final List<GetPage> pages;

  const App({
    super.key,
    required this.pages
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SubscriptionCollector {
  var finishInit = false;

  @override
  void initState() {
    super.initState();
    final appEventChannel = AppEventChannel();
    final lastEvent = appEventChannel.getLastEvent<FinishInitEvent>();

    if (lastEvent == null) {
      final stream = appEventChannel
          .on<FinishInitEvent>()
          .listen((event) => notifyFinishInit());
      addToCollector(stream);
    } else {
      Future.delayed(Duration.zero, () => notifyFinishInit());
    }
  }

  @override
  void dispose() {
    disposeAllStreamInCollector();
    super.dispose();
  }

  void notifyFinishInit() => setState(() => finishInit = true);

  String get initialRoute {
    // logic to get initialRoute
    // initial rote can be getting started page, or home page
    return MainRoute.gettingStarted;
  }

  @override
  Widget build(BuildContext context) {
    // Display SplashScreen first
    // When all init done load Main screen
    return !finishInit
        ? const SplashScreen()
        : ScreenUtilInit(
        designSize: DeviceUtil.isTablet
            ? const Size(1440, 1024)
            : const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            smartManagement: SmartManagement.full,
            // Init page route
            initialRoute: initialRoute,
            getPages: widget.pages,
            theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
            // Init localize
            translations: LocalizationService(),
            locale: LocalizationService.currentLocale,
            fallbackLocale: LocalizationService.fallbackLocale,
          );
        });
  }
}