import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/colors.dart';

class TCustomTextFormField extends StatelessWidget {
  const TCustomTextFormField(
      {super.key,
        required this.title,
        required this.icon,
        this.background = true});

  final String title;
  final IconData icon;
  final bool background;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,

        fillColor: background
            ? Colors.black.withOpacity(0.2)
            : Colors.black.withOpacity(0.1),
        prefixIcon: Icon(
          icon,
          color: background ? TColors.grey : TColors.dark,
        ),
        labelText: title,
        labelStyle: Theme.of(context).textTheme.bodyMedium!.apply(
          color: background ? TColors.white : TColors.black,
        ),
        floatingLabelStyle: Theme.of(context).textTheme.bodyMedium!.apply(
          color: background ? TColors.white : TColors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium!.apply(
        color: background ? TColors.white : TColors.black,
      ),
    );
  }
}