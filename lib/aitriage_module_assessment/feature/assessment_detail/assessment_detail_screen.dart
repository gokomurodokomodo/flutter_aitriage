import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/config/assessment_module_page_route.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/feature/assessment_detail/assessment_detail_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/common/app_image.dart';
import '../../../aitriage_core/common/app_style.dart';
import '../../../aitriage_core/ui/widget/svg_icon_widget.dart';
import '../../widget/assessment_detail_widget.dart';

class AssessmentDetailScreen extends StatelessWidget {
  const AssessmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _Tablet(),
        phone: Placeholder()
    );
  }
}

class _Tablet extends StatefulWidget {
  const _Tablet();

  @override
  State<_Tablet> createState() => _TabletState();
}

class _TabletState extends State<_Tablet> {
  final controller = Get.find<AssessmentDetailController>();
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorBackgroundSearch,
      body: Column(
        children: [
          Container(
              height: 80.h,
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                color: AppColor.colorAppBackground,
              ),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                GestureDetector(
                    onTap: () => Get.back(
                        id: AssessmentModulePageRoute.nestedId,
                        // result: controller.vm.value.shouldReloadData
                    ),
                    child: Row(
                      children: [
                        SvgIconWidget(name: AppImage.svgArrowLeft),
                        SizedBox(width: 8.w),
                        Text('Back', style: AppStyle.styleTextUserChoice),
                      ],
                    )),
                const Spacer(),
              ])),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 24.w),
                AssessmentDetailWidget(
                  // vm: controller.vm.value,
                  onTap: (index) {
                    // controller.handleOnTapPatientDetailWidget(index);
                    pageViewController.jumpToPage(index);
                  },
                  // onTapAvatar: () {
                  //   onSuccess() {
                  //     Get.snackbar('Message', 'Avatar upload success');
                  //   }
                  //   onError(message) {
                  //     Get.snackbar('Error', message);
                  //   }
                  //   Get.snackbar('Message', 'Avatar is uploading');
                  //   controller.onTapAvatar(
                  //       onSuccess: onSuccess, onError: onError);
                  // },
                  // onTapPrimaryButton: () {
                  //   final alert = AlertUtil.showLoadingIndicator();
                  //   onSuccess() {
                  //     AlertUtil.hideLoadingIndicator(alert);
                  //     Get.back(
                  //         id: PatientModulePageRoute.nestedId,
                  //         result: controller.vm.value.shouldReloadData);
                  //     Get.snackbar(
                  //         'Success', 'Successfully deleted patient');
                  //   }
                  //   onError(message) {
                  //     AlertUtil.hideLoadingIndicator(alert);
                  //     Get.snackbar('Error', message);
                  //   }
                  //   controller.onTapDeleteButton(
                  //       onSuccess: onSuccess, onError: onError);
                  // }
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      color: AppColor.colorAppBackground,
                    ),
                    child: PageView(
                      controller: pageViewController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // Obx(() => PatientDetailInformation(vm: controller.vm.value)),
                        // Obx(() => PatientDetailAssessment(
                        //   list: controller.vm.value.listAssessmentVM,
                        //   totalPage: controller.vm.value.assessmentTotalPage,
                        //   pageCountString: controller.vm.value.assessmentPageCountString,
                        //   onPageChanged: (index) => controller.getListAssessment(index),
                        // )),
                        // Obx(() => PatientDetailNote(
                        //   list: controller.vm.value.listNoteVM,
                        //   totalPage: controller.vm.value.noteTotalPage,
                        //   pageCountString: controller.vm.value.notePageCountString,
                        //   onPageChanged: (index) => controller.getListNote(index),
                        //   onTapNote: (noteId, description) {
                        //     Get.dialog(
                        //         AddNoteDialog(
                        //           title: 'NOTE',
                        //           primaryButtonTitle: 'Save',
                        //           secondaryButtonTile: 'Delete',
                        //           initText: description,
                        //           onTapSecondaryButton: () {
                        //             onSuccess() {
                        //               Get.back();
                        //               controller.reloadListNote();
                        //               Get.snackbar('Success', 'Successfully deleted note');
                        //             }
                        //             onError(String message) {
                        //               Get.snackbar('Error', message);
                        //             }
                        //             controller.onTapDeleteNote(noteId, onSuccess: onSuccess, onError: onError);
                        //           },
                        //           onTapPrimaryButton: (text) {
                        //             onSuccess() {
                        //               Get.back();
                        //               controller.reloadListNote();
                        //               Get.snackbar('Success', 'Successfully edited note');
                        //             }
                        //             onError(String message) {
                        //               Get.snackbar('Error', message);
                        //             }
                        //             controller.onTapEditNote(noteId, text, onSuccess: onSuccess, onError: onError);
                        //           },
                        //         )
                        //     );
                        //   },
                        // ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

