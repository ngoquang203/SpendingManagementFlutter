
import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.fullName,
              )),
          const SizedBox(height: TSize.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.money_add),
              labelText: TTexts.moneyNow,
            ),
          ),
          const SizedBox(height: TSize.spaceBtwInputFields),
        ],
      ),
    );
  }
}