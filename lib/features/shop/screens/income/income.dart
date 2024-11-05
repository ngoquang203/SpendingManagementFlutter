import 'package:flutter/material.dart';
import 'package:flutter_structure/common/widgets/body/custom_part_screen.dart';
import 'package:flutter_structure/common/widgets/button/custom_elevated_button.dart';
import 'package:flutter_structure/common/widgets/drop_down_button/custom_drop_down_button.dart';
import 'package:flutter_structure/common/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_structure/common/widgets/text_form_field/text_form_select_date.dart';
import 'package:flutter_structure/common/widgets/text_form_field/text_form_select_time.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/variable/icon_service.dart';
import 'package:iconsax/iconsax.dart';

class InCome extends StatefulWidget {
  const InCome({super.key});

  @override
  State<InCome> createState() => _InComeState();
}

class _InComeState extends State<InCome> {

  static List<IconService> listServices = [
    IconService(TImages.outcome1, "Tiền lương"),
    IconService(TImages.outcome2, "Tiền lãi"),
    IconService(TImages.outcome3, "Kinh doanh"),
    IconService(TImages.outcome4, "Khác"),
  ];

  @override
  Widget build(BuildContext context) {
    return PartScreen(
        title: "Thêm thu",
        icon: Iconsax.money_recive,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            TCustomDropDownButton(list: listServices,),
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            const TCustomTextFormField(
              icon: Iconsax.note,
              title: "Ghi chú",
              background: false,
            ),
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            const TTextFieldDate(),
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            const TTextFieldTime(),
            const SizedBox(
              height: TSize.defaultSpace,
            ),
            const TCustomButton(
              title: "Xác nhận",
            )
          ],
        ));
  }
}


