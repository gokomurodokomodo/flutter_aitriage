import 'package:flutter/material.dart';

import 'patient_module_page_route.dart';

class PatientModuleNavigator extends StatelessWidget {
  const PatientModuleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: PatientModulePageRoute.nestedKey,
      initialRoute: PatientModulePageRoute.initialRoute,
      onGenerateRoute: PatientModulePageRoute.onGenerateRoute,
    );
  }
}
