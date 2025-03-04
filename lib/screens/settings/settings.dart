import 'package:flutter/material.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/settings_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text('Settings',
        style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Responsive.padding),
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwSections),
                const SettingsMenu(),

                const SizedBox(height: TSizes.spaceBtwSections),
                TextButton(
                  onPressed: () {},
                  child:Text(
                      "Logout",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: TColors.primary),
                    ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}