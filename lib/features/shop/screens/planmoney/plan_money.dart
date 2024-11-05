import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/appbar/appbar.dart';
import 'package:flutter_structure/common/widgets/button/custom_elevated_button.dart';
import 'package:flutter_structure/features/shop/screens/planmoney/add_plan/add_plan.dart';
import 'package:flutter_structure/features/shop/screens/planmoney/widget/custom_container_planmoney.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/variable/plan_money/image_planmoney.dart';
import 'package:get/get.dart';

class PlanMoney extends StatefulWidget {
  const PlanMoney({super.key});

  @override
  State<PlanMoney> createState() => _PlanMoneyState();
}

class _PlanMoneyState extends State<PlanMoney> {
  final bool index = false;

  final List<ImagePlanMoney> imagePlanMoney = [
    ImagePlanMoney(TImages.planMoney1, Colors.blue),
    ImagePlanMoney(TImages.planMoney2, Colors.amber),
    ImagePlanMoney(TImages.planMoney3, Colors.teal),
    ImagePlanMoney(TImages.planMoney4, Colors.orange),
    ImagePlanMoney(TImages.planMoney5, Colors.redAccent),
    ImagePlanMoney(TImages.planMoney6, Colors.blueGrey),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Kế hoạch',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: TSize.defaultSpace, vertical: TSize.defaultSpace / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TCustomButton(
                title: "Tạo kế hoạch mới",
                function: () => Get.to(const AddPlan()),
                color: Colors.amber,
              ),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              const Text("Quản lí kế hoạch"),
              const SizedBox(
                height: TSize.spaceBtwItems,
              ),
              index
                  ? const Expanded(
                      flex: 1,
                      child: Center(child: Text('Không có kế hoạch nào')))
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imagePlanMoney.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: TSize.spaceBtwItems / 2),
                          child: CustomContainerPlanMoney(
                            imagePlanMoney: imagePlanMoney[index].getImage,
                            backgroundColor: imagePlanMoney[index].getColor,
                            sizeBox: false,
                            bodeRadius: false,
                            appearButton: false,
                            topWidget: const Text('Du lịch'),
                            bottomWidget: const Text('100.000'),
                          )
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
