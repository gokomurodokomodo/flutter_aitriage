import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/search_textfield_phone.dart';

class SupportCenterScreen extends StatelessWidget {
  const SupportCenterScreen({super.key});

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
      backgroundColor: AppColor.colorAppBackground,
      appBar: AppBar(
        title: const Row(
          children: [
            Text('SUPPORT CENTER')
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('Need help? We\'ve got your back'),
            Text('Perhaps you can find the answers in our collections'),
            SearchTextFieldPhone(),
            ExpansionTile(
              title: Text('Make an appointment for a follow-up visit'),
              children: [
                Text('Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. '
                    'Ut et massa mi. '
                    'Aliquam in hendrerit '
                    'urna. Pellentesque sit '
                    'amet sapien fringilla, '
                    'mattis ligula consectetur, ultrices mauris. '
                    'Maecenas vitae mattis tellus. Nullam quis imperdiet augue. Vestibulum auctor ornare leo, non suscipit ')
              ],
            )
          ],
        ),
      ),
    );
  }
}


