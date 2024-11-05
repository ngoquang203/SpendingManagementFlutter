
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
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class OutCome extends StatefulWidget {
  const OutCome({super.key});

  @override
  State<OutCome> createState() => _OutComeState();
}

class _OutComeState extends State<OutCome> {
  static List<IconService> listServices = [
    IconService(TImages.income1, "Đời sống"),
    IconService(TImages.income2, "Sức khỏe"),
    IconService(TImages.income3, "Giáo dục"),
    IconService(TImages.income4, "Du lịch"),
    IconService(TImages.income5, "Giải trí"),
    IconService(TImages.income6, "Xã hội"),
    IconService(TImages.income7, "Đầu tư"),
    IconService(TImages.income8, "Khác"),
  ];

  @override
  Widget build(BuildContext context) {
    return PartScreen(
        title: "Thêm chi",
        background: false,
        icon: Iconsax.money_send,
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
        )
    );
  }
}
