import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CustomContainerPlanMoney extends StatelessWidget {
  const CustomContainerPlanMoney(
      {super.key,this.appearButton = true,this.bodeRadius = true,this.sizeBox = true, required this.imagePlanMoney, required this.backgroundColor,required this.topWidget , required this.bottomWidget});

  final String imagePlanMoney;
  final Color backgroundColor;

  final bool sizeBox;
  final bool bodeRadius;
  final bool appearButton;

  final Widget topWidget;
  final Widget bottomWidget;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeBox ? 200 : 120,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: bodeRadius ? const Radius.circular(0) : const Radius.circular(TSize.borderRadiusLg),
            topRight: bodeRadius ? const Radius.circular(0) : const Radius.circular(TSize.borderRadiusLg),
            bottomLeft: const Radius.circular(TSize.borderRadiusLg),
            bottomRight: const Radius.circular(TSize.borderRadiusLg),
          )),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwItems),
            child: Image.asset(
              imagePlanMoney,
              height: sizeBox ? 200 : 150,
              width: double.infinity,
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child:
              appearButton ?
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Iconsax.arrow_left,
                    color: Colors.white,
                  ))  : topWidget),
          Positioned(child: bottomWidget, bottom: TSize.spaceBtwItems, left: TSize.spaceBtwItems,)
        ],
      ),
    );
  }
}