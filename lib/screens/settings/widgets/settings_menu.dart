import 'package:flutter/material.dart';

import '../../../common/widgets/layouts/list_view.dart';
import '../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../models/settings_model.dart';
import '../../../utils/constants/sizes.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeListView(
      scrollDirection: Axis.vertical,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      seperatorBuilder: (context, index) => const SizedBox(height: TSizes.sm),
      itemCount: settingsList.length,
      itemBuilder: (context, index) {
        return TSettingsMenuTile(
          icon: Icons.circle,
          title: settingsList[index]["title"],
          subTitle: settingsList[index]["subtitle"],
          trailing: const Icon(Icons.arrow_right, size: TSizes.iconSm),
        );
      },
    );
  }
}
