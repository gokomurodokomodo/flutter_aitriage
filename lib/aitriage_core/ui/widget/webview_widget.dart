import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../common/app_color.dart';

class CustomWebviewWidget extends StatelessWidget{
  final String title;
  final String url;

  const CustomWebviewWidget({super.key, required this.title, required this.url});


  
  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(AppColor.colorAppBackground)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
          ),
        )
        ..loadRequest(Uri.parse(url));
    return Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){Get.back();},),
          title: title,),
        body: WebViewWidget(controller: controller),
    );
  }

}