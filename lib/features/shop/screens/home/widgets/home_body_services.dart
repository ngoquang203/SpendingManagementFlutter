import 'package:flutter/material.dart';
import 'package:flutter_structure/features/shop/screens/home/widgets/home_button_circular.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class HomeBodyServices extends StatelessWidget {
  const HomeBodyServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButtonCircular(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(TSize.sm),
                    child: Icon(Iconsax.money_recive),
                  ),
                  Text(
                    'Thêm thu',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSize.spaceBtwItems),
              child: HomeButtonCircular(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(TSize.sm),
                      child: Icon(Iconsax.money_send),
                    ),
                    Text(
                      'Thêm chi',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
            HomeButtonCircular(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(TSize.sm),
                    child: Icon(Iconsax.wallet),
                  ),
                  Text(
                    'Kế hoạch',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButtonCircular(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(TSize.sm),
                    child: Icon(Iconsax.wallet),
                  ),
                  Text(
                    'Kế hoạch',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSize.spaceBtwItems),
              child: HomeButtonCircular(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(TSize.sm),
                      child: Icon(Iconsax.add),
                    ),
                    Text(
                      'Title Button',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
            HomeButtonCircular(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(TSize.sm),
                    child: Icon(Iconsax.add),
                  ),
                  Text(
                    'Title Button',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: TSize.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButtonCircular(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(TSize.sm),
                    child: Icon(Iconsax.add),
                  ),
                  Text(
                    'Title Button',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSize.spaceBtwItems),
              child: HomeButtonCircular(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(TSize.sm),
                      child: Icon(Iconsax.add),
                    ),
                    Text(
                      'Title Button',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
            HomeButtonCircular(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(TSize.sm),
                    child: Icon(Iconsax.add),
                  ),
                  Text(
                    'Title Button',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
