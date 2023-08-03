import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class DeviceDetector extends StatelessWidget {
  final Widget tablet;
  final Widget phone;

  const DeviceDetector({
    super.key,
    required this.tablet,
    required this.phone
  });

  @override
  Widget build(BuildContext context) {
    return SizerUtil.deviceType == DeviceType.mobile ? phone : tablet;
  }
}
