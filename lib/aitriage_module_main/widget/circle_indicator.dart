import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../aitriage_core/common/app_color.dart';

class CircleIndicator extends StatelessWidget {
  final int index;
  final int length;

  const CircleIndicator({
    super.key,
    required this.index,
    required this.length
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length * 10.h + (length - 1) * 12.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int i = 0; i < length; i++) _Dot(enable: index == i)
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool enable;

  const _Dot({
    super.key,
    required this.enable
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 10.h,
      height: 10.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enable ? AppColor.colorTextPinCode : AppColor.colorRailHover
      ),
    );
  }
}

