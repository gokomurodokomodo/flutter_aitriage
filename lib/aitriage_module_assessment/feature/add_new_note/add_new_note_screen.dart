import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_dialog_scaffold_tablet.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/add_new_note/add_new_note_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../../aitriage_core/ui/widget/line_separated.dart';
import '../../../aitriage_core/ui/widget/svg_icon_widget.dart';

class AddNewNoteScreen extends StatelessWidget {
  const AddNewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone()
    );
  }
}

class _Tablet extends GetView<AddNewNoteController> {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return BaseDialogScaffoldTablet(
      body: Center(
        child: Container(
          width: 480.w,
          height: 380.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColor.colorAppBackground,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text('NOTE',
                      style: AppStyle.styleTextDialogHeaderTitle),
                  const Spacer(),
                  GestureDetector(
                      onTap: () => Get.back(result: false),
                      child: SvgIconWidget(
                          name: AppImage.svgDialogClose, size: 24.w)),
                  LineSeparated(
                      margin: 20.h, color: AppColor.colorInactiveFillColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


