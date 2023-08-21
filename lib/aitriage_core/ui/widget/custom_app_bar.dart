import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final double height;
  final Widget? leading;
  final String? title;
  final Widget? searchBar;
  final double? searchBarWidth;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    this.height = 100,
    this.leading,
    this.title,
    this.trailing,
    this.searchBar,
    this.searchBarWidth = 300
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorAppBackground,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            leading ?? const SizedBox(),
            (leading == null) ? const SizedBox() : const SizedBox(width: 12,),
            (title == null) ? const SizedBox() : Text(title!, style: AppStyle.styleTextDashboardTitle,),
            const Spacer(),
            SizedBox(width: searchBarWidth,child: (searchBar != null) ? searchBar! : const SizedBox()),
            const SizedBox(width: 20,),
            (trailing == null) ? const SizedBox() : Container(
              height: 50,
                decoration: BoxDecoration(
                  color: AppColor.colorBackgroundSearch,
                  border: Border.all(color: AppColor.colorBackgroundSearch),
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: trailing!,
                )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}

class SearchAppBar extends StatefulWidget{
  final String? placeholder;
  final Function(String)? onTextChange;
  final bool shouldShowSearchIcon;
  const SearchAppBar({
    super.key,
    this.placeholder,
    this.onTextChange,
    this.shouldShowSearchIcon = true
  });

  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<SearchAppBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColor.colorBackgroundSearch,
        border: Border.all(color: AppColor.colorBackgroundSearch),
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            onChanged: widget.onTextChange,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              border: InputBorder.none
            ),

          ).paddingOnly(left: 16),
          widget.shouldShowSearchIcon ? const Icon(Icons.search).paddingOnly(right: 16) : const SizedBox(),
        ],
      ),
    );
  }
}
