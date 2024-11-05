import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_structure/features/shop/screens/home/widgets/home_spend_collect_text.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/device/device_utility.dart';

class ContainerMoneySevice extends StatelessWidget {
  const ContainerMoneySevice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
      child: CircularContainer(
        height: 100,
        width: TDeviceUtils.getScreenHeight(),
        radius: 15,
        padding: TSize.defaultSpace,
        backgroundColor: TColors.grey.withOpacity(0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // spending and collecting
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeSpendCollectText(title: 'Thu', color: Colors.teal,money: 1000,),
                const SizedBox(
                  height: TSize.spaceBtwItems / 2,
                ),
                HomeSpendCollectText(title: 'Chi', color: Colors.redAccent),
              ],
            ),

            // divider
            VerticalDivider(
              width: 20,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.white,
            ),

            // pie chart
            Container(
              height: 60,
              width: 60,
              child: PieChart(PieChartData(sections: [
                PieChartSectionData(
                  value: 10,
                  color: Colors.teal,
                  radius: 15,
                  showTitle: false
                ),
                PieChartSectionData(
                    value: 5,
                    color: Colors.redAccent,
                    radius: 15,
                  showTitle: false
                ),
              ]),),
            )
          ],
        ),
      ),
    );
  }
}
