import 'package:get/get.dart';

class DeviceUtil{
    DeviceUtil._();

    static final _devicePhysicalWidth = Get.window.physicalSize.width;
    static final _devicePhysicalHeight = Get.window.physicalSize.height;

    static final isTablet = (_devicePhysicalWidth > 1440) || (_devicePhysicalHeight > 3088);
}