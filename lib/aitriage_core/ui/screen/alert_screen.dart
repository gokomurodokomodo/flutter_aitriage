import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_style.dart';

enum AlertStatus { success, warning, error }

extension AlertExtension on AlertStatus {
  String get icon {
    switch (this) {
      case AlertStatus.success:
        return AppImage.svgSuccessAlert;
      case AlertStatus.warning:
        return AppImage.svgWarningAlert;
      case AlertStatus.error:
        return 'Error';
    }
  }
}

class AlertScreen extends StatelessWidget {
  final String? title;
  final AlertStatus alertStatus;

  const AlertScreen({
    super.key,
    this.title,
    this.alertStatus = AlertStatus.success
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h),
        Center(
            child: Text(
              title ?? 'CONGRATULATION',
              style: AppStyle.styleTextAlertHeader)),
        const Spacer(),
        SvgIconWidget(name: alertStatus.icon),
        const Spacer(),
        const Text('PlaceHolder'),
      ],
    );
  }
}
