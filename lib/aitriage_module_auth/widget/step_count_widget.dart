import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';

enum _StepItemStatus { pending, processing, done }

class StepCountWidget extends StatelessWidget {
  final int index;

  const StepCountWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.h),
          width: double.infinity,
          height: 2.h,
          color: AppColor.colorInactiveFillColor,
        ),
        Row(
          children: [
            const Spacer(),
            _StepItem(value: 1, status: _getStatus(1)),
            SizedBox(width: 40.w),
            _StepItem(value: 2, status: _getStatus(2)),
            SizedBox(width: 40.w),
            _StepItem(value: 3, status: _getStatus(3)),
            const Spacer()
          ],
        )
      ],
    );
  }

  _StepItemStatus _getStatus(int value) {
    if (value == index) {
      return _StepItemStatus.processing;
    } else if (value < index) {
      return _StepItemStatus.done;
    } else {
      return _StepItemStatus.pending;
    }
  }
}

class _StepItem extends StatelessWidget {
  final int value;
  final _StepItemStatus status;

  const _StepItem({
    super.key,
    required this.value,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.r,
      height: 40.r,
      decoration: _decoration,
      child: Center(
        child: status == _StepItemStatus.done
            ? SvgIconWidget(name: AppImage.svgCheckEnabled, size: 40.r)
            : Text(value.toString(), style: _textStyle),
      ),
    );
  }

  Decoration? get _decoration {
    return switch (status) {
      _StepItemStatus.pending => const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.colorStepItemDone,
        ),
      _ => const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.colorTextPinCode,
        )
    };
  }

  TextStyle? get _textStyle {
    return switch (status) {
      _StepItemStatus.pending => AppStyle.styleStepItemPending,
      _StepItemStatus.processing => AppStyle.styleStepItemProcessing,
      _StepItemStatus.done => null
    };
  }
}
