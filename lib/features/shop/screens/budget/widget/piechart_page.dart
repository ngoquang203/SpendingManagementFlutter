
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';

import 'sup_service_budget.dart';

class PieChartPageState extends StatelessWidget {
  const PieChartPageState({super.key, required this.getSection});

  final List<PieChartSectionData> getSection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            Container(
              height: 300,
              child: PieChart(
                PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 10,
                    sections: getSection
                        .map((data) => PieChartSectionData(
                      value: data.value,
                      color: data.color,
                      title: data.title,
                      radius: 120,
                    ))
                        .toList()),
                swapAnimationDuration: const Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ),
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getSection.length,
                itemBuilder: ((_, index) {
                  return SupServiceBudget(
                    title: getSection[index].title,
                    color: getSection[index].color,
                    money: getSection[index].value.toString(),
                  );
                }))
          ],
        ),
      ),
    );
  }
}