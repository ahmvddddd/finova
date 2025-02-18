import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../models/transaction_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';

class QuickTransactions extends StatelessWidget {
  const QuickTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: transactions.length,
      crossAxisCount: 3,
      mainAxisExtent: Responsive.screenHeight * 0.05,
      itemBuilder: (context, index) {
        return TRoundedContainer(
          width: Responsive.screenWidth * 0.28,
          padding: const EdgeInsets.all(TSizes.xs),
          backgroundColor: TColors.primary,
            radius: TSizes.cardRadiusSm,
          child: Column(
            children: [
               Icon(
               transactions[index]["icon"],
                color: Colors.white,
                size: TSizes.iconSm,
              ),
              Text(
                transactions[index]["text"],
                style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontSize: 10),
              )
            ],
          ),
        );
      }
    );
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     TRoundedContainer(
    //       width: Responsive.screenWidth * 0.28,
    //       padding: const EdgeInsets.all(TSizes.xs),
    //       backgroundColor: TColors.primary,
    //         radius: TSizes.cardRadiusSm,
    //       child: Column(
    //         children: [
    //           const Icon(
    //             Iconsax.arrow_up_3,
    //             color: Colors.white,
    //             size: TSizes.iconSm,
    //           ),
    //           Text(
    //             'Withdraw',
    //             style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontSize: 10),
    //           )
    //         ],
    //       ),
    //     ),
    //     TRoundedContainer(
    //       width: Responsive.screenWidth * 0.28,
    //       padding: const EdgeInsets.all(TSizes.xs),
    //       backgroundColor: TColors.primary,
    //         radius: TSizes.cardRadiusSm,
    //       child: Column(
    //         children: [
    //           const Icon(
    //             Iconsax.arrow_down,
    //             color: Colors.white,
    //             size: TSizes.iconSm,
    //           ),
    //           Text(
    //             'Deposit',
    //             style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontSize: 10),
    //           )
    //         ],
    //       ),
    //     ),
    //     TRoundedContainer(
    //       width: Responsive.screenWidth * 0.28,
    //       padding: const EdgeInsets.all(TSizes.xs),
    //       backgroundColor: TColors.primary,
    //         radius: TSizes.cardRadiusSm,
    //       child: Column(
    //         children: [
    //           const Icon(
    //             Iconsax.arrow_swap_horizontal,
    //             color: Colors.white,
    //             size: TSizes.iconSm,
    //           ),
    //           Text(
    //             'Transfer',
    //             style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontSize: 10),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
