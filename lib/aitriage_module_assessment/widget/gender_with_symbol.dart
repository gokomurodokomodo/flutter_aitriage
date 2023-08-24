import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

enum Gender { patients, male, female }

class GenderWithSymbol extends StatelessWidget {
  final Gender gender;
  final double? backgroundSize;
  final double? iconSize;

  const GenderWithSymbol({
    super.key,
    required this.gender,
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
    switch (gender) {
      case Gender.patients:
        return AppImage.svgProfileUser;
      case Gender.male:
        return AppImage.svgProfileMale;
      case Gender.female:
        return AppImage.svgProfileFemale;
    }
  }

  Color get _backgroundColor {
    switch (gender) {
      case Gender.patients:
        return AppColor.colorUserProfileBackground;
      case Gender.male:
        return AppColor.colorRailHover;
      case Gender.female:
        return AppColor.colorFemaleProfileBackground;
    }
  }
}
