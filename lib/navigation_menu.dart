import 'package:flutter/material.dart';
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/screens/budget/budget.dart';
import 'package:flutter_structure/features/shop/screens/home/home.dart';
import 'package:flutter_structure/features/shop/screens/profile/profile.dart';
import 'package:flutter_structure/features/shop/screens/transaction/transaction.dart';
import 'package:flutter_structure/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'utils/constants/colors.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(

      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Trang chủ'),
            NavigationDestination(icon: Icon(Iconsax.transaction_minus), label: 'Lịch sử'),
            NavigationDestination(icon: Icon(Iconsax.chart_square), label: 'Báo cáo'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Cá nhân'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const TransactionScreen(),
    const BudgetScreen(),
    const ProfileScreen(),
  ];

}
