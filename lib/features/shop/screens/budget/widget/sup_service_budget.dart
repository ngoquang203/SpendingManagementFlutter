import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/texts/text_body.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';

class SupServiceBudget extends StatelessWidget {
  const SupServiceBudget({
    super.key,
    required this.title,
    required this.color,
    required this.money,
  });

  final String title;
  final Color color;
  final String money;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSize.defaultSpace / 2,
          vertical: TSize.spaceBtwItems / 2),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(TSize.borderRadiusMd),
        ),
        child: Row(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: TSize.spaceBtwItems),
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: color,
                ),
              ),
            ),
            CustomTextBody(title: title),
            Expanded(
                flex: 1,
                child: CustomTextBody(
                  title: money,
                  positionText: false,
                )),
            const SizedBox(
              width: TSize.spaceBtwItems,
            )
          ],
        ),
      ),
    );
  }
}