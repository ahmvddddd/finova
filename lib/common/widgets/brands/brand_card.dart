import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/t_circular_image.dart';
import '../texts/t_brand_title_text_with_verified_icon.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
    onTap: onTap,
    //container image
    child: TRoundedContainer(
      showBorder: showBorder,
      padding: const EdgeInsets.all(TSizes.sm),
      backgroundColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Flexible(
            child: TCircularImage(
              isNetworkImage: false,
              image: TImages.darkAppLogo,
              backgroundColor: Colors.transparent,
              overlayColor: isDark ? TColors.white : TColors.black,
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 2,),
                    
          //Text
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TBrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
                Text( '256 products available in store',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          )
      ],
      ),
      ),
                    );
  }
}
