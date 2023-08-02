import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExampleModulePageRoute {
  static const root = '/first_module';
  static const firstPage = '$root/first_page';
  static const secondPage = '$root/second_page';

  ExampleModulePageRoute._();

  static List<GetPage> createRoutes() {
    return [
      GetPage(
        name: root,
        page: () => const Placeholder(),
        binding: BindingsBuilder(() {
        }),
      ),
    ];
  }
}