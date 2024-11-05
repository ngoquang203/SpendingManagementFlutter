
import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_structure/features/shop/screens/analyst/analyst.dart';
import 'package:flutter_structure/features/shop/screens/income/income.dart';
import 'package:flutter_structure/features/shop/screens/outcome/outcome.dart';
import 'package:flutter_structure/features/shop/screens/planmoney/plan_money.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeListViewDevices extends StatefulWidget {
  const HomeListViewDevices({
    super.key,
  });

  @override
  State<HomeListViewDevices> createState() => _HomeListViewDevicesState();
}

class _HomeListViewDevicesState extends State<HomeListViewDevices> {
  final List<IconData> iconData = [Iconsax.money_recive,Iconsax.money_send,Iconsax.wallet,Iconsax.chart_success];
  final List<String> title = ["Thêm thu","Thêm chi","Kế hoạch","Phân tích"];
  final List<Color> iconColor = [Colors.green,Colors.red,Colors.amber,Colors.orange];
  final List<void Function()> onTap = [
    () => {
      Get.to(() => const InCome())
    },
        () => {
      Get.to(() => const OutCome())
    },
        () => {
      Get.to(() => const PlanMoney())
    },
        () => {
      Get.to(() => const Analyst())
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(iconData: iconData[index],iconColor: iconColor[index],title: title[index], onTap: onTap[index],);
        },
      ),
    );
  }
}