import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  TGridLayout(
      itemCount: 2,
      mainAxisExtent: Responsive.horizontalCardHeight * 0.80,
      itemBuilder: (context, index) {
    final dark = THelperFunctions.isDarkMode(context);
        return TRoundedContainer(
                        width: Responsive.cardWidth,
                        padding: const EdgeInsets.all(TSizes.xs),
                        backgroundColor: dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                        radius: TSizes.cardRadiusMd,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.star,
                            size: TSizes.iconMd,
                            ),
                            
                            const SizedBox(height: TSizes.sm),
                            Text('Savings',
                            style: Theme.of(context).textTheme.labelSmall,),
                            const SizedBox(height: TSizes.xs),
                            SizedBox(width: Responsive.tabIconWidth,
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas at nunc tempus, semper nibh nec, lacinia nunc.',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: TColors.darkerGrey, fontSize: 8, overflow: TextOverflow.ellipsis),
                            softWrap: true,
                            ),),

                            const SizedBox(height: TSizes.sm,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: TSizes.xs,),
                                TextButton(onPressed: () {}, 
                                style: TextButton.styleFrom(backgroundColor: TColors.darkerGrey.withOpacity(0.5)),
                                child: Text('upgrade',
                                style: Theme.of(context).textTheme.labelSmall,))
                              ],
                            )
                          ],
                        ),
                      );
      },
    );
  }
}