import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconWidget extends StatelessWidget {
  final SvgPicture child;
  final String name;
  final Color? color;
  final double? size;

  SvgIconWidget({Key? key, required this.name, this.color, this.size})
      : child = buildChild(name, size, color),
        super(key: key);

  static SvgPicture buildChild(String name, double? size, Color? color) {
    return SvgPicture.asset(
      name,
      width: size ?? 24.w,
      height: size ?? 24.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
