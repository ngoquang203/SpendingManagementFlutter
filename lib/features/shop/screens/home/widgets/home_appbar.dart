
import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/appbar/appbar.dart';
import 'package:flutter_structure/utils/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Chào mừng bạn', style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text('Ngo Quang', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
        ],
      ),
    );
  }
}