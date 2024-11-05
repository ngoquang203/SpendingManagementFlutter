import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_structure/common/widgets/listviews/listview_services.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:flutter_structure/utils/variable/icon_service.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_body_services.dart';
import 'widgets/home_container_money_sevice.dart';
import 'widgets/home_listview_devices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconService> list = [
    IconService(TImages.income1, "Hằng ngày"),
    IconService(TImages.income2, "Sức khỏe"),
    IconService(TImages.income3, "Giáo dục"),
    IconService(TImages.income4, "Du lịch"),
    IconService(TImages.income5, "Giải trí"),
    IconService(TImages.income6, "Xã hội"),
    IconService(TImages.income7, "Đầu tư"),
    IconService(TImages.income8, "Khác"),
    IconService(TImages.outcome1, "Tiền lương"),
    IconService(TImages.outcome2, "Tiền lãi"),
    IconService(TImages.outcome3, "Kinh doanh"),
    IconService(TImages.outcome4, "Khác"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // appbar
                  SizedBox(
                    height: TSize.spaceBtwItems,
                  ),
                  HomeAppBar(),

                  // categories
                  SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),

                  ContainerMoneySevice(),

                  SizedBox(
                    height: TSize.spaceBtwItems / 2,
                  ),
                  HomeListViewDevices(),
                ],
              ),
            ),
            // body
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSize.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Giao dịch gần đây",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.start,
                  ),
                  ListViewServices(list: list,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



