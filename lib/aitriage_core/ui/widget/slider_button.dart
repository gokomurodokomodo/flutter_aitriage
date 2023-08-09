import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderButton extends StatefulWidget {
  final Duration duration;
  final double width;
  final double? height;
  final Function(bool)? onTap;
  final bool isEnable;

  const SliderButton({
    super.key,
    this.duration = const Duration(milliseconds: 500),
    this.width = double.infinity,
    this.height,
    this.onTap,
    this.isEnable = false
  });

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  var isEnable = false;
  final padding = 5.w;

  @override
  void initState() {
    super.initState();
    isEnable = widget.isEnable;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isEnable = !isEnable;
        widget.onTap?.call(isEnable);
      }),
      child: AnimatedContainer(
        width: widget.width,
        height: _height,
        duration: widget.duration,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(_height)),
          color: isEnable ? AppColor.colorSliderButtonEnable : AppColor.colorSliderButtonDisable
        ),
        child: LayoutBuilder(builder: (_, constraint) {
            return Stack(
              children: [
                AnimatedPositioned(
                    left: isEnable ? constraint.maxWidth - _height + (padding / 2) : 0 + padding / 2,
                    top: padding / 2,
                    duration: widget.duration,
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                        height: _circleButtonSize,
                        width: _circleButtonSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                    ))
              ],
            );
          })
      ),
    );
  }

  double get _height => widget.height ?? 24.h;

  double get _circleButtonSize => _height - padding;
}
