import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationRail extends StatefulWidget {
  final Widget? leading;
  final Widget? trailing;
  final double? width;
  final EdgeInsetsGeometry? leadingPadding;
  final int currentItem;
  final List<CustomNavigationRailItem> itemList;
  final double? itemPadding;
  final BoxDecoration? currentItemDecoration;
  final Color backgroundColorSelectedItem;
  final Function(int)? onNavigationItemClick;

  const CustomNavigationRail(
      {super.key,
      this.leading,
      this.trailing,
      this.width,
      this.leadingPadding,
      this.currentItem = 0,
      required this.itemList,
      this.itemPadding,
      this.currentItemDecoration,
      this.onNavigationItemClick,
      this.backgroundColorSelectedItem = AppColor.colorRailHover});

  @override
  State<StatefulWidget> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail>
    with SingleTickerProviderStateMixin {
  late int currentIndex;
  late List<CustomNavigationRailItem> itemList;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentItem;
    itemList = widget.itemList;
    if (itemList.isEmpty) {
    } else {
      itemList.elementAt(currentIndex).isActive = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorAppBackground,
      child: Column(
        children: [
          Visibility(
            visible: widget.leading != null,
            child: Padding(
              padding: widget.leadingPadding ??
                  const EdgeInsets.only(top: 24, bottom: 24),
              child: widget.leading,
            ),
          ),
          Visibility(
              visible: itemList.isNotEmpty,
              child: SizedBox(
                height: 100.0 * itemList.length,
                child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == currentIndex) {
                      return Container(
                        height: 70,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: widget.currentItemDecoration ??
                                    BoxDecoration(
                                      color: widget.backgroundColorSelectedItem,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: itemList.elementAt(index))),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  _onItemTapped(index);
                                },
                                child:
                                    Center(child: itemList.elementAt(index))),
                          ],
                        ),
                      );
                    }
                  },
                ),
              )),
          Visibility(
            visible: widget.trailing != null,
            child: Padding(
              padding:
                  widget.leadingPadding ?? const EdgeInsets.only(bottom: 30),
              child: widget.trailing,
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _onItemTapped(int index) async {
    if (index == currentIndex) {
      return;
    }

    setState(() {
      itemList.elementAt(currentIndex).isActive = false;
      currentIndex = index;
      itemList.elementAt(currentIndex).isActive = true;
      widget.onNavigationItemClick?.call(currentIndex);
    });
  }
}

//ignore: must_be_immutable
class CustomNavigationRailItem extends StatelessWidget {
  final String inactiveIcon;
  final String? activeIcon;
  final String? label;
  bool isActive;
  final double iconSize;

  CustomNavigationRailItem(
      {super.key,
      required this.inactiveIcon,
      this.activeIcon,
      this.label,
      this.isActive = false,
      this.iconSize = 30,
      });

  @override
  Widget build(BuildContext context) {
    final Widget icActiveIcon;
    final Widget icInactiveIcon;
    if (inactiveIcon.contains('svg')) {
      icInactiveIcon = SvgIconWidget(
        name: inactiveIcon,
        size: iconSize,
      );
    } else {
      icInactiveIcon = Image.asset(
        inactiveIcon,
        width: iconSize,
      );
    }
    if (activeIcon != null) {
      if (activeIcon!.contains('svg')) {
        icActiveIcon = SvgIconWidget(
          name: activeIcon!,
          size: iconSize,
        );
      } else {
        icActiveIcon = Image.asset(
          activeIcon!,
          width: iconSize,
        );
      }
    } else {
      icActiveIcon = icInactiveIcon;
    }

    return Column(
      children: [isActive ? icActiveIcon : icInactiveIcon],
    );
  }
}
