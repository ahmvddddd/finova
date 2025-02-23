import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/helpers/helper_function.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: Responsive.screenHeight * 0.13,
      height: Responsive.screenHeight * 0.13,
      decoration: BoxDecoration(
        color: dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
        border: Border.all(
          width: 4,
          color: TColors.primary,
        ),
        shape: BoxShape.circle
      ),
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        TImages.avatar,
        fit: BoxFit.contain,
        height: Responsive.screenHeight * 0.40,
      ),);
  }
}