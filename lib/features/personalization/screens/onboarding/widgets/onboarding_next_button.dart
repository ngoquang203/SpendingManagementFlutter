
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/personalization/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/device/device_utility.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSize.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primaryColor : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
