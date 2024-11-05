
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class TTextFieldTime extends StatefulWidget {
  const TTextFieldTime({super.key});

  @override
  State<TTextFieldTime> createState() => _TTextFieldTimeState();
}

class _TTextFieldTimeState extends State<TTextFieldTime> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.black.withOpacity(0.1),
        labelText: "Giờ",
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        filled: true,
        prefixIcon: const Icon(
          Iconsax.calendar_add,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: TColors.grey),
            borderRadius: BorderRadius.circular(15)),
      ),
      readOnly: true,
      onTap: () {
        selectTime();
      },
      controller: textEditingController,
    );
  }

  Future<void> selectTime() async {
    TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      textEditingController.text = picked.toString().split(" ")[0];
    }
  }
}