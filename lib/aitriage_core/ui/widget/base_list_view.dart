import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_image.dart';
import '../../common/app_style.dart';
import 'line_separated.dart';

class BaseListView extends StatefulWidget {
  final List<Widget> children;
  final Function(int)? onTapItem;
  final bool shouldJumpToTopWhenStateChange;
  final Widget? separator;

  const BaseListView({
    super.key,
    required this.children,
    this.onTapItem,
    this.shouldJumpToTopWhenStateChange = true,
    this.separator
  });

  @override
  State<BaseListView> createState() => _BaseListViewState();
}

class _BaseListViewState extends State<BaseListView> {
  final scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (scrollController.hasClients && widget.shouldJumpToTopWhenStateChange) {
      scrollController.jumpTo(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.children.isNotEmpty
        ? ListView.separated(
            itemBuilder: (_, int index) => GestureDetector(
                onTap: () => widget.onTapItem?.call(index),
                behavior: HitTestBehavior.translucent,
                child: widget.children[index]),
            separatorBuilder: (_, int index) => widget.separator ?? const LineSeparated(),
            itemCount: widget.children.length,
            controller: scrollController)
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImage.icListViewNoData),
                SizedBox(height: 8.h),
                Text('No data', style: AppStyle.styleTextAllPatientCategory)]));
  }
}
