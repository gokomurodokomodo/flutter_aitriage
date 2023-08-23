import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBackButton extends StatelessWidget {
  final Function()? onTap;

  const AuthBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgIconWidget(name: AppImage.svgAuthArrowLeft),
          SizedBox(width: 4.w),
          Text('Back', style: AppStyle.styleTextButtonBackToLogin)
        ],
      ),
    );
  }
}
