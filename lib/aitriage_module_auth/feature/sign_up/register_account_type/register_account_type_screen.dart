import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/data/repository/sign_up_repository.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/get_register_account_type_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/domain/use_case/register_uc.dart';
import 'package:flutter_aitriage/aitriage_module_auth/feature/sign_up/controller/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';
import '../../../../aitriage_core/service/hivi_service/hivi_service.dart';
import '../../../../aitriage_core/ui/widget/authentication_header.dart';
import '../../../domain/use_case/get_register_account_status_uc.dart';
import '../../../widget/auth_back_button.dart';
import '../../../widget/sign_up_icon_wrapper.dart';
import '../../../widget/step_count_widget.dart';

class RegisterAccountTypeScreen extends StatelessWidget{
  const RegisterAccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    Không put ở Binding vì Getx không remove GetxController khi gọi hàm Get.back()
    mà gọi sau khi có event khác được gọi ngay sau khi vừa back.
    Đưa vào hàm build sẽ bị delete khi view mất.
     */
    Get.put(SignUpRepositoryImpl());
    Get.put(RegisterUseCaseImpl(Get.find<SignUpRepositoryImpl>()));
    Get.put(GetRegisterAccountTypeUseCaseImpl());
    Get.put(GetRegisterAccountStatusUseCaseImpl());
    Get.put(
        SignUpController(
            Get.find<RegisterUseCaseImpl>(),
            Get.find<GetRegisterAccountStatusUseCaseImpl>(),
            Get.find<GetRegisterAccountTypeUseCaseImpl>()
        )
    );
    return DeviceDetector(
        tablet: _Tablet(),
        phone: _Phone());
  }
}

class _Tablet extends StatelessWidget{
  _Tablet();

  final SignUpController controller = Get.find();
  final hiviService = HiviService.instance;

  @override
  Widget build(BuildContext context) {
    
    
    return WillPopScope(
      onWillPop: () async {
        Get.delete<SignUpController>();
        return true;
        },
      child: Scaffold(
        backgroundColor: AppColor.colorAppBackground,
        body: Padding(
          padding: EdgeInsets.all(40.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: AuthBackButton(onTap: () async {
                    await Get.delete<SignUpController>();
                    Navigator.of(Get.context!).pop();
                  })),
              SizedBox(height: 60.h),
              AuthenticationHeader(
                svgIconName: AppImage.svgAppLogo,
                headerText: sprintf('start_your_trial'.tr, [hiviService.trialTime]),
                contentText: 'free_trial'.tr,
                styleContentText: AppStyle.styleCheckYourEmailNotification,
              ),
              SizedBox(height: 24.h),
              SizedBox(
                  width: (240.h * 3) + (24.w * 2),
                  child: const StepCountWidget(index: 1)),
              SizedBox(height: 40.h),
              Text('hospital_or_clinic'.tr, style: AppStyle.styleCheckYourEmailNotification),
              SizedBox(height: 24.h),
              Obx(() => Expanded(
                child: ListView.separated(
                  itemCount: controller.accountTypeVM.value.rowCount,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int rowIndex) {
                    final firstItemIndex = rowIndex * 3;
                    final secondItemIndex = rowIndex * 3 + 1;
                    final thirdItemIndex = rowIndex * 3 + 2;
    
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: controller.accountTypeVM.value.shouldShowThisItem(firstItemIndex),
                          child: SignUpIconWrapper(
                              onTap: () => _onTapButton(firstItemIndex),
                              title: controller.accountTypeVM.value.itemTitle(firstItemIndex),
                              isSelected: controller.accountTypeVM.value.isItemSelected(firstItemIndex),
                              child: CachedNetworkImage(
                                  width: 160.h,
                                  height: 160.h,
                                  imageUrl: controller.accountTypeVM.value.itemImageUrl(firstItemIndex)
                              )),
                        ),
                        SizedBox(width: 24.w),
                        Visibility(
                          visible: controller.accountTypeVM.value.shouldShowThisItem(secondItemIndex),
                          child: SignUpIconWrapper(
                            onTap: () => _onTapButton(secondItemIndex),
                              title: controller.accountTypeVM.value.itemTitle(secondItemIndex),
                              isSelected: controller.accountTypeVM.value.isItemSelected(secondItemIndex),
                              child: CachedNetworkImage(
                                  width: 160.h,
                                  height: 160.h,
                                  imageUrl: controller.accountTypeVM.value.itemImageUrl(secondItemIndex)
                              )),
                        ),
                        SizedBox(width: 24.w),
                        Visibility(
                          visible: controller.accountTypeVM.value.shouldShowThisItem(thirdItemIndex),
                          child: SignUpIconWrapper(
                            onTap: () => _onTapButton(thirdItemIndex),
                              title: controller.accountTypeVM.value.itemTitle(thirdItemIndex),
                              isSelected: controller.accountTypeVM.value.isItemSelected(thirdItemIndex),
                              child: CachedNetworkImage(
                                  width: 160.h,
                                  height: 160.h,
                                  imageUrl: controller.accountTypeVM.value.itemImageUrl(thirdItemIndex)
                              )),
                        ),
                      ],
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 24.h),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapButton(int index) async {
    controller.onTapButton(index);
    await Get.toNamed(AuthModulePageRoute.registerAccountStatus);
    // controller.resetView();
  }
}

class _Phone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}