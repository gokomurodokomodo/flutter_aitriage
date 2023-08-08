import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class HomeAssessmentScreen extends StatelessWidget {
  const HomeAssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.person),
            Text('Patient009'),
            Text('Other | 12-07-1998 (38y1m)'),
            ColorButton(title: 'Add note', shouldEnable: true),
            Row(
              children: [
                Icon(Icons.fiber_smart_record_outlined),
                Text('Record vital signs'),
                Icon(Icons.chevron_right)
              ],
            ),
            Row(
              children: [
                Icon(Icons.fiber_smart_record_outlined),
                Text('HHear Score'),
                Icon(Icons.chevron_right)
              ],
            ),
            Row(
              children: [
                Icon(Icons.fiber_smart_record_outlined),
                Text('Assessment Result'),
                Icon(Icons.chevron_right)
              ],
            ),
            // Spacer(),
            Row(
              children: [
                Icon(Icons.fiber_smart_record_outlined),
                Text('Cancel Assessment'),
                Icon(Icons.chevron_right)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


