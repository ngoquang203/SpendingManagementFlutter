import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/appbar/appbar.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_structure/common/widgets/custom_shapes/containers/search_bar_container.dart';
import 'package:flutter_structure/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_structure/common/widgets/listviews/listview_services.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/device/device_utility.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:flutter_structure/utils/variable/icon_service.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Lịch sử',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 150,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(horizontal: TSize.defaultSpace,vertical: TSize.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: TSize.spaceBtwItems,
                      ),
                      TSearchContainer(
                        text: 'Tìm kiếm giao dịch',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      // SizedBox(height: TSize.spaceBtwItems / 2,),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //         flex: 1,
                      //         child: Text(
                      //           'Các giao dịch',
                      //           style: Theme.of(context).textTheme.headlineSmall,
                      //         )),
                      //     Expanded(
                      //         flex: 1,
                      //         child: TextButton(
                      //             onPressed: () {},
                      //             style:
                      //                 ButtonStyle(alignment: Alignment.topRight),
                      //             child: Text(
                      //               'Xem tất cả',
                      //               textAlign: TextAlign.end,
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .headlineSmall!
                      //                   .apply(color: TColors.primaryColor),
                      //             ))),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                bottom: TabBar(

                  isScrollable: true,
                  indicatorColor: TColors.primaryColor,
                  unselectedLabelColor: TColors.darkGrey,
                  labelColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                  tabs: [
                    Tab(child: Text('Xem tất cả')),
                    Tab(child: Text('Thu tien')),
                    Tab(child: Text('Chi tien')),
                  ],
                ),
              ),

            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSize.defaultSpace,vertical: TSize.defaultSpace/2),
            child: TabBarView(
              children: [
                ListViewServices(list: list),
                ListViewServices(list: list),
                ListViewServices(list: list),
              ],
            ),
          )

        ),
      ),
    );
  }
}
