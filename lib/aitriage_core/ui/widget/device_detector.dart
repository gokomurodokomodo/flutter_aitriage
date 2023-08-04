import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/util/device_util.dart';

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
    return !DeviceUtil.isTablet ? phone : tablet;
  }
}
