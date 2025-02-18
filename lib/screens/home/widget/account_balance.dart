import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: Responsive.screenWidth * 0.90,
      backgroundColor:
          dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
      radius: TSizes.cardRadiusSm,
      padding: const EdgeInsets.all(TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: TSizes.xs,
          ),
          Text(
            '\$12,596.00',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: TSizes.md,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: TColors.darkerGrey,
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusXs)),
                child: Text(
                  'Savings',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
