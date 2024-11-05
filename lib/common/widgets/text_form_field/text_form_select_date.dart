
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class TTextFieldDate extends StatefulWidget {
  const TTextFieldDate({super.key});

  @override
  State<TTextFieldDate> createState() => _TTextFieldDateState();
}

class _TTextFieldDateState extends State<TTextFieldDate> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.black.withOpacity(0.1),
        labelText: "Ngày",
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
        selectDate();
      },
      controller: textEditingController,
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null) {
      textEditingController.text = picked.toString().split(" ")[0];
    }
  }
}