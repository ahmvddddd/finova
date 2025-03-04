import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'screens/account/account_screen.dart';
import 'screens/cards/credit_card.dart';
import 'screens/home/home_screen.dart';
import 'screens/settings/settings.dart';
import 'screens/transfer/money_transfer.dart';
import 'utils/constants/colors.dart';
import 'utils/constants/sizes.dart';
import 'utils/helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: TColors.primary, fontWeight: FontWeight.bold, fontSize: 8);
              }
              return const TextStyle(color: Colors.grey);
            }),
          ),
          child: NavigationBar(
            height: 75,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            indicatorColor: Colors.transparent,
            backgroundColor: darkMode ? Colors.black : Colors.white,
            destinations: [
              NavigationDestination(
                icon: Icon(Iconsax.home, size: TSizes.iconSm, color: controller.selectedIndex.value == 0 ? TColors.primary : null),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.bank, size: TSizes.iconSm, color: controller.selectedIndex.value == 1 ? TColors.primary : null),
                label: 'Account',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.arrow_swap_horizontal, size: TSizes.iconSm, color: controller.selectedIndex.value == 2 ? TColors.primary : null),
                label: 'Transfer',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.card, size: TSizes.iconSm, color: controller.selectedIndex.value == 3 ? TColors.primary : null),
                label: 'Cards',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.menu, size: TSizes.iconSm, color: controller.selectedIndex.value == 4 ? TColors.primary : null),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomeScreen(),
    AccountScreen(),
    MoneyTransfer(),
    CreditCardPage(),
    SettingsScreen(),
  ];
}
