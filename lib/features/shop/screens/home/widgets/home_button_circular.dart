import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';

class HomeButtonCircular extends StatelessWidget {
  const HomeButtonCircular({
    super.key,
    this.child,
    this.width = 100,
    this.height = 90,
    this.radius = 10,
    this.padding = 0,
    this.onTap,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: dark
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
        ),
        child: child,
      ),
    );
  }
}
