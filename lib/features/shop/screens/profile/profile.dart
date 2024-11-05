import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/appbar/appbar.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_structure/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryHeaderContainer(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // appbar
                  SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cài đặt',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white),
                        ),
                      ],
                    ),
                  ),
                  // avatar
                  CircleAvatar(
                    child: Text(
                      'Q',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    backgroundColor: TColors.white,
                    radius: 50,
                  ),
                  SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  Text(
                    'Ngo Quang',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.white),
                  ),
                ],
              ),
            ),
            // body

            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  ContainerSetting(iconData: Iconsax.add,title: "Thông tin",color: TColors.info.withOpacity(0.3),),
                  SizedBox(height: TSize.spaceBtwItems,),
                  ContainerSetting(iconData: Iconsax.add,title: "Thông tin",color: TColors.info.withOpacity(0.3),),
                  SizedBox(height: TSize.spaceBtwItems,),
                  ContainerSetting(iconData: Iconsax.add,title: "Thông tin",color: TColors.info.withOpacity(0.3),),
                  SizedBox(height: TSize.spaceBtwItems,),
                  ContainerSetting(iconData: Iconsax.add,title: "Thông tin",color: TColors.info.withOpacity(0.3),),
                  SizedBox(height: TSize.spaceBtwItems,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerSetting extends StatelessWidget {
  const ContainerSetting({
    super.key, required this.iconData, required this.title, required this.color,
  });
  final IconData iconData;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          child: Icon(iconData),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: TSize.spaceBtwItems,),
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Icon(Icons.arrow_forward_ios_sharp),
      ],
    );
  }
}
