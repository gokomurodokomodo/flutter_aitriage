import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/ui/dialog/app_dialog.dart';
import '../../aitriage_core/ui/widget/custom_login_field.dart';

class AddNoteDialog extends StatefulWidget {
  final String initText;
  final String title;
  final String primaryButtonTitle;
  final String secondaryButtonTile;
  final Function(String)? onTapPrimaryButton;
  final Function? onTapSecondaryButton;

  const AddNoteDialog({
    super.key,
    this.initText = '',
    required this.title,
    required this.primaryButtonTitle,
    required this.secondaryButtonTile,
    this.onTapPrimaryButton,
    this.onTapSecondaryButton
  });

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initText;
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
        dialogWidth: 480.w,
        dialogHeight: 430.h,
        primaryButtonTitle: widget.primaryButtonTitle,
        secondaryButtonTitle: widget.secondaryButtonTile,
        secondaryButtonCallback: () => widget.onTapSecondaryButton?.call(),
        primaryButtonCallback: () => widget.onTapPrimaryButton?.call(controller.text),
        content: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            const Divider(
              color: AppColor.colorInactiveFillColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomLoginField(
              multiLineContentPadding: EdgeInsets.only(top: 10.h),
              controller: controller,
              hintText: 'Note',
              maxLines: 10,
              textFieldWidth: 432.w,
              textFieldHeight: 180.h,
              type: TextInputType.multiline,
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(
              color: AppColor.colorInactiveFillColor,
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
        title: widget.title);
  }
}
