import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/layouts/list_view.dart';
import '../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../models/account_details_model.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/account_avatar.dart';
import 'widgets/account_info.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Account',
          style: Theme.of(context).textTheme.headlineSmall),
          showBackArrow: false
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(Responsive.padding),
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwSections,),
                const AccountAvatar(),
                  const SizedBox(height: TSizes.sm,),
                  Text('John Doe',
                  style: Theme.of(context).textTheme.bodySmall,),

                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const AccountInfo(),

                  const SizedBox(height: TSizes.spaceBtwItems,),
                  HomeListView(
                      scrollDirection: Axis.vertical,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      seperatorBuilder: (context, index) =>
                          const SizedBox(height: TSizes.sm),
                      itemCount: accountDetailsList.length,
                      itemBuilder: (context, index) {
                        return TSettingsMenuTile(
                    icon: accountDetailsList[index]["icon"],
                    title: accountDetailsList[index]["title"],
                    subTitle: accountDetailsList[index]["subtitle"],
                    trailing: const Icon(Iconsax.arrow_right),
                  );
                      },
                    ),

              ],
            ),
          ),
        )
      )
    );
  }
}
