

import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:flutter_structure/utils/variable/icon_service.dart';

class TCustomDropDownButton extends StatefulWidget {
  const TCustomDropDownButton({super.key, required this.list});

  final List<IconService> list;

  @override
  State<TCustomDropDownButton> createState() => _TCustomDropDownButtonState();
}

class _TCustomDropDownButtonState extends State<TCustomDropDownButton> {
  late final List<IconService> listServices;
  late IconService dropdownValue;
  @override
  void initState() {
    listServices = widget.list;
    dropdownValue = listServices.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding:
      const EdgeInsets.symmetric(horizontal: TSize.defaultSpace / 2, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black.withOpacity(0.1),
      ),
      child: DropdownButton(
        hint: const Text("Lựa chọn"),
        dropdownColor: TColors.grey,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        style: Theme.of(context).textTheme.bodyMedium,
        underline: const SizedBox(),
        value: dropdownValue,
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue as IconService;
          });
        },
        items: listServices.map(
              (valueItem) {
            return DropdownMenuItem(
              value: valueItem,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: TSize.spaceBtwItems),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: THelperFunctions.isDarkMode(context)
                            ? Colors.white.withOpacity(0.2)
                            : Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset(
                        valueItem.getStringIcon,
                        scale: 2.5,
                      ),
                    ),
                  ),
                  Text(valueItem.getTitle),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}