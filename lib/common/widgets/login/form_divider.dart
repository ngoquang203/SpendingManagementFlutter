
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dark, required this.textDivider,
  });

  final bool dark;
  final String textDivider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(textDivider,style: Theme.of(context).textTheme.labelMedium,),

        Flexible(
            child: Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}