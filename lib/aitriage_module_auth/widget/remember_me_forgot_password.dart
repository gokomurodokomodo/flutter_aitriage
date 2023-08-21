import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../aitriage_core/common/app_style.dart';
import '../config/auth_route.dart';

class RememberAndForgotPassword extends StatelessWidget {
  final bool isChecked;
  final Function(bool) onTapCheck;
  final Function()? onTapForgotPassword;


  const RememberAndForgotPassword({
    super.key,
    required this.isChecked,
    required this.onTapCheck,
    this.onTapForgotPassword
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapCheck.call(!isChecked),
      child: SizedBox(
        width: 450.w,
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (_) => onTapCheck.call(_!),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),),
                ),
                SizedBox(width: 8.w,),
                Text('remember_me'.tr, style: AppStyle.styleRememberMeText,)
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () => onTapForgotPassword?.call(),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero
              ),
              child: Text('forgot_password'.tr),

            ),
          ],
        ),
      ),
    );
  }
}
