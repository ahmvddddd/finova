import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../models/utility_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';

class QuickUtilities extends StatefulWidget {
  const QuickUtilities({super.key});

  @override
  State<QuickUtilities> createState() => _QuickUtilitiesState();
}

class _QuickUtilitiesState extends State<QuickUtilities> {
  

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: Responsive.screenHeight * 0.10,
      itemCount: utilities.length,
      crossAxisCount: 4,
      itemBuilder: (context, index) {
        return TRoundedContainer(
                width: Responsive.screenWidth * 0.20,
                height: Responsive.screenHeight * 0.10,
                padding: const EdgeInsets.all(TSizes.xs),
                backgroundColor: TColors.primary.withOpacity(0.3),
                borderColor: TColors.primary,
                radius: TSizes.cardRadiusSm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(utilities[index]["icon"], color: TColors.primary),
                  const SizedBox(height: TSizes.xs),
                  Text(
                    utilities[index]["text"],
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: TColors.primary, fontSize: 8),
                    softWrap: true,
                  )
                ]));
      },
    );
  }
}
