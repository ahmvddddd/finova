import 'package:flutter/material.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({super.key});

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
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.xs),
                  backgroundColor: Colors.black.withOpacity(0.5),
                  width: Responsive.screenWidth * 0.70,
                  height: Responsive.screenHeight * 0.03,
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Authorized Signature',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontSize: 10),),
                Text('Not Valid Unless Signed',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontSize: 10),)
              ],
            ),
            
            const SizedBox(height: TSizes.spaceBtwItems,),
            TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.xs),
                  backgroundColor: Colors.black.withOpacity(0.1),
                  child: Text('CVV 123',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white)),
                ),
            SizedBox(
              width: Responsive.screenWidth * 0.70,
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas at nunc tempus, semper nibh nec, lacinia nunc. Vestibulum sollicitudin fringilla sapien et vulputate. Phasellus maximus magna at massa elementum, vel eleifend enim sollicitudin. Pellentesque sit amet ornare tortor, ut dapibus nisi. Aliquam leo felis, scelerisque nec posuere non, iaculis a nisi. Duis quis orci in ipsum facilisis ultricies et sit amet neque. Sed sit amet dictum arcu. Nulla non fermentum sapien. Pellentesque at erat a eros mollis venenatis ac at velit. Donec lacinia bibendum mauris vitae interdum.',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white, fontSize: 10),
              softWrap: true,
              maxLines: 4,)),
            const Spacer(),
             Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('FINOVA 2025',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white)),
            ),
          ],
        ),
      );
  }
}