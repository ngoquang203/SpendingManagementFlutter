import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/button/custom_elevated_button.dart';
import 'package:flutter_structure/common/widgets/container/custom_container_service.dart';
import 'package:flutter_structure/common/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_structure/common/widgets/text_form_field/text_form_select_date.dart';
import 'package:flutter_structure/common/widgets/texts/text_body_bold.dart';
import 'package:flutter_structure/features/shop/screens/planmoney/widget/custom_container_planmoney.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/variable/plan_money/image_planmoney.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({super.key});

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  List<bool> buttonColors = [
    true,
    false,
    false,
    false,
    false,
    false,
  ];

  List<ImagePlanMoney> imagePlanMoney = [
    ImagePlanMoney(TImages.planMoney1, Colors.blue),
    ImagePlanMoney(TImages.planMoney2, Colors.amber),
    ImagePlanMoney(TImages.planMoney3, Colors.teal),
    ImagePlanMoney(TImages.planMoney4, Colors.orange),
    ImagePlanMoney(TImages.planMoney5, Colors.redAccent),
    ImagePlanMoney(TImages.planMoney6, Colors.blueGrey),
  ];

  String image = TImages.planMoney1;
  Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainerPlanMoney(
              imagePlanMoney: image,
              backgroundColor: backgroundColor, topWidget: const Text(''), bottomWidget: const Text(''),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(TSize.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextBodyBold(title: "Bạn tạo kế hoạch để ..."),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomContainerServices(
                              icon: Iconsax.transaction_minus,
                              title: "Du lịch",
                              ontap: () =>
                                  setState(() {
                                    buttonColors = [
                                      true,
                                      false,
                                      false,
                                      false,
                                      false,
                                      false,
                                    ];
                                    image = imagePlanMoney[0].getImage;
                                    backgroundColor =
                                        imagePlanMoney[0].getColor;
                                  }),
                              backgroundColor: buttonColors[0],
                            ),
                            const SizedBox(
                              width: TSize.spaceBtwItems / 2,
                            ),
                            CustomContainerServices(
                              icon: Iconsax.transaction_minus,
                              title: "Tiếp kiệm",
                              ontap: () =>
                                  setState(() {
                                    buttonColors = [
                                      false,
                                      true,
                                      false,
                                      false,
                                      false,
                                      false,
                                    ];
                                    image = imagePlanMoney[1].getImage;
                                    backgroundColor =
                                        imagePlanMoney[1].getColor;
                                  }),
                              backgroundColor: buttonColors[1],
                            ),
                            const SizedBox(
                              width: TSize.spaceBtwItems / 2,
                            ),
                            CustomContainerServices(
                              icon: Iconsax.transaction_minus,
                              title: "Sinh hoạt",
                              ontap: () =>
                                  setState(() {
                                    buttonColors = [
                                      false,
                                      false,
                                      true,
                                      false,
                                      false,
                                      false,
                                    ];
                                    image = imagePlanMoney[2].getImage;
                                    backgroundColor =
                                        imagePlanMoney[2].getColor;
                                  }),
                              backgroundColor: buttonColors[2],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: TSize.spaceBtwItems / 2,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomContainerServices(
                              icon: Iconsax.transaction_minus,
                              title: "Dịp đặc biệt",
                              ontap: () =>
                                  setState(() {
                                    buttonColors = [
                                      false,
                                      false,
                                      false,
                                      true,
                                      false,
                                      false,
                                    ];
                                    image = imagePlanMoney[3].getImage;
                                    backgroundColor =
                                        imagePlanMoney[3].getColor;
                                  }),
                              backgroundColor: buttonColors[3],
                            ),
                            const SizedBox(
                              width: TSize.spaceBtwItems / 2,
                            ),
                            CustomContainerServices(
                              icon: Iconsax.transaction_minus,
                              title: "Vui chơi",
                              ontap: () =>
                                  setState(() {
                                    buttonColors = [
                                      false,
                                      false,
                                      false,
                                      false,
                                      true,
                                      false,
                                    ];
                                    image = imagePlanMoney[4].getImage;
                                    backgroundColor =
                                        imagePlanMoney[4].getColor;
                                  }),
                              backgroundColor: buttonColors[4],
                            ),
                            const SizedBox(
                              width: TSize.spaceBtwItems / 2,
                            ),
                            CustomContainerServices(
                              icon: Iconsax.transaction_minus,
                              title: "Khác",
                              ontap: () =>
                                  setState(() {
                                    buttonColors = [
                                      false,
                                      false,
                                      false,
                                      false,
                                      false,
                                      true,
                                    ];
                                    image = imagePlanMoney[5].getImage;
                                    backgroundColor =
                                        imagePlanMoney[5].getColor;
                                  }),
                              backgroundColor: buttonColors[5],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    const CustomTextBodyBold(title: 'Thông tin kế hoạch'),

                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    const TCustomTextFormField(
                      title: "Tên kế hoạch",
                      icon: Iconsax.play_add,
                      background: false,),
                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),
                    const TCustomTextFormField(
                      title: "Số tiền",
                      icon: Iconsax.money_recive,
                      background: false,
                    ),

                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    const TTextFieldDate(),

                    const SizedBox(
                      height: TSize.spaceBtwItems,
                    ),

                    TCustomButton(title: "Lưu kế hoạch",function: () => Get.back(),),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}








