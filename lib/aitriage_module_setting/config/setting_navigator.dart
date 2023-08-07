import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_setting/config/setting_route.dart';

class SettingNavigator extends StatelessWidget {
  const SettingNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: SettingRoute.nestedKey,
      initialRoute: SettingRoute.initialRoute,
      onGenerateRoute: SettingRoute.onGenerateRoute,
    );
  }
}
