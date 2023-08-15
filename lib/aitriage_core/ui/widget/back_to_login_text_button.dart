import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_module_auth/config/auth_route.dart';
import '../../common/app_color.dart';
import '../../common/app_style.dart';
class BackToLoginTextButton extends StatelessWidget {
  const BackToLoginTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 450.w,
      child: TextButton(
        onPressed: () {
          Get.offNamed(AuthRoute.signIn);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back, size: 16, color: AppColor.colorRememberMeText,),
            SizedBox(width: 4.w,),
            Text('back_to_login'.tr, style: AppStyle.styleTextButtonBackToLogin,)
          ],
        ),
      ),
    );
  }
}