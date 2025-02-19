import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class RecentTransfers extends StatelessWidget {
  final String avatar;
  final String name;
  const RecentTransfers({super.key, required this.avatar, required this.name});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return  Column(
      children: [
        TRoundedContainer(
                  width: Responsive.screenHeight * 0.10,
                  height: Responsive.screenHeight * 0.10,
                  radius: 100,
                  backgroundColor: dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    avatar,
                    fit: BoxFit.contain,
                    height: Responsive.screenHeight * 0.40,
                  ),
                ),

                const SizedBox(height: TSizes.sm,),
                SizedBox(
                  width: Responsive.screenWidth * 0.10,
                  child: Text(name,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 8, overflow: TextOverflow.ellipsis),),
                )
      ],
    );
  }
}