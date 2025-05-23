import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: TSizes.iconSm, color: TColors.primary),
      title: Text(title, style:  Theme.of(context).textTheme.labelMedium,),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: TColors.darkerGrey)),
      trailing: trailing,
      onTap: onTap,
    );
  }
}