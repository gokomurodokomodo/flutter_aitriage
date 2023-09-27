import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/color_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_image.dart';
import '../../aitriage_core/ui/widget/svg_icon_widget.dart';

enum GetStartedItemState { ready, running, finished }

class GetStartedMainColumnItem extends StatelessWidget {
  final String title;
  final String label;
  final String buttonTitle;
  final GetStartedItemState state;

  const GetStartedMainColumnItem({
    super.key,
    required this.title,
    required this.label,
    required this.buttonTitle,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgIconWidget(name: _iconName),
            SizedBox(width: 14.w),
            Text(title, style: _titleStyle),
            const Spacer(),
            ColorButton(title: buttonTitle, width: 120.w, shouldEnableBackground: true)
          ],
        ),
        if (state == GetStartedItemState.running) Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(label, style: AppStyle.styleCheckYourEmailNotification))
      ],
    );
  }

  String get _iconName => state == GetStartedItemState.finished ? AppImage.svgCheckEnabled : AppImage.svgCheckDisabled;

  TextStyle get _titleStyle {
    return switch (state) {
      GetStartedItemState.ready => AppStyle.styleCheckYourEmailNotification,
      GetStartedItemState.running => AppStyle.styleGettingStartedItemTitle,
      GetStartedItemState.finished => AppStyle.styleCheckYourEmailNotification.copyWith(decoration: TextDecoration.lineThrough)
    };
  }
}
