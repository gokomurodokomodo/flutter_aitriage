import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
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
  final Function? onTapPrimaryButton;
  final Function? onTapSecondaryButton;

  const AlertScreen({
    super.key,
    this.title,
    this.alertStatus = AlertStatus.success,
    this.onTapPrimaryButton,
    this.onTapSecondaryButton
  });

  @override
  Widget build(BuildContext context) {
    return DeviceDetector(
        tablet: _AlertScreenTablet(
            title: title,
            alertStatus: alertStatus
        ),
        phone: _AlertScreenPhone(
            title: title,
            alertStatus: alertStatus,
            onTapSecondaryButton: onTapSecondaryButton,
            onTapPrimaryButton: onTapPrimaryButton
        )
    );
  }
}

class _AlertScreenTablet extends StatelessWidget {
  final String? title;
  final AlertStatus alertStatus;

  const _AlertScreenTablet({
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

class _AlertScreenPhone extends StatelessWidget {
  final String? title;
  final AlertStatus alertStatus;
  final Function? onTapPrimaryButton;
  final Function? onTapSecondaryButton;

  const _AlertScreenPhone({
    this.title,
    this.alertStatus = AlertStatus.success,
    this.onTapSecondaryButton,
    this.onTapPrimaryButton
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
              title ?? 'CONGRATULATION',
              style: AppStyle.styleTextAlertHeader),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 136),
            SvgIconWidget(name: alertStatus.icon, size: 96,),
            const Text('Patient Added Successfully'),
            Spacer(),
            ColorButton(title: 'Confirm', shouldEnable: true, onTap: () => onTapPrimaryButton?.call()),
            SizedBox(height: 5),
            ColorButton(title: 'Dismiss', onTap: () => onTapSecondaryButton?.call()),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}


