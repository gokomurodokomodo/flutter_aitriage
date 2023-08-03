import 'package:flutter/material.dart';

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
    if (true) return phone;
    return tablet;
  }
}
