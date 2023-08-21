import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';
import '../../common/app_style.dart';

class BaseSearchBarTablet extends StatefulWidget{
  final String? hintText;
  final Function(String)? onTextChange;
  final bool shouldShowSearchIcon;
  final double? width;
  final double? height;

  const BaseSearchBarTablet({
    super.key,
    this.hintText,
    this.onTextChange,
    this.shouldShowSearchIcon = true,
    this.height,
    this.width
  });

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<BaseSearchBarTablet>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 40.h,
      width: widget.width ?? 300.w,
      decoration: BoxDecoration(
          color: AppColor.colorBackgroundSearch,
          border: Border.all(color: AppColor.colorBackgroundSearch),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              onChanged: widget.onTextChange,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  isDense: true,
                  isCollapsed: true,
                  hintStyle: AppStyle.styleHintTextSearchBar
              ),
            ).paddingOnly(left: 16),
          ),
          widget.shouldShowSearchIcon ? SvgIconWidget(name: AppImage.svgSearch).paddingOnly(right: 16) : const SizedBox(),
        ],
      ),
    );
  }
}
