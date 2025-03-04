import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth * 0.90,
      height: Responsive.verticalCardHeight,
      padding: const EdgeInsets.all(TSizes.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        gradient: TColors.linearGradient 
      ),
      child: Column(
            children: [
              const SizedBox(height: TSizes.sm,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                  Image.asset(TImages.contactLess, height: TSizes.iconMd),
                  const SizedBox(width: TSizes.md,),
              Text('FINOVA',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
              ],
                  ),
                  Image.asset(TImages.masterCard, height: TSizes.iconLg * 2),
                ],
              ),

              const SizedBox(height: TSizes.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
            '\u20A67,000.00',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white, fontFamily: 'JosefinSans'),
          ),
                ]
              ),

              const SizedBox(height: TSizes.sm,),
              Text('**** **** **** 1234',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white)),
              const SizedBox(height: TSizes.spaceBtwSections),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('John Doe',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white,)),
                      const SizedBox(width: TSizes.imageThumbSize,),
               Text('12/25',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
                 ],
               ),
            ],
          ),
    );
  }
}