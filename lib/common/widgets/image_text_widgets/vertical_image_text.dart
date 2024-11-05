
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap, required this.iconData, required this.iconColor,
  });

  final IconData iconData;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtwItems),
        child: Column(
          children: [
            // circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSize.sm),
              decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Icon(iconData,color: backgroundColor)
              ),
            ),

            // text
            const SizedBox(
              height: TSize.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}