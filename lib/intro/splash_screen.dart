import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../navigation_menu.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  final List<Map<String, String>> pages = [
    {
      "animation": TImages.bankAnimation,
      "title": "Secure Banking",
      "subtitle": "Your transactions are encrypted and secure."
    },
    {
      "animation": TImages.successAnimation,
      "title": "Fast Transactions",
      "subtitle": "Send and receive money instantly."
    },
    {
      "animation": TImages.bankAnimation,
      "title": "Smart Investments",
      "subtitle": "Grow your wealth with smart banking solutions."
    },
  ];

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(TSizes.spaceBtwItems),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    splashController.updatePage(index);
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          pages[index]["animation"]!,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          pages[index]["title"]!,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            pages[index]["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: splashController.currentPage.value == index
                            ? 12
                            : 8,
                        height: splashController.currentPage.value == index
                            ? 12
                            : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: splashController.currentPage.value == index
                              ? TColors.primary
                              : Colors.grey,
                        ),
                      ), 
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextButton(
                    onPressed: () {
                      if (splashController.currentPage.value ==
                          pages.length - 1) {
                        // Get.offNamed('/home'); // Navigate to home
                        Get.to(() => const NavigationMenu());
                      } else {
                        splashController
                            .updatePage(splashController.currentPage.value + 1);
                      }
                    },
                    child: Text(
                      splashController.currentPage.value == pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: TColors.primary),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
