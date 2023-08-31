import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_image.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_border_wrapper.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';

class DropDownButton extends StatefulWidget {
  final double? dropDownWidth;
  final double? dropDownHeight;
  final String? title;
  final bool? shouldIncludeAsterisk;
  final String? leftIconName;
  final String? contentText;
  final TextStyle? contentTextStyle;
  final bool? isNetworkIcon;

  const DropDownButton({
    super.key,
    this.dropDownWidth,
    this.dropDownHeight,
    this.title,
    this.shouldIncludeAsterisk,
    this.leftIconName,
    this.contentText,
    this.contentTextStyle,
    this.isNetworkIcon = false
  });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  OverlayEntry? overlayEntry;
  GlobalKey globalKey = GlobalKey();
  OverlayState? overlayState;
  final layerLink = LayerLink();
  var tapOutSideAndHideOverlay = false;
  var tapOutSideView = false;

  @override
  void initState() {
    super.initState();
    // final renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
    // final offset = renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (_) {
        if (!tapOutSideView && tapOutSideAndHideOverlay) {
          tapOutSideAndHideOverlay = false;
        } else {
          _showOverLay();
        }

        tapOutSideView = false;
      },
      onTapOutside: (_) {
        tapOutSideView = true;
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: Column(
          key: globalKey,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.title != null) Text(widget.title!, style: AppStyle.styleTextButtonBackToLogin),
                if (widget.shouldIncludeAsterisk == true) Text('*', style: AppStyle.styleTextButtonBackToLogin.copyWith(color: AppColor.colorAsterisk))
              ],
            ),
            if (widget.title != null) SizedBox(height: 14.h),
            BaseBorderWrapper(
              width: widget.dropDownWidth ?? 360.w,
              height: widget.dropDownHeight ?? 44.h,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.isNetworkIcon == true) CachedNetworkImage(
                      imageUrl: widget.leftIconName!,
                      placeholder: (_, __) => SizedBox(width: 24.r),
                      errorWidget: (_, __, ___) => SizedBox(width: 24.r),
                      fadeInDuration: Duration.zero,
                      fadeOutDuration: Duration.zero,
                    ),
                    if (_isSvg == true && widget.isNetworkIcon == false) SvgIconWidget(name: widget.leftIconName!, size: 24.r),
                    if (_isSvg == false && widget.isNetworkIcon == false) Image.asset(widget.leftIconName!, width: 24.r, height: 24.r),
                    if (widget.leftIconName != null) SizedBox(width: 8.w),
                    Text(widget.contentText ?? '', style: widget.contentTextStyle ?? AppStyle.styleTextDropDownButton),
                    const Spacer(),
                    SvgIconWidget(name: AppImage.svgDropDownArrow, size: 16.r)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showOverLay() async {
    overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
            width: 50,
            height: 100,
            child: CompositedTransformFollower(
              offset: Offset(0, 50 + 22.h),
              link: layerLink,
              child: TapRegion(
                onTapInside: (_) {
                  _hideOverLay();
                },
                onTapOutside: (_) {
                  tapOutSideAndHideOverlay = true;
                  _hideOverLay();
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            )
        )
    );

    if (!overLayIsShown) overlayState?.insert(overlayEntry!);

  }

  void _hideOverLay() {
    if (overLayIsShown) {
      overlayEntry?.remove();
      setState(() {});
    }
  }

  bool get overLayIsShown => overlayEntry!.mounted;

  bool? get _isSvg => widget.leftIconName?.contains('.svg');
}
