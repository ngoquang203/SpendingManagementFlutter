import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';

class HomeSpendCollectText extends StatelessWidget {
  const HomeSpendCollectText({
    super.key,
    this.money = 0, required this.title, required this.color,
  });
  final String title;
  final double? money;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2)
          ),
        ),
        const SizedBox(width: TSize.sm,),
        Text(
          '$title: ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        Text(
          '${money}VND',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: TColors.white),
        ),
      ],
    );
  }
}