import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/base_border_wrapper.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../aitriage_core/common/app_color.dart';
import '../../aitriage_core/common/app_image.dart';

enum DropDownAlign { topRightToRight, bottomLeftToRight , topLeftToRight, bottomRightToLeft}

class DropDownWrapper extends StatefulWidget {
  final double? width;
  final double? height;
  final String? title;
  final bool? shouldIncludeAsterisk;
  final double? dropDownWidth;
  final double? dropDownHeight;
  final List<Widget>? children;
  final Function(int)? onTapChildren;
  final Widget? placeHolder;
  final int chooseIndex;
  // Change drop down align
  final DropDownAlign dropDownAlign;
  // In case you just want open drop down like notification with static placeholder
  final bool shouldReplacePlaceHolder;
  final bool shouldShowBorderPlaceHolder;
  final bool shouldEnableDropDown;
  final bool shouldColorItemSelected;

  const DropDownWrapper({
    super.key,
    this.width,
    this.height,
    this.title,
    this.shouldIncludeAsterisk,
    this.dropDownWidth,
    this.dropDownHeight,
    this.children,
    this.onTapChildren,
    this.placeHolder,
    this.chooseIndex = 0,
    this.dropDownAlign = DropDownAlign.bottomLeftToRight,
    this.shouldReplacePlaceHolder = true,
    this.shouldShowBorderPlaceHolder = true,
    this.shouldEnableDropDown = true,
    this.shouldColorItemSelected = true
  });

  @override
  State<DropDownWrapper> createState() => _DropDownWrapperState();
}

class _DropDownWrapperState extends State<DropDownWrapper> {
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
    index = widget.chooseIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        TapRegion(
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
            child: BaseBorderWrapper(
              key: GlobalKey(),
              width: widgetWidth,
              height: widgetHeight,
              shouldShowBorder: widget.shouldShowBorderPlaceHolder,
              backgroundColor: !widget.shouldEnableDropDown ? AppColor.colorSelectedLocationBackground : null,
              child: Stack(
                children: [
                  Container(
                    child: (enablePlaceHolder || !widget.shouldReplacePlaceHolder)
                        ? widget.placeHolder
                        : (widget.children == null)
                            ? const SizedBox()
                            : widget.children!.length <= index
                                ? const SizedBox()
                                : widget.children![index],
                  ),
                  if (widget.shouldReplacePlaceHolder) Positioned(
                      bottom: 13.h,
                      right: 14.w,
                      child: Center(
                        child: SvgIconWidget(
                            name: AppImage.svgDropDownArrow, size: 16.r),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _showOverLay() async {
    if (!widget.shouldEnableDropDown) return;

    overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
        builder: (_) => Positioned(
            width: dropDownWidth,
            height: dropDownHeight,
            child: CompositedTransformFollower(
              offset: dropDownOffSet,
              link: layerLink,
              child: TapRegion(
                onTapOutside: (_) {
                  tapOutSideAndHideOverlay = true;
                  _hideOverLay();
                },
                behavior: HitTestBehavior.translucent,
                child: Material(
                  color: Colors.transparent,
                  child: BaseBorderWrapper(
                    width: widget.width,
                    height: 200,
                    child: ListView(
                      children: widget.children?.map((e) => Container(
                        color: widget.children?.indexOf(e) == index && widget.shouldColorItemSelected
                            ? AppColor.colorSelectedLocationBackground
                            : Colors.transparent,
                        child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              enablePlaceHolder = false;
                              final newIndex = widget.children?.indexOf(e);
                              widget.onTapChildren?.call(newIndex!);
                              _hideOverLay();
                              setState(() {
                                index = newIndex!;
                              });
                            },
                            child: e),
                      )).toList() ?? [],
                    ),
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

  double get defaultHeight => 44.h;

  double get defaultWidth => 360.w;

  bool get overLayIsShown => overlayEntry!.mounted;

  double get widgetHeight => widget.height ?? defaultHeight;

  double get widgetWidth => widget.width ?? defaultWidth;

  double get dropDownHeight => widget.dropDownHeight ?? widgetHeight;

  double get dropDownWidth => widget.dropDownWidth ?? widgetWidth;

  Offset get dropDownOffSet {
    switch (widget.dropDownAlign) {
      case DropDownAlign.bottomLeftToRight:
        return Offset(0, widgetHeight);
      case DropDownAlign.topRightToRight:
        return Offset(widgetWidth + 20, 0);
      case DropDownAlign.topLeftToRight:
        return Offset(-20 - dropDownWidth, 0);
      case DropDownAlign.bottomRightToLeft:
        return Offset(- dropDownWidth + widgetWidth, widgetHeight + 20);
    }
  }
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
      color: Colors.white,
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
                style: (contentTextStyle ?? AppStyle.styleTextDropDownButton).copyWith(decoration: TextDecoration.none),
                // overflow: TextOverflow.ellipsis,
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

class LocationWidget extends StatelessWidget {
  final String? name;
  final String? address;
  final String? avatar;
  
  const LocationWidget({
    super.key,
    required this.name,
    required this.address,
    required this.avatar
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(avatar ?? '', width: 48.r, height: 48.r, errorBuilder: (_, __, ___) {
          return SizedBox(width: 48.r, height: 48.r);
        },),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name ?? '', style: AppStyle.styleTextLocationTitle),
            Text(address ?? '', style: AppStyle.styleAssessmentItemLabel)
          ],
        )
      ],
    );
  }
}

class UserChoiceWidget extends StatelessWidget {
  final String image;
  final String title;
  
  const UserChoiceWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIconWidget(name: image, size: 24.r),
        SizedBox(width: 16.w),
        Text(title, style: AppStyle.styleTextUserChoice)
      ],
    );
  }
}


