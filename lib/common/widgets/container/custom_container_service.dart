
import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/texts/text_body.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';

class CustomContainerServices extends StatefulWidget {
  CustomContainerServices({
    super.key,
    required this.icon,
    required this.title,
    this.backgroundColor = false,
    this.ontap,
  });

  final IconData icon;
  final String title;
  bool backgroundColor = false;
  final void Function()? ontap;

  @override
  State<CustomContainerServices> createState() =>
      _CustomContainerServicesState();
}

class _CustomContainerServicesState extends State<CustomContainerServices> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: TSize.spaceBtwItems / 2,
          vertical: TSize.spaceBtwItems / 2,
        ),
        decoration: BoxDecoration(
            color: widget.backgroundColor
                ? Colors.blue.withOpacity(0.3)
                : Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(TSize.borderRadiusMd)),
        child: Row(
          children: [
            Icon(widget.icon),
            const SizedBox(
              width: TSize.sm,
            ),
            CustomTextBody(title: widget.title),
          ],
        ),
      ),
    );
  }
}