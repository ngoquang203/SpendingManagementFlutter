import 'package:flutter/material.dart';
import 'package:flutter_structure/common/styles/spacing_styles.dart';
import 'package:flutter_structure/common/widgets/login/form_divider.dart';
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/navigation_menu.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:flutter_structure/utils/constants/image_strings.dart';
import 'package:flutter_structure/utils/constants/sizes.dart';
import 'package:flutter_structure/utils/constants/text_strings.dart';
import 'package:flutter_structure/utils/device/device_utility.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            // logo, title, subTitle
            LoginHeader(dark: dark),

            // form
            const LoginForm(),

            // button save info
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Get.to(() => const NavigationMenu());
                    },
                    child: const Text(TTexts.confirmSaveInfo))),
            const SizedBox(height: TSize.spaceBtwItems),



            // divider
            FormDivider(dark: dark,textDivider: TTexts.subConfirmSaveInfo,),
          ],
        ),
      ),

    );


  }

}







