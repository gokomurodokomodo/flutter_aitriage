import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final double height;
  final Widget? leading;
  final String? title;
  final Widget? searchBar;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    this.height = 100,
    this.leading,
    this.title,
    this.trailing,
    this.searchBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorAppBackground,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            leading ?? const SizedBox(),
            (leading == null) ? const SizedBox() : const SizedBox(width: 12,),
            (title == null) ? const SizedBox() : Text(title!, style: AppStyle.styleTextDashboardTitle,),
            const Spacer(),
            (searchBar != null) ? searchBar! : const SizedBox(),
            const SizedBox(width: 20,),
            (trailing == null) ? const SizedBox() : Container(
              height: 40.h,
              width: 40.h,
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                  color: AppColor.colorBackgroundSearch,
                  border: Border.all(color: AppColor.colorBackgroundSearch),
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: trailing!),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}

