
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:flutter_structure/utils/variable/icon_service.dart';

class ListViewServices extends StatelessWidget {
  const ListViewServices({super.key, required this.list});
  final List<IconService> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(
                bottom: TSize.spaceBtwItems / 1.2),
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: TSize.spaceBtwItems),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: THelperFunctions.isDarkMode(context) ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2) ,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Image.asset(
                        list[index].stringIcon,
                        scale: 1.5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge,
                        ),
                        Text(
                          "Sup Title category",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.darkGrey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: TSize.spaceBtwItems),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+ 100,000 VND",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge,
                        ),
                        Text(
                          "20/06/2024",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.darkGrey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    )
    ;
  }
}