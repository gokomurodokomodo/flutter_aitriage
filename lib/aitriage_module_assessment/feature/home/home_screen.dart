import 'package:flutter/material.dart';
import 'package:flutter_aitriage/aitriage_module_assessment/widget/risk_with_symbol.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../aitriage_core/common/app_color.dart';
import '../../../aitriage_core/ui/widget/dashboard_item_view.dart';
import '../../../aitriage_core/ui/widget/device_detector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceDetector(tablet: _Tablet(), phone: _Phone());
  }
}

class _Tablet extends StatelessWidget {
  const _Tablet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorAppBackground,
      body: Container(
        color: AppColor.colorBackgroundSearch,
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150.h,
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    final itemWidth = (constraints.maxWidth - 72.w) / 4;
                    return Row(
                      children: [
                        DashboardItemView(
                            icon: const RiskWithSymbol(risk: Risk.total),
                            width: itemWidth,
                            label: 'Total Assessment',
                            amount: '100,000'),
                        SizedBox(width: 24.w),
                        DashboardItemView(
                            icon: const RiskWithSymbol(risk: Risk.low),
                            width: itemWidth,
                            label: 'Low risk',
                            amount: '80,000'),
                        SizedBox(width: 24.w),
                        DashboardItemView(
                            icon: const RiskWithSymbol(risk: Risk.medium),
                            width: itemWidth,
                            label: 'Medium risk',
                            amount: '5,000'),
                        SizedBox(width: 24.w),
                        DashboardItemView(
                            icon: const RiskWithSymbol(risk: Risk.high),
                            width: itemWidth,
                            label: 'High risk',
                            amount: '15,000')
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Phone extends StatelessWidget {
  const _Phone();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


