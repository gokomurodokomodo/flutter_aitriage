import 'package:flutter/material.dart';

import 'assessment_route.dart';

class AssessmentNavigator extends StatelessWidget {
  const AssessmentNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: AssessmentRoute.nestedKey,
      initialRoute: AssessmentRoute.initialRoute,
      onGenerateRoute: AssessmentRoute.onGenerateRoute,
    );
  }
}
