import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';

enum Risk { total, low, medium, high }

class RiskWithSymbol extends StatelessWidget {
  final Risk risk;
  final double? backgroundSize;
  final double? iconSize;

  const RiskWithSymbol({
    super.key,
    required this.risk,
    this.backgroundSize,
    this.iconSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: backgroundSize ?? 40.r,
        height: backgroundSize ?? 40.r,
        // padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: _backgroundColor
        ),
        child: Center(child: SvgIconWidget(name: _svgIconName, size: iconSize ?? 24.r)));
  }

  String get _svgIconName {
    return switch (risk) {
      Risk.total => AppImage.svgTotalAssessment,
      Risk.low => AppImage.svgLowRisk,
      Risk.medium => AppImage.svgMediumRisk,
      Risk.high => AppImage.svgHighRisk
    };
  }

  Color get _backgroundColor {
    return switch (risk) {
      Risk.total => AppColor.colorVitalSignNibpBg,
      Risk.low => AppColor.colorLowRiskBackground,
      Risk.medium => AppColor.colorUserProfileBackground,
      Risk.high => AppColor.colorHighRiskBackground,
    };
  }
}
