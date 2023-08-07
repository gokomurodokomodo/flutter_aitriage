import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_route.dart';
import 'package:get/get.dart';

class OverviewNavigator extends StatelessWidget {
  const OverviewNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: OverviewRoute.nestedKey,
      initialRoute: OverviewRoute.initialRoute,
      onGenerateRoute: OverviewRoute.onGenerateRoute,
    );
  }
}
