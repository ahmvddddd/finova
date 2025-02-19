import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class TransactionHistory extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final String transactionType;
  final String amount;
  const TransactionHistory(
      {super.key,
      required this.icon,
      required this.color,
      required this.name,
      required this.transactionType,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: Responsive.screenWidth * 0.70,
      padding: const EdgeInsets.all(TSizes.sm),
      radius: TSizes.cardRadiusSm,
      backgroundColor:
          dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //icon and name
          Row(
            children: [
              TRoundedContainer(
                radius: 100,
                padding: const EdgeInsets.all(TSizes.xs),
                borderColor: color,
                child: Icon(icon, color: color, size: TSizes.iconSm),
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                transactionType,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                amount,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: color),
              )
            ],
          )
        ],
      ),
    );
  }
}
