import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_navigation_rail.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_navigator.dart';
import 'package:flutter_aitriage/aitriage_module_auth/config/auth_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_auth/widget/drop_down_button.dart';
import 'package:flutter_aitriage/aitriage_module_main/feature/home_main/home_main_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../../aitriage_core/ui/widget/custom_trailing_widget.dart';
import '../../../aitriage_core/ui/widget/keep_alive_wrapper.dart';
import '../../../aitriage_core/ui/widget/svg_icon_widget.dart';
import '../../../aitriage_module_patient/config/patient_module_navigator.dart';
import '../../../aitriage_module_setting/config/setting_navigator.dart';

final modules = <Widget>[
  const KeepAliveWrapper(child: AssessmentModuleNavigator()),
  const KeepAliveWrapper(child: PatientModuleNavigator()),
];


class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(tablet: _Tablet(), phone: _Phone());
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  final controller = Get.find<HomeMainController>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Row(
          children: [
            SizedBox(
              width: 100.w,
              child: CustomNavigationRail(
                leading: Obx(() => DropDownWrapper(
                      shouldChangePlaceholder: false,
                      placeHolder: SizedBox(
                          width: 60.r,
                          height: 60.r,
                          child: CircleAvatar(
                              radius: 25,
                              foregroundImage: (controller.vm.value.currentLocationAvatar.isNotEmpty) ? NetworkImage(
                                controller.vm.value.currentLocationAvatar,
                              ) : null)),
                      dropDownAlign: DropDownAlign.topRightToRight,
                      shouldReplacePlaceHolder: false,
                      shouldShowBorderPlaceHolder: false,
                      width: 60.r,
                      height: 60.r,
                      dropDownWidth: 400.w,
                      dropDownHeight: 450.h,
                      onTapChildren: (index) => controller.changeLocation(index),
                      children: controller.locations
                          .map((e) => Container(
                                padding: EdgeInsets.only(
                                    top: 12.r,
                                    left: 24.w,
                                    right: 24.w,
                                    bottom: 12.r),
                                child: LocationWidget(
                                    name: e.name,
                                    address: e.address,
                                    avatar: e.avatar),
                              ))
                          .toList(),
                    )),
                itemList: [
                  CustomNavigationRailItem(
                    inactiveIcon: AppImage.svgAssessmentModuleInactive,
                    activeIcon: AppImage.svgAssessmentModuleActive,
                  ),
                  CustomNavigationRailItem(
                    inactiveIcon: AppImage.svgPatientModuleInactive,
                    activeIcon: AppImage.svgPatientModuleActive,
                  ),
                  // CustomNavigationRailItem(
                  //   inactiveIcon: AppImage.svgHelpInactive,
                  //   activeIcon: AppImage.svgHelpActive,
                  // ),
                  // CustomNavigationRailItem(
                  //   inactiveIcon: AppImage.svgInfoInactive,
                  //   activeIcon: AppImage.svgInfoActive,
                  // ),
                  // CustomNavigationRailItem(
                  //   inactiveIcon: AppImage.svgSettingInactive,
                  //   activeIcon: AppImage.svgSettingActive,
                  // ),
                ],
                onNavigationItemClick: (index) {
                  pageController.jumpToPage(index);
                  controller.onTapNavigation(index);
                }
              ),
            ),
            Column(children: [
              SizedBox(
                width: Get.width - 100.w,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  child: Row(
                    children: [
                      Obx(() => Text(controller.vm.value.currentModuleTitle, style: AppStyle.styleTextDashboardTitle)),
                      const Spacer(),
                      CustomTrailingWidget(
                          child: SvgIconWidget(
                              name: AppImage.svgWifi, size: 24.r)),
                      SizedBox(width: 20.w),
                      CustomTrailingWidget(
                          child: SvgIconWidget(
                              name: AppImage.svgNotification, size: 24.r)),
                      SizedBox(width: 20.w),
                      CustomTrailingWidget(
                          child: SvgIconWidget(
                              name: AppImage.svgGift, size: 24.r)),
                      SizedBox(width: 20.w),
                      DropDownWrapper(
                        shouldReplacePlaceHolder: false,
                        shouldShowBorderPlaceHolder: false,
                        dropDownAlign: DropDownAlign.bottomRightToLeft,
                        width: 40.r,
                        height: 40.r,
                        dropDownWidth: 205.w,
                        dropDownHeight: 176.h,
                        shouldColorItemSelected: false,
                        placeHolder: SizedBox(
                          height: 40.r,
                          width: 40.r,
                          child: Obx(() => (controller.vm.value.userAvatar.isNotEmpty)
                              ? CachedNetworkImage(
                                  imageUrl: controller.vm.value.userAvatar,
                                  errorWidget: (_, __, ___) => Image.asset(AppImage.icDefaultUserAvatar))
                              : const SizedBox()),
                        ),
                        onTapChildren: (index) async {
                          await controller.onTapUserButton(index);

                          switch (index) {
                            case 3:
                              Get.offAllNamed(AuthModulePageRoute.signIn,
                                  predicate: (route) => false);
                              break;
                            default:
                              break;
                          }
                        },
                        children: [
                          SizedBox(height: 20.h),
                          Obx(() => UserChoiceWidget(
                                  image: AppImage.svgUserChoiceUserAvatar,
                                  title: controller.vm.value.userDisplayName)
                              .marginOnly(bottom: 24.h, left: 20.w)),
                          const UserChoiceWidget(
                                  image: AppImage.svgUserChoiceSwitchAccount,
                                  title: 'Switch account')
                              .marginOnly(bottom: 24.h, left: 20.w),
                          const UserChoiceWidget(
                                  image: AppImage.svgUserChoiceLogOut,
                                  title: 'Log out')
                              .marginOnly(left: 20.w),
                          SizedBox(height: 20.h),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: Get.width - 100.w,
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: modules,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class _Phone extends GetView<HomeMainController> {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // return Scaffold(
    //   backgroundColor: AppColor.colorAppBackground,
    //   body: PageView(
    //     controller: controller.pageController,
    //     physics: const NeverScrollableScrollPhysics(),
    //     children: controller.modules,
    //   ),
    //   bottomNavigationBar: Obx(() => BottomNavigationBar(
    //     currentIndex: controller.currentIndex.value,
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     onTap: (index) => controller.updateTabBarViewIndex(index),
    //     items: <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //           label: 'Overview',
    //           icon: SvgIconWidget(name: AppImage.svgOverviewInactive),
    //           activeIcon: SvgIconWidget(name: AppImage.svgOverviewActive)),
    //       BottomNavigationBarItem(
    //           label: 'Assessment',
    //           icon: SvgIconWidget(name: AppImage.svgAssessmentInactive),
    //           activeIcon: SvgIconWidget(name: AppImage.svgAssessmentActive)),
    //       BottomNavigationBarItem(
    //           label: 'Setting',
    //           icon: SvgIconWidget(name: AppImage.svgSettingInactive),
    //           activeIcon: SvgIconWidget(name: AppImage.svgSettingActive)),
    //     ],
    //   )),
    // );
  }
}
