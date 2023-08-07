import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/custom_expansion_tile_phone.dart';
import 'package:flutter_aitriage/aitriage_core/ui/widget/device_detector.dart';
import 'package:flutter_aitriage/aitriage_module_overview/config/overview_route.dart';
import 'package:flutter_aitriage/aitriage_module_overview/feature/home_overview/home_overview_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeOverviewScreen extends StatelessWidget {
  const HomeOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(
        tablet: _HomeOverviewScreenTablet(),
        phone: _HomeOverviewScreenPhone()
    );
  }
}

class _HomeOverviewScreenTablet extends GetView<HomeOverviewController> {
  const _HomeOverviewScreenTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _HomeOverviewScreenPhone extends GetView<HomeOverviewController> {
  const _HomeOverviewScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Dashboard'),
            Spacer(),
            Icon(Icons.search),
            Icon(Icons.notification_important)
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 128.w,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i< 10; i++) Container(
                  width: 280.w,
                  color: Colors.cyanAccent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text('Patients'),
                          Spacer(),
                          Icon(Icons.people)
                        ],
                      ),
                      const Text('10,000'),
                      Container(
                        width: 71.w,
                        height: 24.w,
                        child: const Row(
                          children: [
                            Text('+0.05'),
                            Icon(Icons.arrow_upward_sharp)
                          ],
                        ),
                      )
                    ],
                  ),
                ).paddingOnly(right: 16.w)
              ],
            ),
          ),
          SizedBox(height: 10.w),
          Row(
            children: [
              const Text('All Patients'),
              const Spacer(),
              GestureDetector(
                  onTap: () => Get.toNamed(OverviewRoute.allPatients, id: OverviewRoute.nestedId),
                  child: const Text('See all'))
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < 10; i++) const CustomExpansionTilePhone().marginOnly(bottom: 10.w)
              ],
            ),
          )
        ],
      )
    );
  }
}


