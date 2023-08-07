import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.hintText = '',
    this.leftIcon,
    this.rightIcon,
    this.controller
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          border: Border.all(color: Colors.blueAccent)
      ),
      child: Row(
        children: [
          if (widget.leftIcon != null) widget.leftIcon!.marginSymmetric(horizontal: 16.w),
          Expanded(
            child: TextField(
              controller: widget.controller,
              focusNode: focusNode,
              onTapOutside: (_) => focusNode.unfocus(),
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                isDense: true,
                isCollapsed: true,
              ),
            ),
          ),
          if (widget.rightIcon != null) widget.rightIcon!.marginSymmetric(horizontal: 16.w),
        ],
      )
    );
  }
}
