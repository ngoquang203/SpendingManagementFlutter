
import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/appbar/appbar.dart';
import 'package:flutter_structure/common/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';

class PartScreen extends StatelessWidget {
  const PartScreen(
      {super.key,
        required this.title,
        required this.child,
        required this.icon, this.background = true,
       this.unLock = true,
      this.image});

  final String title;
  final Widget child;
  final IconData icon;
  final bool background;
  final bool? unLock;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background ? Colors.teal : Colors.red[400],
      appBar: TAppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: TSize.defaultSpace,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
            child: unLock == true ? TCustomTextFormField(
              icon: icon,
              title: "Nhập số tiền",
            ) : image,
          ),
          const SizedBox(
            height: TSize.defaultSpace,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSize.borderRadiusLg),
                      topRight: Radius.circular(TSize.borderRadiusLg))),
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}