import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_color.dart';

class ListViewPageNavigator extends StatefulWidget {
  final int total;

  const ListViewPageNavigator({super.key, required this.total});

  @override
  State<ListViewPageNavigator> createState() => _ListViewPageNavigatorState();
}

class _ListViewPageNavigatorState extends State<ListViewPageNavigator> {
  var total = 1;
  var selectedIndex = 0;
  var listPageWidget = <_PageItemContent>[];

  @override
  void initState() {
    super.initState();
    total = widget.total;

    for(int i = 0; i < total; i++) {
      listPageWidget.add(
          _PageItemContent(
              value: (i + 1).toString(),
              enable: i == selectedIndex));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Show 1 - 10/140', style: AppStyle.styleRememberMeText),
        const Spacer(),
        _PageItemWrapper(
            child: SvgIconWidget(
                name: AppImage.svgArrowLeft,
                size: 20.r,
            )
        ),
        SizedBox(width: 24.w),
        const _PageItemWrapper(
            shouldShowBgColor: true,
            child: _PageItemContent(
                value: '1',
                enable: true)),
        SizedBox(width: 24.w),
        const _PageItemWrapper(child: _PageItemContent(value: '2', enable: false)),
        SizedBox(width: 24.w),
        const _PageItemWrapper(child: _PageItemContent(value: '3', enable: false)),
        SizedBox(width: 24.w),
        const _PageItemWrapper(child: _PageItemContent(value: '...', enable: false)),
        SizedBox(width: 24.w),
        _PageItemWrapper(
            child: SvgIconWidget(
                name: AppImage.svgArrowRight,
                size: 20.r,
            )
        ),
      ],
    );
  }

}

class _PageItemWrapper extends StatelessWidget {
  final Widget child;
  final bool? shouldShowBgColor;

  const _PageItemWrapper({
    super.key,
    required this.child,
    this.shouldShowBgColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32.h,
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
              color: AppColor.colorSignUpIconWrapperBorder, width: 1.r
          ),
          color: shouldShowBgColor == true ? AppColor.colorTextPinCode : null
        ),
      child: Center(child: child),
    );
  }
}

class _PageItemContent extends StatelessWidget {
  final String value;
  final bool enable;
  
  const _PageItemContent({super.key, required this.value, required this.enable});

  @override
  Widget build(BuildContext context) {
    return Text(
        value,
        style: enable
            ? AppStyle.styleTextPageNavigatorItemEnable
            : AppStyle.styleRecordVitalSignsInactive);
  }
}

