import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:get/get.dart';

class TCustomButton extends StatelessWidget {
  const TCustomButton({super.key, required this.title,
    this.function, this.color = Colors.blue});

  final String title;
  final void Function()? function;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          side: BorderSide(
            color: color!
          )
        ),
        onPressed: function ?? () => Get.back(),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: TColors.white),
        ),
      ),
    );
  }
}
