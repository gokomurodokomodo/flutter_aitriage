import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';
import '../../common/app_style.dart';
import 'custom_trailing_widget.dart';

class GroupButton extends StatefulWidget {
  final List<GroupButtonVM> children;
  final Function(int)? onTap;

  const GroupButton({
    super.key,
    this.onTap,
    required this.children
  });

  @override
  State<GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < widget.children.length; i++) GestureDetector(
          onTap: () => onTap(i),
          child: Container(
            margin: (i != widget.children.length - 1) ? EdgeInsets.only(bottom: 16.h) : null,
            child: CustomTrailingWidget(
                height: 48.h,
                width: double.infinity,
                backgroundColor: selectedIndex == i ? AppColor.colorRailHover : AppColor.colorAppBackground,
                child: Row(
                    children: [
                      SizedBox(width: 12.w),
                      SvgIconWidget(name: widget.children[i].image),
                      SizedBox(width: 20.w),
                      Text(widget.children[i].title, style: selectedIndex == i ? AppStyle.styleRecordVitalSignsActive : AppStyle.styleRecordVitalSignsInactive)
                    ]
                )
            ),
          ),
        )
      ],
    );
  }

  void onTap(int index) {
    widget.onTap?.call(index);
    setState(() => selectedIndex = index);
  }
}

class GroupButtonVM {
  final String title;
  final String image;

  GroupButtonVM({
    required this.title,
    required this.image
  });
}

