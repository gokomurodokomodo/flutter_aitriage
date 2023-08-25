import 'package:flutter/material.dart';
import '../../common/app_color.dart';

// Wrapper for screen in tablet mode
// Make screen in tablet mode look like a dialog
// Because a screen in phone mode == a dialog in tablet mode
// To reuse controller logic we make a screen look like a dialog
// GetX doesn't have binding for dialog -> can't init controller if we use normal dialog

// Example
// GetPage(
// name: addNewPatients,
// page: () => const AddNewPatientScreen(),
// opaque: false,
// fullscreenDialog: true
// )

class BaseDialogScaffoldTablet extends StatelessWidget {
  final Widget? body;

  const BaseDialogScaffoldTablet({
    super.key,
    this.body
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dialogBackground.withOpacity(0.4),
      body: body,
    );
  }
}
