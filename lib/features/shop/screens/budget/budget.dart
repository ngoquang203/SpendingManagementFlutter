import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'widget/piechart_page.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final List<PieChartSectionData> getSection = [
    PieChartSectionData(value: 10000, color: Colors.teal, title: 'Tiền lương'),
    PieChartSectionData(value: 20000, color: Colors.red, title: 'Tiền lãi'),
    PieChartSectionData(
        value: 30000, color: Colors.yellow, title: 'Kinh doanh'),
    PieChartSectionData(value: 50000, color: Colors.blue, title: 'Khác'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: TSize.defaultSpace,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
                child: IconButton(icon: const Icon(Iconsax.filter_edit),onPressed: () => Get.back(),),
              )
            ],
            title: Text(
              'Báo cáo',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            automaticallyImplyLeading: false,
            bottom: const TabBar(tabs: [
              Tab(
                child: Text('Tiền thu'),
              ),
              Tab(
                child: Text('Tiền chi'),
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              PieChartPageState(getSection: getSection,),
              PieChartPageState(getSection: getSection,),
            ],
          )),
    );
  }
}






