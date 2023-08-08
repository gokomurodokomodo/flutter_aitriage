import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

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
        title: const Text('ABOUT US'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.image),
            Text('t maximus ante fermentum sit amet.'
                ' Pellentesque commodo lacus at sodales sodales.'
                ' Quisque sagittis orci ut diam condimentum, '
                'vel euismod erat placerat. In iaculis arcu eros, '
                'eget tempus orci facilisis id. '),
            Text('Lorem ipsum dolor sit amet, '
                'consectetur adipiscing elit.'
                ' Ut et massa mi. Aliquam in hendrerit urna.'
                ' Pellentesque sit amet sapien fringilla, mattis ligula consectetur,'
                ' ultrices mauris. Maecenas vitae mattis tellus. Nullam quis imperdiet augue. '
                'Vestibulum auctor ornare leo, non suscipit magna interdum eu. Curabitur pellentesque'
                ' nibh nibh, at maximus ante fermentum sit amet. ')
          ],
        ),
      ),
    );
  }
}


