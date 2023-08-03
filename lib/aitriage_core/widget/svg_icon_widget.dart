import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../common/app_style.dart';

class SvgIconWidget extends StatelessWidget {
  final SvgPicture icon;
  final String name;
  final Color? color;
  final double? size;

  SvgIconWidget({Key? key, required this.name, this.color, this.size, required icon})
      : icon = SvgPicture.asset(
    name,
    width: size ?? AppStyle.appBarIconSize,
    height: size ?? AppStyle.appBarIconSize,
    color: color,
  ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}
