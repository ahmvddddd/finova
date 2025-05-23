// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_function.dart';

class TAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const TAppBar({super.key, 
  this.title,
  this.showBackArrow = false,
  this.leadingIcon, 
  this.actions, 
  this.leadingOnPressed,
  }); 

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
        ? IconButton(onPressed: () => Get.back(), icon:  Icon(Iconsax.arrow_left, color: dark ? TColors.white : TColors.dark,))
        : leadingIcon != null 
        ? IconButton(onPressed: leadingOnPressed, icon:  Icon(leadingIcon))
        : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  //Todo: implement preferred Size
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}