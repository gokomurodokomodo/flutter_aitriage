import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/svg_icon_widget.dart';

class CustomNavigationRail extends StatefulWidget {
  final Widget? leading;
  final Widget? trailing;
  final double? width;
  final EdgeInsetsGeometry? leadingPadding;
  final int currentItem;
  final List<CustomNavigationRailItem>? itemList;
  final double? itemPadding;
  final BoxDecoration? currentItemDecoration;
  final Color backgroundColorSelectedItem;

  const CustomNavigationRail(
      {super.key,
      this.leading,
      this.trailing,
      this.width,
      this.leadingPadding,
      this.currentItem = 0,
      this.itemList,
      this.itemPadding,
      this.currentItemDecoration,
      this.backgroundColorSelectedItem = AppColor.colorRailHover});

  @override
  State<StatefulWidget> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  late int currentIndex;
  late List<CustomNavigationRailItem> itemList;
  @override
  void initState() {
    currentIndex = widget.currentItem;
    itemList = widget.itemList ?? List<CustomNavigationRailItem>.empty();
      if(itemList.isEmpty){
      } else {
        itemList.elementAt(currentIndex).isActive = true;
      }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Visibility(
            visible: widget.leading != null,
            child: Padding(
              padding: widget.leadingPadding ??
                  const EdgeInsets.only(top: 30, bottom: 30),
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
                    if(index == currentIndex) {
                      return Column(
                        children: [
                          Container(
                              decoration: widget.currentItemDecoration ?? BoxDecoration(
                                color: widget.backgroundColorSelectedItem,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: itemList.elementAt(index))),
                          SizedBox(height: widget.itemPadding ?? 30,)
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  itemList.elementAt(currentIndex).isActive = false;
                                  currentIndex = index;
                                  itemList.elementAt(currentIndex).isActive = true;
                                });
                              },
                              child: itemList.elementAt(index)),
                          SizedBox(height: widget.itemPadding ?? 30,)
                        ],
                      );
                    }
                  },
                ),
              )),
          Visibility(
            visible: widget.trailing != null,
            child: Padding(
              padding: widget.leadingPadding ??
                  const EdgeInsets.only(bottom: 30),
              child: widget.trailing,
            ),
          ),
        ],
      ),
    );
  }
}

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
      this.iconSize = 30});

  @override
  Widget build(BuildContext context) {
    final Widget icActiveIcon;
    final Widget icInactiveIcon;
    if(inactiveIcon.contains('svg')){
      icInactiveIcon = SvgIconWidget(name: inactiveIcon,size: iconSize,);
    } else{
      icInactiveIcon = Image.asset(inactiveIcon, width: iconSize,);
    }
    if(activeIcon != null){
      if(activeIcon!.contains('svg')){
        icActiveIcon = SvgIconWidget(name: activeIcon!,size: iconSize,);
      } else{
        icActiveIcon = Image.asset(activeIcon!, width: iconSize,);
      }
    } else{
      icActiveIcon = icInactiveIcon;
    }

    return Column(
      children: [
        isActive ? icActiveIcon : icInactiveIcon
      ],
    );
  }
}
