import 'package:flutter/cupertino.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';

class ChooseHospitalPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Phone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}