
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_structure/features/personalization/screens/onboarding/onboarding.dart';
import 'package:flutter_structure/features/shop/screens/home/home.dart';
import 'package:flutter_structure/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }



  screenRedirect() async{
    // local storage


    if(deviceStorage.read('isFirstTime') == null){
      deviceStorage.write('isFirstTime', true);
    }
    if(kDebugMode){
      print('============================= GET STORAGE ====================');
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.read('isFirstTime') == true ? Get.offAll(() => const OnBoardingScreen()) : Get.offAll(Get.to(() => const NavigationMenu()));
  }

}