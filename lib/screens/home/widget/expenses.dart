import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
              radius: TSizes.cardRadiusSm,
        backgroundColor:
            dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Iconsax.arrow_swap_horizontal,
              size: TSizes.iconSm,
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
            Text(
              'Expenses in February 2025',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(
              height: TSizes.xs,
            ),
            Text(
              '\u20A68,256.09',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontFamily: 'JosefinSans'),
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: TSizes.md,
                  width: Responsive.screenWidth * 0.25,
                  color: Colors.red[900],
                ),
                Container(
                  height: TSizes.md,
                  width: Responsive.screenWidth * 0.20,
                  color: Colors.orange[700],
                ),
                Container(
                    height: TSizes.md,
                    width: Responsive.screenWidth * 0.18,
                    color: Colors.blue[900]),
                Container(
                  height: TSizes.md,
                  width: Responsive.screenWidth * 0.13,
                  color: Colors.green[900],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
