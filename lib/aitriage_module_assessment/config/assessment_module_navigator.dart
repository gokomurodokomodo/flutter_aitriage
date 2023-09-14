import 'package:flutter/material.dart';

import 'assessment_module_page_route.dart';

class AssessmentModuleNavigator extends StatelessWidget {
  const AssessmentModuleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: AssessmentModulePageRoute.nestedKey,
      initialRoute: AssessmentModulePageRoute.initialRoute,
      onGenerateRoute: AssessmentModulePageRoute.onGenerateRoute,
    );
  }
}
