import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';

class SignUpIconWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final bool isSelected;
  final Function? onTap;
  
  const SignUpIconWrapper({
    super.key, 
    required this.child,
    required this.title,
    required this.isSelected,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 240.h,
        height: 240.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
              color: isSelected ? AppColor.colorTextPinCode : AppColor.colorSignUpIconWrapperBorder,
              width: isSelected ? 2.r : 1.r
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                  SizedBox(height: 12.r),
                  Text(title, style: AppStyle.styleCheckYourEmailNotification)
                ],
              ),
            ),
            if (isSelected) Positioned(
                top: 12.r,
                right: 12.r,
                child: SvgIconWidget(name: AppImage.svgCheckEnabled, size: 32.r))
          ],
        ),
      ),
    );
  }
}
