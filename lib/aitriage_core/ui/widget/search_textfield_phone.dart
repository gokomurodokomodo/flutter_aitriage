import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/common/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFieldPhone extends StatefulWidget {
  const SearchTextFieldPhone({super.key});

  @override
  State<SearchTextFieldPhone> createState() => _SearchTextFieldPhoneState();
}

class _SearchTextFieldPhoneState extends State<SearchTextFieldPhone> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          border: Border.all(color: Colors.blueAccent),
          color: AppColor.colorSearchBar
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(Icons.search),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              onTapOutside: (_) => focusNode.unfocus(),
              decoration: const InputDecoration(
                hintText: 'Search type of keywords',
                border: InputBorder.none,
                isDense: true,
                isCollapsed: true,
              ),
            ),
          ),
          const Icon(Icons.filter_list)
        ],
      ),
    );
  }
}
