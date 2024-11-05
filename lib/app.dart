
import 'package:flutter/material.dart';
import 'package:flutter_structure/features/personalization/screens/login/login.dart';
import 'package:flutter_structure/features/personalization/screens/onboarding/onboarding.dart';
import 'package:flutter_structure/features/shop/screens/home/home.dart';
import 'package:flutter_structure/utils/theme/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/constants/colors.dart';

class App extends StatefulWidget {
  const App({super.key});


  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _passScreen = false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPassScreen();
  }

  void _loadPassScreen() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _passScreen = (prefs.getBool('passOnBoarding') ?? false);
    });


  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        backgroundColor: TColors.primaryColor,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}