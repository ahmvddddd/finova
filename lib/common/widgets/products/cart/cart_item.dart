// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //image
        TRoundedImage(imageUrl: TImages.productImage1,
        width: 60,
        height: 60,
        padding: EdgeInsets.all(TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        //Title, price and size
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBrandTitleTextWithVerifiedIcon(title: 'Nike'),
            Flexible(child: TProductTitleText(title: 'Black Sports Kicks', maxlines: 1,)),

            //Attributes
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: ' Green', style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: ' Size', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: ' Uk 08', style: Theme.of(context).textTheme.bodyLarge),
                ]
              )
            )
          ],
        )
      ],
    );
  }
}