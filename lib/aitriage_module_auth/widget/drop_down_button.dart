import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_border_wrapper.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';

class DropDownButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? title;
  final bool? shouldIncludeAsterisk;
  final double? dropDownWidth;
  final double? dropDownHeight;
  final List<Widget>? children;
  final Function(int)? onTapChildren;
  final Widget? placeHolder;

  const DropDownButton({
    super.key,
    this.width,
    this.height,
    this.title,
    this.shouldIncludeAsterisk,
    this.dropDownWidth,
    this.dropDownHeight,
    this.children,
    this.onTapChildren,
    this.placeHolder
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
  var index = 0;
  var enablePlaceHolder = false;

  @override
  void initState() {
    super.initState();
    if (widget.placeHolder != null) enablePlaceHolder = true;
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
              width: widget.width ?? 360.w,
              height: widget.height ?? 44.h,
              child: Stack(
                children: [
                  (enablePlaceHolder)
                      ? widget.placeHolder!
                      : widget.children?[index] ?? const SizedBox(),
                  Positioned(
                      bottom: 10.h,
                      right: 14.w,
                      child: SvgIconWidget(
                          name: AppImage.svgDropDownArrow, size: 16.r))
                ],
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
            width: widget.dropDownWidth ?? widget.width ?? 200,
            height: widget.dropDownHeight ?? 200,
            child: CompositedTransformFollower(
              offset: Offset(0, 50 + 22.h),
              link: layerLink,
              child: TapRegion(
                onTapOutside: (_) {
                  tapOutSideAndHideOverlay = true;
                  _hideOverLay();
                },
                behavior: HitTestBehavior.translucent,
                child: BaseBorderWrapper(
                  width: widget.width,
                  height: 200,
                  child: ListView(
                    children: widget.children?.map((e) => GestureDetector(
                        onTap: () {
                          enablePlaceHolder = false;
                          final newIndex = widget.children?.indexOf(e);
                          widget.onTapChildren?.call(newIndex!);
                          _hideOverLay();
                          setState(() {
                            index = newIndex!;
                          });
                        },
                        child: e)).toList() ?? [],
                  ),
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
}

class CountryWidget extends StatelessWidget {
  final bool? isNetworkIcon;
  final String? leftIconName;
  final String? contentText;
  final TextStyle? contentTextStyle;
  final double? width;
  final double? height;

  const CountryWidget({
    super.key,
    this.isNetworkIcon,
    this.leftIconName,
    this.contentText,
    this.contentTextStyle,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
      width: width ?? 360.w,
      height: height ?? 44.h,
      child: Row(
        children: [
          if (isNetworkIcon == true) CachedNetworkImage(
            imageUrl: leftIconName!,
            placeholder: (_, __) => SizedBox(width: 24.r),
            errorWidget: (_, __, ___) => SizedBox(width: 24.r),
            fadeInDuration: Duration.zero,
            fadeOutDuration: Duration.zero,
          ),
          if (_isSvg == true && isNetworkIcon == false) SvgIconWidget(name: leftIconName!, size: 24.r),
          if (_isSvg == false && isNetworkIcon == false) Image.asset(leftIconName!, width: 24.r, height: 24.r),
          if (leftIconName != null) SizedBox(width: 8.w),
          Expanded(
            child: Text(
                contentText ?? '',
                style: contentTextStyle ?? AppStyle.styleTextDropDownButton,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
            ),
          ),
          SizedBox(width: 16.r, height: 16.r)
        ],
      ),
    );
  }

  bool? get _isSvg => leftIconName?.contains('.svg');
}
